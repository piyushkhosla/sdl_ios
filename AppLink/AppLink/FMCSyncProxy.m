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
#import "FMCPolicyDataParser.h"
#import "FMCLockScreenManager.h"
#import "FMCAppLinkProtocolMessage.h"


#define VERSION_STRING @"AppLink-20141120-095841-LOCAL-iOS"
typedef void(^FMCCustomTaskCompletionHandler)(NSData *data, NSURLResponse *response, NSError *error);


@interface FMCSyncProxy ()

{
    FMCLockScreenManager *lsm;
    NSURLSession *systemRequestSession;
    NSURLSession *encodedSyncPDataSession;
}

- (void)startRPCSession;
- (void)invokeMethodOnDelegates:(SEL)aSelector withObject:(id)object;
- (void)notifyProxyClosed;
- (void)handleProtocolMessage:(FMCAppLinkProtocolMessage *)msgData;
- (void)OESPHTTPRequestCompletionHandler:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error;
- (void)OSRHTTPRequestCompletionHandler:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error;
- (void)sendDataStream:(NSInputStream *)inputStream withServiceType:(FMCServiceType)serviceType;

@end



@implementation FMCSyncProxy

const float startSessionTime = 10.0;
const float notifyProxyClosedDelay = 0.1;
const int POLICIES_CORRELATION_ID = 65535;


#pragma mark - Object lifecycle
- (id)initWithTransport:(FMCAbstractTransport *)theTransport protocol:(FMCAbstractProtocol *)theProtocol delegate:(NSObject<FMCProxyListener> *)theDelegate {
	if (self = [super init]) {
        _debugConsoleGroupName = @"default";


        lsm = [FMCLockScreenManager new];

        alreadyDestructed = NO;

        self.proxyListeners = [[NSMutableArray alloc] initWithObjects:theDelegate, nil];
        self.protocol = theProtocol;
        self.transport = theTransport;
        self.transport.delegate = self.protocol;
        self.protocol.protocolDelegate = self;
        self.protocol.transport = self.transport;

        double delay = [self.transport getDelay];
        [self.transport performSelector:@selector(connect) withObject:nil afterDelay:delay];

        [FMCDebugTool logInfo:@"FMCSyncProxy initWithTransport"];
        [[EAAccessoryManager sharedAccessoryManager] registerForLocalNotifications];

    }

    return self;
}

-(void) destructObjects {
    if(!alreadyDestructed) {
        alreadyDestructed = YES;

        if (systemRequestSession != nil) {
            [systemRequestSession invalidateAndCancel];
        }
        if (encodedSyncPDataSession != nil) {
            [encodedSyncPDataSession invalidateAndCancel];
        }

        [self.protocol dispose];
        [self.transport dispose];
        [[EAAccessoryManager sharedAccessoryManager] unregisterForLocalNotifications];
        self.transport = nil;
        self.protocol = nil;
        self.proxyListeners = nil;
    }
}

-(void) dispose {
    [self destructObjects];
}

-(void) dealloc {
    [self destructObjects];
    [FMCDebugTool logInfo:@"FMCSyncProxy Dealloc" withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:_debugConsoleGroupName];
}

-(void) notifyProxyClosed {
	if (isConnected) {
		isConnected = NO;
        [self invokeMethodOnDelegates:@selector(onProxyClosed) withObject:nil];
	}
}

- (NSString *)proxyVersion {
    return VERSION_STRING;
}

- (void)startRPCSession {
    [self.protocol sendStartSessionWithType:FMCServiceType_RPC];
}

