//  FMCSyncProxy.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <ExternalAccessory/ExternalAccessory.h>
#import <objc/runtime.h>
#import <AppLink/FMCDebugTool.h>
#import <AppLink/FMCEncodedSyncPData.h>
#import <AppLink/FMCFunctionID.h>
#import <AppLink/FMCJsonDecoder.h>
#import <AppLink/FMCJsonEncoder.h>
#import <AppLink/FMCLanguage.h>
#import <AppLink/FMCNames.h>
#import <AppLink/FMCSiphonServer.h>
#import <AppLink/FMCSyncProxy.h>
#import <AppLink/FMCSystemRequest.h>
#import "FMCRPCPayload.h"


#define VERSION_STRING @"##Version##"
typedef void(^FMCCustomTaskCompletionHandler)(NSData *data, NSURLResponse *response, NSError *error);


@interface FMCSyncProxy ()

- (void)invokeMethodOnDelegates:(SEL)aSelector withObject:(id)object;
- (void)notifyProxyClosed;
- (void)handleProtocolMessage:(FMCAppLinkProtocolMessage *)msgData;
- (void)OESPHTTPRequestCompletionHandler:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error;
- (void)OSRHTTPRequestCompletionHandler:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error;

@end



@implementation FMCSyncProxy

const float handshakeTime = 30.0;
const float notifyProxyClosedDelay = 0.1;
const int POLICIES_CORRELATION_ID = 65535;


#pragma mark - Object lifecycle
- (id)initWithTransport:(NSObject<FMCTransport> *)theTransport protocol:(NSObject<FMCProtocol> *)theProtocol delegate:(NSObject<FMCProxyListener> *)theDelegate {
	if (self = [super init]) {        
        rpcSessionID = 0;
        alreadyDestructed = NO;
                
        self.proxyListeners = [[NSMutableArray alloc] initWithObjects:theDelegate, nil];
        self.protocol = theProtocol;
        self.transport = theTransport;
        self.transport.delegate = self.protocol;
        self.protocol.protocolDelegate = self;
        self.protocol.transport = self.transport;
        [self.transport connect];

        [[EAAccessoryManager sharedAccessoryManager] registerForLocalNotifications];

    }

    return self;
}

-(void) destructObjects {
    if(!alreadyDestructed) {
        alreadyDestructed = YES;

        self.transport = nil;
        self.protocol = nil;
        self.proxyListeners = nil;

        [self destroyHandshakeTimer];
    }
}

-(void) dispose {
    [self destructObjects];
}

-(void) dealloc {
    [self destructObjects];
}

-(void) notifyProxyClosed {
	if (isConnected) {
		isConnected = NO;
        [self invokeMethodOnDelegates:@selector(onProxyClosed) withObject:nil];
	}
}


#pragma mark - Pseudo properties
- (NSObject<FMCTransport> *)getTransport {
    return self.transport;// not needed except for backwards compatability?
}

- (NSObject<FMCProtocol> *)getProtocol {
    return self.protocol;// not needed except for backwards compatability?
}

- (NSString *)getProxyVersion {
    return VERSION_STRING;
}

- (NSString *)proxyVersion { // How it should have been named.
    return VERSION_STRING;
}


#pragma mark - Handshake Timer
- (void)handshakeTimerFired {
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: Init Handshake Timeout"]];
    [FMCDebugTool logInfo:@"Proxy: Init Handshake Timeout"];

    [self destroyHandshakeTimer];
    [self performSelector:@selector(notifyProxyClosed) withObject:nil afterDelay:notifyProxyClosedDelay];
}

-(void)destroyHandshakeTimer {
    if (self.handshakeTimer != nil) {
        [self.handshakeTimer invalidate];
        self.handshakeTimer = nil;
    }
}


#pragma mark - FMCProtocolListener Implementation
- (void) onProtocolOpened {
    isConnected = YES;
    [FMCDebugTool logInfo:@"StartSession (request)" withType:FMCDebugType_RPC];

    [self.protocol sendStartSessionWithType:FMCServiceType_RPC];

    [self destroyHandshakeTimer];
    self.handshakeTimer = [NSTimer scheduledTimerWithTimeInterval:handshakeTime target:self selector:@selector(handshakeTimerFired) userInfo:nil repeats:NO];
}

-(void) onProtocolClosed {
	[self notifyProxyClosed];
}

-(void) onError:(NSString*) info exception:(NSException*) e {
    [self invokeMethodOnDelegates:@selector(onError:) withObject:e];
}

