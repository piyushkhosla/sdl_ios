//  FMCSyncProxy.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <ExternalAccessory/ExternalAccessory.h>
#import <objc/runtime.h>

#import <AppLink/Debug/FMCDebugTool.h>
#import <AppLink/RPC/Requests/FMCEncodedSyncPData.h>
#import <AppLink/FMCFunctionID.h>
#import <AppLink/FMCJsonDecoder.h>
#import <AppLink/FMCJsonEncoder.h>
#import <AppLink/RPC/Enums/FMCLanguage.h>
#import <AppLink/FMCNames.h>
#import <AppLink/Debug/FMCSiphonServer.h>
#import <AppLink/FMCSyncProxy.h>
#import <AppLink/RPC/Requests/FMCSystemRequest.h>
#import "FMCRPCPayload.h"

#define VERSION_STRING @"##Version##"


typedef void(^FMCCustomTaskCompletionHandler)(NSData *data, NSURLResponse *response, NSError *error);


@interface FMCCallback : NSObject {
	NSObject* target;
	SEL selector;
	NSObject* parameter;
}

@property (nonatomic, retain) NSObject* target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, retain) NSObject* parameter;

@end

@implementation FMCCallback
@synthesize target;
@synthesize selector;
@synthesize parameter;

-(void) dealloc {
	[target release];
	[parameter release];
	
	[super dealloc];
}

@end

@interface FMCSyncProxy ()

- (void)notifyProxyClosed;
- (void)handleProtocolMessage:(FMCAppLinkProtocolMessage *)msgData;
- (void)performCallback:(FMCCallback *)callback;
- (void)OESPHTTPRequestCompletionHandler:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error;
- (void)OSRHTTPRequestCompletionHandler:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error;

@end

@implementation FMCSyncProxy

const float handshakeTime = 30.0;
const float notifyProxyClosedDelay = 0.1;
const int POLICIES_CORRELATION_ID = 65535;

- (void)handshakeTimerFired {
    [self destroyHandshakeTimer];
    
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: Init Handshake Timeout"]];
    [FMCDebugTool logInfo:@"Proxy: Init Handshake Timeout"];
    
    [self performSelector:@selector(notifyProxyClosed) withObject:nil afterDelay:notifyProxyClosedDelay];
}

-(id) initWithTransport:(NSObject<FMCTransport>*) theTransport protocol:(NSObject<FMCProtocol>*) theProtocol delegate:(NSObject<FMCProxyListener>*) theDelegate {
	if (self = [super init]) {        
        [[EAAccessoryManager sharedAccessoryManager] registerForLocalNotifications];
        
        proxyListeners = [[NSMutableArray alloc] initWithObjects:theDelegate, nil];
        protocol = [theProtocol retain];
        transport = [theTransport retain];
        rpcSessionID = 0;
        
        alreadyDestructed = NO;
                
        transport.delegate = protocol;
        protocol.protocolDelegate = self;
        
        protocol.transport = transport;
        
        [transport connect];
        
        return self;
    }
    return self;
}

-(void)destroyHandshakeTimer {
    if (handshakeTimer != nil) {
        [handshakeTimer invalidate];
        [handshakeTimer release];
        handshakeTimer = nil;
    }
}

-(void) destructObjects {
    if(!alreadyDestructed) {
        [self destroyHandshakeTimer];
        
        [transport release];
        transport = nil;
        
        [protocol release];
        protocol = nil;
        
        [proxyListeners release];
        proxyListeners = nil;
        
        alreadyDestructed = YES;
    }
}

-(void) dispose {
    [self destructObjects];
}

-(void) dealloc {
    [self destructObjects];
	[super dealloc];
}

-(NSObject<FMCTransport>*)getTransport {
    return transport;
}

-(NSObject<FMCProtocol>*)getProtocol {
    return protocol;
}

-(void) addDelegate:(NSObject<FMCProxyListener>*) delegate {
	@synchronized(proxyListeners) {
		[proxyListeners addObject:delegate];
	}
}

-(NSString*) getProxyVersion {
    return VERSION_STRING;
}

-(void) sendRPCRequest:(FMCRPCMessage*) msg {
    if ([msg isKindOfClass:FMCRPCRequest.class]) {
        FMCRPCRequest *request = (FMCRPCRequest*)msg;
        [self sendRPCRequestPrivate:request];
    }
}


// Send an RPC Request without checking for reserved correlation IDs	
- (void)sendRPCRequestPrivate:(FMCRPCRequest *)rpcRequest {
	@try {
        [protocol sendRPCRequest:rpcRequest];
	} @catch (NSException * e) {
		[FMCDebugTool logException:e withMessage:@"Proxy: Failed to send RPC request: %@", rpcRequest.name];
	}
}