#pragma mark - FMCProtocolListener Implementation
- (void) onProtocolOpened {
    isConnected = YES;
    [FMCDebugTool logInfo:@"StartSession (request)" withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

    [self startRPCSession];

    if (self.startSessionTimer == nil) {
        self.startSessionTimer = [[FMCTimer alloc] initWithDuration:startSessionTime];
        __weak typeof(self) weakSelf = self;
        self.startSessionTimer.elapsedBlock = ^{
            [FMCDebugTool logInfo:@"Start Session Timeout" withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:weakSelf.debugConsoleGroupName];
            [weakSelf performSelector:@selector(notifyProxyClosed) withObject:nil afterDelay:notifyProxyClosedDelay];
        };
    }
    [self.startSessionTimer start];
}

-(void) onProtocolClosed {
	[self notifyProxyClosed];
}

-(void) onError:(NSString*) info exception:(NSException*) e {
    [self invokeMethodOnDelegates:@selector(onError:) withObject:e];
}

- (void)handleProtocolSessionStarted:(FMCServiceType)serviceType sessionID:(Byte)sessionID version:(Byte)maxVersionForModule {
    // Turn off the timer, the start session response came back
    [self.startSessionTimer cancel];

    NSString *logMessage = [NSString stringWithFormat:@"StartSession (response)\nSessionId: %d for serviceType %d", sessionID, serviceType];
    [FMCDebugTool logInfo:logMessage withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

    if (_version <= 1) {
        if (maxVersionForModule == 2) {
            _version = maxVersionForModule;
        }
    }

    if (serviceType == FMCServiceType_RPC) {
        [self invokeMethodOnDelegates:@selector(onProxyOpened) withObject:nil];
    }
}

- (void) onProtocolMessageReceived:(FMCAppLinkProtocolMessage*) msgData {
    @try {
		[self handleProtocolMessage:msgData];
	}
	@catch (NSException * e) {
		NSString *logMessage = [NSString stringWithFormat:@"Proxy: Failed to handle protocol message %@", e];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Debug toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
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
		NSString *logMessage = [NSString stringWithFormat:@"Proxy: Failed to send RPC request: %@", rpcRequest.name];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Debug toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
	}
}

- (void)handleProtocolMessage:(FMCAppLinkProtocolMessage *)incomingMessage {
    // Convert protocol message to dictionary
    NSDictionary* rpcMessageAsDictionary = [incomingMessage rpcDictionary];
    [self handleRpcMessage:rpcMessageAsDictionary];
}


// NOTE: This is getting rather large, excellent candidate for refactoring.
-(void) handleRpcMessage:(NSDictionary*) msg {
    NSString *logMessage = nil;

    FMCRPCMessage* rpcMsg = [[FMCRPCMessage alloc] initWithDictionary:(NSMutableDictionary*) msg];
    NSString* functionName = [rpcMsg getFunctionName];
    NSString* messageType = [rpcMsg messageType];

	if ([functionName isEqualToString:NAMES_OnAppInterfaceUnregistered]
        || [functionName isEqualToString:NAMES_UnregisterAppInterface]) {
        logMessage = [NSString stringWithFormat:@"Unregistration forced by module. %@", msg];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_RPC  toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
		[self notifyProxyClosed];
		return;
	}

	if ([messageType isEqualToString:NAMES_response]) {
		bool notGenericResponseMessage = ![functionName isEqualToString:@"GenericResponse"];
		if(notGenericResponseMessage) functionName = [NSString stringWithFormat:@"%@Response", functionName];
	}


    if ([functionName isEqualToString:@"RegisterAppInterfaceResponse"]) {
        //Print Proxy Version To Console
        logMessage = [NSString stringWithFormat:@"Framework Version: %@", self.proxyVersion];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    }


    if ([functionName isEqualToString:@"EncodedSyncPDataResponse"]) {
        [FMCDebugTool logInfo:@"EncodedSyncPData (response)" withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    }


    // Intercept OnEncodedSyncPData. If URL != nil, perform HTTP Post and don't pass the notification to FMProxyListeners
    if ([functionName isEqualToString:@"OnEncodedSyncPData"]) {
        logMessage = [NSString stringWithFormat:@"OnEncodedSyncPData (notification)\n%@", msg];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

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

        [FMCDebugTool logInfo:@"OnSystemRequest (notification)" withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

        FMCOnSystemRequest* sysRpcMsg = [[FMCOnSystemRequest alloc] initWithDictionary:(NSMutableDictionary*) msg];
        FMCRequestType *requestType = sysRpcMsg.requestType;
        NSString       *urlString   = sysRpcMsg.url;
        FMCFileType    *fileType    = sysRpcMsg.fileType;

        if (requestType == [FMCRequestType PROPRIETARY])
        {
            // Validate input
            if (urlString == nil)
            {
                [FMCDebugTool logInfo:@"OnSystemRequest (notification) failure: url is nil" withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
                return;
            }
            if (fileType != [FMCFileType JSON])
            {
                [FMCDebugTool logInfo:@"OnSystemRequest (notification) failure: file type is not JSON" withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
                return;
            }

            // Get data dictionary from the bulkData
            NSDictionary *notificationDictionary = nil;
            @try {
                NSError *errorJSONSerializeNotification = nil;
                notificationDictionary = [NSJSONSerialization JSONObjectWithData:sysRpcMsg.bulkData options:kNilOptions error:&errorJSONSerializeNotification];
                if (errorJSONSerializeNotification) {
                    [FMCDebugTool logInfo:@"OnSystemRequest failure: notification data is not valid JSON." withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
                    return;
                }
            }
            @catch (NSException *exception) {
                logMessage = [NSString stringWithFormat:@"Exception converting bulk data to NSDictionary. Data:\n%@", [[NSString alloc] initWithData:sysRpcMsg.bulkData encoding:NSUTF8StringEncoding]];
                [FMCDebugTool logInfo:logMessage withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

                [exception raise]; // rethrow
            }


            // Extract data from the dictionary
            NSDictionary   *requestData = notificationDictionary[@"HTTPRequest"];
            NSDictionary   *headers     = requestData[@"headers"];
            NSString       *contentType = headers[@"ContentType"];
            NSTimeInterval timeout      = [headers[@"ConnectTimeout"] doubleValue];
            NSString       *method      = headers[@"RequestMethod"];
            NSString       *bodyString  = requestData[@"body"];
            NSData         *bodyData    = [bodyString dataUsingEncoding:NSUTF8StringEncoding];


            // Parse and display the policy data.
            FMCPolicyDataParser *pdp = [[FMCPolicyDataParser alloc] init];
            NSData *policyData = [pdp unwrap:bodyData];
            if (policyData) {
                [pdp parsePolicyData:policyData];
                logMessage = [NSString stringWithFormat:@"Policy Data from Module\n%@", pdp];
                [FMCDebugTool logInfo:logMessage withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
            }


            // HTTP Request configuration
            NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
            systemRequestSession = [NSURLSession sessionWithConfiguration:config];
            NSURL *url = [NSURL URLWithString:urlString];
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
            [request setValue:contentType forHTTPHeaderField:@"content-type"];
            request.timeoutInterval = timeout;
            request.HTTPMethod = method;


            // Logging
            logMessage = [NSString stringWithFormat:@"OnSystemRequest (HTTP Request) to URL %@", urlString];
            [FMCDebugTool logInfo:logMessage withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];


            // Send the HTTP Request
            FMCCustomTaskCompletionHandler handler = ^void(NSData *data, NSURLResponse *response, NSError *error)
            {
                [self OSRHTTPRequestCompletionHandler:data response:response error:error];
            };
            NSURLSessionUploadTask *systemRequestUploadTask = [systemRequestSession uploadTaskWithRequest:request fromData:bodyData completionHandler:handler];
            [systemRequestUploadTask resume];

            return;
        }

    } // End of OnSystemRequest

    if ([functionName isEqualToString:@"SystemRequestResponse"]) {
        logMessage = [NSString stringWithFormat:@"SystemRequest (response)\n%@", msg];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
        return;
    }



    // From the function name, create the corresponding RPCObject and initialize it
	NSString* functionClassName = [NSString stringWithFormat:@"FMC%@", functionName];
    FMCRPCMessage *functionObject = [[NSClassFromString(functionClassName) alloc] initWithDictionary:msg];

    logMessage = [NSString stringWithFormat:@"%@", functionObject];
    [FMCDebugTool logInfo:logMessage withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

    // Formulate the name of the method to call on the listeners and call it, passing the RPC Object
	NSString* handlerName = [NSString stringWithFormat:@"on%@:", functionName];
	SEL handlerSelector = NSSelectorFromString(handlerName);
	[self invokeMethodOnDelegates:handlerSelector withObject:functionObject];


    // When an OnHMIStatus notification comes in, after passing it on (above), generate an "OnLockScreenNotification"
    if ([functionName isEqualToString:@"OnHMIStatus"]) {
        NSString *statusString = (NSString *)[rpcMsg getParameters:NAMES_hmiLevel];
        FMCHMILevel *hmiLevel = [FMCHMILevel valueOf:statusString];
        lsm.hmiLevel = hmiLevel;

        SEL callbackSelector = NSSelectorFromString(@"onOnLockScreenNotification:");
        [self invokeMethodOnDelegates:callbackSelector withObject:lsm.lockScreenStatusNotification];
    }

    // When an OnDriverDistraction notification comes in, after passing it on (above), generate an "OnLockScreenNotification"
    if ([functionName isEqualToString:@"OnDriverDistraction"]) {
        NSString *stateString = (NSString *)[rpcMsg getParameters:NAMES_state];
        BOOL bState = [stateString isEqualToString:@"DD_ON"]?YES:NO;
        lsm.bDriverDistractionStatus = bState;

        SEL callbackSelector = NSSelectorFromString(@"onOnLockScreenNotification:");
        [self invokeMethodOnDelegates:callbackSelector withObject:lsm.lockScreenStatusNotification];
    }

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
    encodedSyncPDataSession = [NSURLSession sessionWithConfiguration:config];

    // Prepare the data in the required format
    NSString *encodedSyncPDataString = [[NSString stringWithFormat:@"%@", encodedSyncPData] componentsSeparatedByString:@"\""][1];
    NSArray *array = [NSArray arrayWithObject:encodedSyncPDataString];
    NSDictionary *dictionary = @{@"data": array};
    NSError *JSONSerializationError = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:kNilOptions error:&JSONSerializationError];
    if (JSONSerializationError) {
        NSString *logMessage = [NSString stringWithFormat:@"Error formatting data for HTTP Request. %@", JSONSerializationError];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
        return;
    }

    // Create the completion handler to be executed upon response
    FMCCustomTaskCompletionHandler handler = ^void(NSData *data, NSURLResponse *response, NSError *error)
    {
        [self OESPHTTPRequestCompletionHandler:data response:response error:error];
    };

    // Send the HTTP Request
    [FMCDebugTool logInfo:@"OnEncodedSyncPData (HTTP request)" withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    NSURLSessionUploadTask *encodedSyncPDataUploadTask = [encodedSyncPDataSession uploadTaskWithRequest:request fromData:data completionHandler:handler];
    [encodedSyncPDataUploadTask resume];

}

// Handle the OnEncodedSyncPData HTTP Response
- (void)OESPHTTPRequestCompletionHandler:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error {
    // Sample of response: {"data":["SDLKGLSDKFJLKSjdslkfjslkJLKDSGLKSDJFLKSDJF"]}
    [FMCDebugTool logInfo:@"OnEncodedSyncPData (HTTP response)" withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

    // Validate response data.
    if (data == nil || data.length == 0) {
        [FMCDebugTool logInfo:@"OnEncodedSyncPData (HTTP response) failure: no data returned" withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
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

// Handle the OnSystemRequest HTTP Response
- (void)OSRHTTPRequestCompletionHandler:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error {

    NSString *logMessage = nil;

    if (error) {
        logMessage = [NSString stringWithFormat:@"OnSystemRequest (HTTP response) = ERROR: %@", error];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
        return;
    }

    if (data == nil || data.length == 0) {
        [FMCDebugTool logInfo:@"OnSystemRequest (HTTP response) failure: no data returned" withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
        return;
    }

    // Show the HTTP response
    [FMCDebugTool logInfo:@"OnSystemRequest (HTTP response)" withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

    // Create the SystemRequest RPC to send to module.
    FMCSystemRequest *request = [[FMCSystemRequest alloc] init];
    request.correlationID = [NSNumber numberWithInt:POLICIES_CORRELATION_ID];
    request.requestType = [FMCRequestType PROPRIETARY];
    request.bulkData = data;

    // Parse and display the policy data.
    FMCPolicyDataParser *pdp = [[FMCPolicyDataParser alloc] init];
    NSData *policyData = [pdp unwrap:data];
    if (policyData) {
        [pdp parsePolicyData:policyData];
        logMessage = [NSString stringWithFormat:@"Policy Data from Cloud\n%@", pdp];
        [FMCDebugTool logInfo:logMessage withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    }

    // Send RPC Request
    [self sendRPCRequestPrivate:request];

}


#pragma mark - PutFile Streaming
- (void)sendDataStream:(NSInputStream *)inputStream withServiceType:(FMCServiceType)serviceType {

    [self.protocol sendRawDataStream:inputStream withServiceType:serviceType];
}

- (void)putFileStream:(NSInputStream*)inputStream withRequest:(FMCPutFile*)putFileRPCRequest
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
            [FMCDebugTool logInfo:@"Stream Event: Error" withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
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