- (void)handleProtocolSessionStarted:(FMCServiceType)sessionType sessionID:(Byte)sessionID version:(Byte)maxVersionForModule {
    NSString *logMessage = [NSString stringWithFormat:@"Session %d started.", sessionID];
    [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Protocol];

    if (_version <= 1) {
        if (maxVersionForModule == 2) {
            _version = maxVersionForModule;
        }
    }

    if (sessionType == FMCServiceType_RPC || _version == 2) {
        rpcSessionID = sessionID;
        [self invokeMethodOnDelegates:@selector(onProxyOpened) withObject:nil];
    }
}

- (void) onProtocolMessageReceived:(FMCAppLinkProtocolMessage*) msgData {
    @try {
		[self handleProtocolMessage:msgData];
	}
	@catch (NSException * e) {
		[FMCDebugTool logException:e withMessage:@"Proxy: Failed to handle protocol message"];
	}
}


#pragma mark - Message sending and recieving
-(void) sendRPCRequest:(FMCRPCMessage*) msg {
    if ([msg isKindOfClass:FMCRPCRequest.class]) {
        [self sendRPCRequestPrivate:(FMCRPCRequest *)msg];
    }
}

- (void)sendRPCRequestPrivate:(FMCRPCRequest *)rpcRequest {
	@try {
        [self.protocol sendRPCRequest:rpcRequest];
	} @catch (NSException * e) {
		[FMCDebugTool logException:e withMessage:@"Proxy: Failed to send RPC request: %@", rpcRequest.name];
	}
}

- (void)handleProtocolMessage:(FMCAppLinkProtocolMessage *)incomingMessage {
    // Convert protocol message to dictionary
    NSDictionary* rpcMessageAsDictionary = [incomingMessage rpcDictionary];
    [self handleRpcMessage:rpcMessageAsDictionary];
}