-(void) handleProtocolSessionStarted:(FMCServiceType) sessionType sessionID:(Byte) sessionID version:(Byte) version {
    
    [FMCDebugTool logInfo:@"StartSession (response)" withType:FMCDebugType_Protocol];

    if (_version <= 1) {
        if (version == 2) {
            _version = version;
        }
    }
    
    if (sessionType == FMCServiceType_RPC || _version == 2) {
        rpcSessionID = sessionID;
        //TODO: DEBUGOUTS
        //[FMCDebugTool logInfo:@"Got rpcSessionID = %i", rpcSessionID];
        //TODO:ENDDEBUGOUTS
        
        NSArray *localListeners = nil;
        @synchronized (proxyListeners) {
            localListeners = [proxyListeners copy];
        }
        
        for (NSObject<FMCProxyListener> *listener in localListeners) {
            [listener onProxyOpened];
        }
        
        [localListeners release];
    } else {
        // Handle other protocol session types here
    }
}
	 
- (void) onProtocolMessageReceived:(FMCAppLinkProtocolMessage*) msgData {
    //TODO: DEBUGOUTS
    //[FMCDebugTool logInfo:[NSString stringWithFormat:@"Recieved message: %@", msgData.description] withType:FMCDebugType_Protocol];
    //TODO:ENDDEBUGOUTS
    
    @try {
		[self handleProtocolMessage:msgData];
	}
	@catch (NSException * e) {
		[FMCDebugTool logException:e withMessage:@"Proxy: Failed to handle protocol message"];
	}
	@finally {
		
	}
}

- (void)handleProtocolMessage:(FMCAppLinkProtocolMessage *)incomingMessage {

    // Convert protocol message to dictionary
    NSDictionary* rpcMessageAsDictionary = [incomingMessage rpcDictionary];
    [self handleRpcMessage:rpcMessageAsDictionary];

}

-(void) neverCalled {
	[[FMCAddCommandResponse alloc] release];
	[[FMCAddSubMenuResponse alloc] release];
	[[FMCAlertResponse alloc] release];
	[[FMCCreateInteractionChoiceSetResponse alloc] release];
	[[FMCDeleteCommandResponse alloc] release];
	[[FMCDeleteInteractionChoiceSetResponse alloc] release];
	[[FMCDeleteSubMenuResponse alloc] release];
	[[FMCOnHMIStatus alloc] release];
	[[FMCOnButtonEvent alloc] release];
	[[FMCOnButtonPress alloc] release];
	[[FMCOnCommand alloc] release];
	[[FMCOnAppInterfaceUnregistered alloc] release];
	[[FMCPerformInteractionResponse alloc] release];
	[[FMCRegisterAppInterfaceResponse alloc] release];
	[[FMCSetGlobalPropertiesResponse alloc] release];
	[[FMCResetGlobalPropertiesResponse alloc] release];
	[[FMCSetMediaClockTimerResponse alloc] release];
	[[FMCShowResponse alloc] release];
	[[FMCSpeakResponse alloc] release];
	[[FMCSubscribeButtonResponse alloc] release];
	[[FMCUnregisterAppInterfaceResponse alloc] release];
	[[FMCUnsubscribeButtonResponse alloc] release];
    [[FMCGenericResponse alloc] release];
    [[FMCOnDriverDistraction alloc] release];
    [[FMCSubscribeVehicleDataResponse alloc] release];
    [[FMCUnsubscribeVehicleDataResponse alloc] release];
    [[FMCGetVehicleDataResponse alloc] release];
    [[FMCGetDTCsResponse alloc] release];
    [[FMCReadDIDResponse alloc] release];
    [[FMCOnVehicleData alloc] release];
    [[FMCOnPermissionsChange alloc] release];
    [[FMCSliderResponse alloc] release];
    [[FMCPutFileResponse alloc] release];
    [[FMCDeleteFileResponse alloc] release];
    [[FMCListFilesResponse alloc] release];
    [[FMCSetAppIconResponse alloc] release];
    [[FMCPerformAudioPassThruResponse alloc] release];
    [[FMCEndAudioPassThruResponse alloc] release];
    [[FMCOnAudioPassThru alloc] release];
    [[FMCScrollableMessageResponse alloc] release];
    [[FMCChangeRegistrationResponse alloc] release];
    [[FMCOnLanguageChange alloc] release];
    [[FMCSetDisplayLayout alloc] release];
}

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
//TODO:DEBUGOUTS
//        [FMCDebugTool logInfo:@"FMSyncProxy: handleRpcMessage: Receiving: %@", functionName];
//TODO:ENDDEBUGOUTS
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


	NSString* functionClassName = [NSString stringWithFormat:@"FMC%@", functionName];
	Class functionClass = objc_getClass([functionClassName cStringUsingEncoding:NSUTF8StringEncoding]);
    
    // functionObject doesn't leak because performSelector returns a pointer to the same instance that class_createInstance() creates
	NSObject* functionObject = (id)class_createInstance(functionClass, 0);
    NSObject* rpcCallbackObject = [functionObject performSelector:@selector(initWithDictionary:) withObject:msg];
	
	NSString* handlerName = [NSString stringWithFormat:@"on%@:", functionName];

	SEL handlerSelector = NSSelectorFromString(handlerName);
	
	NSArray *localListeners = nil;
	@synchronized (proxyListeners) {
		localListeners = [proxyListeners copy];
	}
	
	for (NSObject<FMCProxyListener> *listener in localListeners) {
		if ([listener respondsToSelector:handlerSelector]) {
			FMCCallback* callback = [[FMCCallback alloc] init];
			callback.target = listener;
			callback.selector = handlerSelector;
			callback.parameter = rpcCallbackObject;
			[self performSelectorOnMainThread:@selector(performCallback:) withObject:callback waitUntilDone:NO];
			// [callback release]; Moved to performCallback to avoid thread race condition
		}
//        else {
//			[FMCDebugTool logInfo:@"Proxy: App does not listen for callback: %@", handlerName];
//		}
	}
	[localListeners release];
}