// NOTE: This is getting rather large, excellent candidate for refactoring.
-(void) handleRpcMessage:(NSDictionary*) msg {

    FMCRPCMessage* rpcMsg = [[FMCRPCMessage alloc] initWithDictionary:(NSMutableDictionary*) msg];
    NSString* functionName = [rpcMsg getFunctionName];
    NSString* messageType = [rpcMsg messageType];

	if ([functionName isEqualToString:NAMES_OnAppInterfaceUnregistered]
        || [functionName isEqualToString:NAMES_UnregisterAppInterface]) {
		[self notifyProxyClosed];
		return;
	}
    
	if ([messageType isEqualToString:NAMES_response]) {
		bool notGenericResponseMessage = ![functionName isEqualToString:@"GenericResponse"];
		if(notGenericResponseMessage) functionName = [NSString stringWithFormat:@"%@Response", functionName];
	}
    
    
    if ([functionName isEqualToString:@"RegisterAppInterfaceResponse"]) {
        // It's possible to run into a scenario in which SYNC fails to send a StartSessionACK. This issue will be caught by the timer that's waiting for a RegisterAppInterfaceResponse. If no RAIResponse is received, a call to onProxyClosed will occur.
        
        // Turn off the timer, the handshake has succeeded
        [self destroyHandshakeTimer];
        
        //Print Proxy Version To Console
        [FMCDebugTool logInfo:@"Framework Version: %@", [self getProxyVersion]];
        
    }


    if ([functionName isEqualToString:@"EncodedSyncPDataResponse"]) {

        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: ESPD (response)"]];
        [FMCDebugTool logInfo:@"Proxy: ESPD (response)"];

    }


    // Intercept OnEncodedSyncPData. If URL != nil, perform HTTP Post and don't pass the notification to FMProxyListeners
    if ([functionName isEqualToString:@"OnEncodedSyncPData"]) {

        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: OnEncodedSyncPData (notification)"]];
        [FMCDebugTool logInfo:@"Proxy: OnEncodedSyncPData (notification)"];

        NSString     *urlString           = (NSString *)    [rpcMsg getParameters:@"URL"];
        NSDictionary *encodedSyncPData    = (NSDictionary *)[rpcMsg getParameters:@"data"];
        NSNumber     *encodedSyncPTimeout = (NSNumber *)    [rpcMsg getParameters:@"Timeout"];

        if (urlString && encodedSyncPData && encodedSyncPTimeout) {
            [self sendEncodedSyncPData:encodedSyncPData toURL:urlString withTimeout:encodedSyncPTimeout];
        }

        return;
    }
    
    // Intercept OnSystemRequest.
    if ([functionName isEqualToString:@"OnSystemRequest"]) {

        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: OnSystemRequest (notification)"]];
        [FMCDebugTool logInfo:@"Proxy: OnSystemRequest (notification)"];


        FMCOnSystemRequest* sysRpcMsg = [[FMCOnSystemRequest alloc] initWithDictionary:(NSMutableDictionary*) msg];
        FMCRequestType *requestType = sysRpcMsg.requestType;
        NSString       *urlString   = sysRpcMsg.url;
        FMCFileType    *fileType    = sysRpcMsg.fileType;
        if (requestType == [FMCRequestType PROPRIETARY])
        {
            // Validate input
            if (urlString == nil)
            {
                [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: OnSystemRequest (notification) failure: url is nil."]];
                [FMCDebugTool logInfo:@"Proxy: OnSystemRequest (notification) failure: url is nil."];
                return;
            }
            if (fileType != [FMCFileType JSON])
            {
                [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: OnSystemRequest (notification) failure: file type is not JSON"]];
                [FMCDebugTool logInfo:@"Proxy: OnSystemRequest (notification) failure: file type is not JSON"];
                return;
            }


            // Data comes in a dictionary in the bulkData
            NSError *errorJSONSerializeNotification = nil;
            NSDictionary *notificationDictionary = [NSJSONSerialization JSONObjectWithData:sysRpcMsg.bulkData options:kNilOptions error:&errorJSONSerializeNotification];
            if (errorJSONSerializeNotification) {
                [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: (failure) OnSystemRequest: Notification data is not valid JSON."]];
                [FMCDebugTool logInfo:@"Proxy: (failure) OnSystemRequest: Notification data is not valid JSON."];
                return;
            }


            // Extract data from the dictionary
            NSError *errorJSONSerializeBody = nil;
            NSDictionary   *requestData = notificationDictionary[@"HTTPRequest"];
            NSDictionary   *headers     = requestData[@"headers"];
            NSDictionary   *body        = requestData[@"body"];
            NSString       *contentType = headers[@"ContentType"];
            NSTimeInterval timeout      = [headers[@"ConnectTimeout"] doubleValue];
            NSString       *method      = headers[@"RequestMethod"];
            NSData         *data        = [NSJSONSerialization dataWithJSONObject:body options:kNilOptions error:&errorJSONSerializeBody];
            if (errorJSONSerializeBody) {
                [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: (failure) OnSystemRequest: Body data is not valid JSON."]];
                [FMCDebugTool logInfo:@"Proxy: (failure) OnSystemRequest: Body data is not valid JSON."];
                return;
            }


            // HTTP Request configuration
            NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
            NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
            NSURL *url = [NSURL URLWithString:urlString];
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
            [request setValue:contentType forHTTPHeaderField:@"content-type"];
            request.timeoutInterval = timeout;
            request.HTTPMethod = method;


            // Logging
            NSString *msg = [NSString stringWithFormat:@"Proxy: SR HTTP Send"];
            [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:msg]];
            [FMCDebugTool logInfo:msg];


            // Send the HTTP Request
            FMCCustomTaskCompletionHandler handler = ^void(NSData *data, NSURLResponse *response, NSError *error)
            {
                [self OSRHTTPRequestCompletionHandler:data response:response error:error];
            };
            NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData:data completionHandler:handler];
            [uploadTask resume];

            return;
        }

    } // End of OnSystemRequest


    // From the function name, create the corresponding RPCObject and initialize it
	NSString* functionClassName = [NSString stringWithFormat:@"FMC%@", functionName];
	FMCRPCMessage *functionObject = [[NSClassFromString(functionClassName) alloc] init];
    NSObject* rpcCallbackObject = [functionObject initWithDictionary:[msg mutableCopy]];

    // Formulate the name of the method to call on the listeners and call it, passing the RPC Object
	NSString* handlerName = [NSString stringWithFormat:@"on%@:", functionName];
	SEL handlerSelector = NSSelectorFromString(handlerName);
	[self invokeMethodOnDelegates:handlerSelector withObject:rpcCallbackObject];
}


#pragma mark - Delegate management
-(void) addDelegate:(NSObject<FMCProxyListener>*) delegate {
	@synchronized(self.proxyListeners) {
		[self.proxyListeners addObject:delegate];
	}
}

- (void)invokeMethodOnDelegates:(SEL)aSelector withObject:(id)object {
    [self.proxyListeners enumerateObjectsUsingBlock:^(id listener, NSUInteger idx, BOOL *stop) {
        if ([(NSObject *)listener respondsToSelector:aSelector]) {
            [(NSObject *)listener performSelectorOnMainThread:aSelector withObject:object waitUntilDone:NO];
        }
    }];
}


#pragma mark - System Request and SyncP handling
-(void)sendEncodedSyncPData:(NSDictionary*)encodedSyncPData toURL:(NSString*)urlString withTimeout:(NSNumber*) timeout{

    // Configure HTTP URL & Request
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";

    // Configure HTTP Session
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.HTTPAdditionalHeaders = @{@"Content-Type": @"application/json"};
    config.timeoutIntervalForRequest = 60;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];

    // Prepare the data in the required format
    NSString *encodedSyncPDataString = [[NSString stringWithFormat:@"%@", encodedSyncPData] componentsSeparatedByString:@"\""][1];
    NSArray *array = [NSArray arrayWithObject:encodedSyncPDataString];
    NSDictionary *dictionary = @{@"data": array};
    NSError *JSONSerializationError = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:&JSONSerializationError];
    if (JSONSerializationError) {
        [FMCDebugTool logInfo:@"Proxy: Error formatting data for HTTP Request. %@: %@", JSONSerializationError];
        return;
    }

    // Create the completion handler to be executed upon response
    FMCCustomTaskCompletionHandler handler = ^void(NSData *data, NSURLResponse *response, NSError *error)
    {
        [self OESPHTTPRequestCompletionHandler:data response:response error:error];
    };

    // Send the HTTP Request
    [FMCDebugTool logInfo:@"Proxy: OnEncodedSyncPData (HTTP Request)"];
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData:data completionHandler:handler];
    [uploadTask resume];

}

- (void)OESPHTTPRequestCompletionHandler:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error {
    // Sample of response: {"data":["SDLKGLSDKFJLKSjdslkfjslkJLKDSGLKSDJFLKSDJF"]}
    [FMCDebugTool logInfo:@"Proxy: OnEncodedSyncPData (HTTP Response recieved)"];

    // Validate response data.
    if (data.length == 0) {
        [FMCDebugTool logInfo:@"Proxy: (failure) OnEncodedSyncP response data is empty."];
        return;
    }

    // Convert data to RPCRequest
    NSError *JSONConversionError = nil;
    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&JSONConversionError];
    if (!JSONConversionError) {
        FMCEncodedSyncPData *request = [[FMCEncodedSyncPData alloc] init];
        request.correlationID = [NSNumber numberWithInt:POLICIES_CORRELATION_ID];
        request.data = [responseDictionary objectForKey:@"data"];

        [self sendRPCRequestPrivate:request];
    }

}

- (void)OSRHTTPRequestCompletionHandler:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error {

    FMCSystemRequest *request = [[FMCSystemRequest alloc] init];
    request.correlationID = [NSNumber numberWithInt:POLICIES_CORRELATION_ID];
    request.requestType = [FMCRequestType PROPRIETARY];
    request.bulkData = data;
    [self sendRPCRequestPrivate:request];

}


#pragma mark - PutFile Streaming
- (void)putFileStream:(NSInputStream*)inputStream :(FMCPutFile*)putFileRPCRequest
{
    inputStream.delegate = self;
    objc_setAssociatedObject(inputStream, @"FMCPutFile", putFileRPCRequest, OBJC_ASSOCIATION_RETAIN);
    objc_setAssociatedObject(inputStream, @"BaseOffset", [putFileRPCRequest offset], OBJC_ASSOCIATION_RETAIN);

    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [inputStream open];
}

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)eventCode
{

    switch(eventCode)
    {
        case NSStreamEventHasBytesAvailable:
        {
            // Grab some bytes from the stream and send them in a FMCPutFile RPC Request
            NSUInteger currentStreamOffset = [[stream propertyForKey:NSStreamFileCurrentOffsetKey] unsignedIntegerValue];

            const int bufferSize = 1024;
            uint8_t buf[bufferSize];
            NSUInteger len = [(NSInputStream *)stream read:buf maxLength:bufferSize];
            if(len > 0)
            {
                NSData* data = [NSData dataWithBytes:buf length:len];
                NSUInteger baseOffset = [(NSNumber*)objc_getAssociatedObject(stream, @"BaseOffset") unsignedIntegerValue];
                NSUInteger newOffset = baseOffset + currentStreamOffset;

                FMCPutFile* putFileRPCRequest = (FMCPutFile*)objc_getAssociatedObject(stream, @"FMCPutFile");
                [putFileRPCRequest setOffset:[NSNumber numberWithUnsignedInteger:newOffset]];
                [putFileRPCRequest setLength:[NSNumber numberWithUnsignedInteger:len]];
                [putFileRPCRequest setBulkData:data];

                [self sendRPCRequest:putFileRPCRequest];

            }

            break;
        }
        case NSStreamEventEndEncountered:
        {
            // Cleanup the stream
            [stream close];
            [stream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];

            break;
        }
        case NSStreamEventErrorOccurred:
        {
            [FMCDebugTool logInfo:@"Stream Event: Error"];
            break;
        }
        default:
        {
            break;
        }
    }
}


#pragma mark - Siphon management
+(void)enableSiphonDebug {
    [FMCSiphonServer enableSiphonDebug];
}

+(void)disableSiphonDebug {
    [FMCSiphonServer disableSiphonDebug];
}

@end