-(void) performCallback:(FMCCallback*) callback {
	@try {
		[callback.target performSelector:callback.selector withObject:callback.parameter];
	} @catch (NSException * e) {
		[FMCDebugTool logException:e withMessage:@"Exception thrown during call to %@ with object %@", callback.target, callback.parameter];
	} @finally {
		[callback release];
	}
}

-(void) onProtocolClosed {
	[self notifyProxyClosed];
}

-(void) notifyProxyClosed {
	if (isConnected) {
		isConnected = NO;
		NSArray *localListeners = nil;
		@synchronized (proxyListeners) {
			localListeners = [proxyListeners copy];
		}
		
		for (NSObject<FMCProxyListener> *listener in localListeners) {
			[listener performSelectorOnMainThread:@selector(onProxyClosed) withObject:nil waitUntilDone:NO];
		}
		[localListeners release];
	}
}

-(void) onError:(NSString*) info exception:(NSException*) e {
	
	NSArray *localListeners = nil;
	@synchronized (proxyListeners) {
		localListeners = [proxyListeners copy];
	}
	
	for (NSObject<FMCProxyListener> *listener in localListeners) {
		[listener performSelectorOnMainThread:@selector(onError:) withObject:e waitUntilDone:NO];
	}
	[localListeners release];
}


- (void) onProtocolOpened {    
    isConnected = YES;
    [FMCDebugTool logInfo:@"StartSession (request)" withType:FMCDebugType_RPC];
    
    [protocol sendStartSessionWithType:FMCServiceType_RPC];
    
    [self destroyHandshakeTimer];
    handshakeTimer = [NSTimer scheduledTimerWithTimeInterval:handshakeTime target:self selector:@selector(handshakeTimerFired) userInfo:nil repeats:NO];
    [handshakeTimer retain];
}

+(void)enableSiphonDebug {
    [FMCSiphonServer enableSiphonDebug];
}

+(void)disableSiphonDebug {
    [FMCSiphonServer disableSiphonDebug];
}

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
        FMCEncodedSyncPData *request = [[[FMCEncodedSyncPData alloc] init] autorelease];
        request.correlationID = [NSNumber numberWithInt:POLICIES_CORRELATION_ID];
        request.data = [responseDictionary objectForKey:@"data"];

        [self sendRPCRequestPrivate:request];
    }

}

- (void)OSRHTTPRequestCompletionHandler:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error {

    FMCSystemRequest *request = [[[FMCSystemRequest alloc] init] autorelease];
    request.correlationID = [NSNumber numberWithInt:POLICIES_CORRELATION_ID];
    request.requestType = [FMCRequestType PROPRIETARY];
    request.bulkData = data;
    [self sendRPCRequestPrivate:request];

}

#pragma mark - PutFile Streaming
- (void)putFileStream:(NSInputStream*)inputStream :(FMCPutFile*)putFileRPCRequest
{
    [inputStream retain];
    [putFileRPCRequest retain];

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
            NSUInteger currentStreamOffset = [[stream propertyForKey:NSStreamFileCurrentOffsetKey] unsignedIntegerValue];

            const int bufferSize = 1024;
            uint8_t buf[bufferSize];
            int len = [(NSInputStream *)stream read:buf maxLength:bufferSize];
            if(len > 0)
            {
                NSData* data = [NSData dataWithBytes:buf length:len];
                NSUInteger baseOffset = [(NSNumber*)objc_getAssociatedObject(stream, @"BaseOffset") unsignedIntegerValue];
                NSUInteger newOffset = baseOffset + currentStreamOffset;

                FMCPutFile* putFileRPCRequest = (FMCPutFile*)objc_getAssociatedObject(stream, @"FMCPutFile");
                [putFileRPCRequest setOffset:[NSNumber numberWithUnsignedInteger:newOffset]];
                [putFileRPCRequest setLength:[NSNumber numberWithUnsignedInt:len]];
                [putFileRPCRequest setBulkData:data];

                [self sendRPCRequest:putFileRPCRequest];

            }
            else if (len < 0)
            {
                [FMCDebugTool logInfo:@"Stream read failure."];
            }

            break;
        }
        case NSStreamEventEndEncountered:
        {
            // Stream done. Release the custom property on it.
            FMCPutFile* putFileRPCRequest = (FMCPutFile*)objc_getAssociatedObject(stream, @"FMCPutFile");
            [putFileRPCRequest release];
            NSNumber* baseOffset = (NSNumber*)objc_getAssociatedObject(stream, @"BaseOffset");
            [baseOffset release];

            // Cleanup the stream
            [stream close];
            [stream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            [stream release];

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

@end
