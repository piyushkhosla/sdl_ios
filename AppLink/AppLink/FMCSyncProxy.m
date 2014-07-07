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
#import "FMCURLConnection.h"

#define VERSION_STRING @"##Version##"

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
        
            NSString *urlString = (NSString *)[rpcMsg getParameters:@"URL"];
            if (urlString != nil) {
                NSDictionary *encodedSyncPData = (NSDictionary *)[rpcMsg getParameters:@"data"];
                NSNumber *encodedSyncPTimeout = (NSNumber *) [rpcMsg getParameters:@"Timeout"];
                [self sendEncodedSyncPData:encodedSyncPData toURL:urlString withTimeout:encodedSyncPTimeout];
                
                return;
            }
    }
    
    // Intercept OnSystemRequest. If URL != nil, perform HTTP Post and don't pass the notification to FMProxyListeners
    if ([functionName isEqualToString:@"OnSystemRequest"]) {
        
        FMCOnSystemRequest* sysRpcMsg = (FMCOnSystemRequest*) rpcMsg;
        
        if ([sysRpcMsg.requestType isEqual: [FMCRequestType PROPRIETARY]]){
            [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: OnSystemRequest (notification)"]];
            [FMCDebugTool logInfo:@"Proxy: OnSystemRequest (notification)"];
            
            NSString *urlString = sysRpcMsg.url[1];
            if (urlString != nil) {
                
                NSError *error = nil;
                NSDictionary *notificationDictionary = [NSJSONSerialization JSONObjectWithData:sysRpcMsg.bulkData options:kNilOptions error:&error];
                NSDictionary *httpRequestDictionary = [notificationDictionary objectForKey:@"HTTPRequest"];
                NSDictionary *headersDictionary = [httpRequestDictionary objectForKey:@"headers"];
                
                // Create the URL request
                NSURL *url = [NSURL URLWithString:urlString];
                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
                
                [request setValue:(NSString*)[headersDictionary objectForKey:@"ContentType"] forHTTPHeaderField:@"content-type"];
                
                request.timeoutInterval = [(NSNumber*) [headersDictionary objectForKey:@"ConnectTimeout"] doubleValue];
                request.HTTPMethod = (NSString*)[headersDictionary objectForKey:@"RequestMethod"];
                
                request.HTTPBody = (NSData*)[httpRequestDictionary objectForKey:@"body"];
                
                FMCURLConnection *conn = [[FMCURLConnection alloc] initWithRequest:request delegate:self andTag:@"OnSystemRequestProprietary"];
                
                if (conn == nil) {
                    [FMCDebugTool logInfo:@"%s: Error creating NSURLConnection", __PRETTY_FUNCTION__];
                }
                
                return;
            }

        }
    }
    
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
    
    //Get data (second element of array), then format as JSON
    NSString *encodedSyncPDataString = [[NSString stringWithFormat:@"%@", encodedSyncPData] componentsSeparatedByString:@"\""][1];
    NSString* jsonString = [NSString stringWithFormat:@"{\"data\":[\"%@\"]}", encodedSyncPDataString];
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    // Create the URL request
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    request.HTTPBody = jsonData;
    request.timeoutInterval = [timeout doubleValue];
    
//TODO:DEBUGOUTS
//    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:[timeout doubleValue]]];
//    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:urlString]];
//    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:encodedSyncPData]];
//    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:jsonString]];
//
//    NSLog(@"%.21g", [timeout doubleValue]);
//    [FMCDebugTool logInfo:urlString];
//    NSLog(@"%@", encodedSyncPData);
//    NSLog(@"%@", encodedSyncPDataString);
//    NSLog(@"%@", jsonString);
//TODO:ENDDEBUGOUTS
    
    FMCURLConnection *conn = [[FMCURLConnection alloc] initWithRequest:request delegate:self andTag:@"OnEncodedSyncPData"];
    
    if (conn == nil) {
        [FMCDebugTool logInfo:@"%s: Error creating NSURLConnection", __PRETTY_FUNCTION__];
    }
}

#pragma mark - NSURL Methods
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    FMCURLConnection *fmcConnection = (FMCURLConnection*)connection;
    fmcConnection.response = (NSHTTPURLResponse *)response;

    // TODO: Optimise, get content-length from header, init data with that capacity
    fmcConnection.responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    FMCURLConnection* fmcConnection = (FMCURLConnection *)connection;
    [fmcConnection.responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // TODO: Now that this uses FMCURLConnection class we can clean this up.
    // Could, for example, give it a block property of code to complete upon
    // completion instead of switching on "requestKind".


    [connection release]; // Release the connection we allocated in sendEncodedSyncPData/sendSystemRequest

    FMCURLConnection *fmcConnection = (FMCURLConnection *)connection;
    NSString *requestKind = fmcConnection.tag;
    NSData *httpResponseData = fmcConnection.responseData;
    
    if ([requestKind isEqualToString:@"OnEncodedSyncPData"]) {
        
        // Sample of response: {"data":["SDLKGLSDKFJLKSjdslkfjslkJLKDSGLKSDJFLKSDJF"]}
        if ([httpResponseData length] == 0){
            [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: OnEncodedSyncPData (invalid)"]];
            [FMCDebugTool logInfo:@"Proxy: OnEncodedSyncPData (invalid)"];
            
            return;
        }

        // Capture what comes back from the post in json form
        NSString *responseString = [[NSString alloc] initWithData:httpResponseData encoding:NSUTF8StringEncoding];
        NSData *responseData = [responseString dataUsingEncoding:NSASCIIStringEncoding];
        
        NSError *error = nil;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
        NSMutableArray *encodedSyncPDataArray = [responseDictionary objectForKey:@"data"];
        
        //TODO:DEBUGOUTS
        //[[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:responseString]];
        //[FMCDebugTool logInfo:responseString];
        //TODO:ENDDEBUGOUTS
        
        // Build encodedSyncPData request
        FMCEncodedSyncPData *request = [[[FMCEncodedSyncPData alloc] init] autorelease];
        request.data = encodedSyncPDataArray;
        request.correlationID = [NSNumber numberWithInt:POLICIES_CORRELATION_ID];
        
        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: EncodedSyncPData (request)"]];
        [FMCDebugTool logInfo:@"Proxy: EncodedSyncPData (request)"];

        [self sendRPCRequestPrivate:request];
        
    } else if ([requestKind isEqualToString:@"OnSystemRequestProprietary"]) {
        
        if ([httpResponseData length] == 0){
            [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: OnSystemRequest (invalid)"]];
            [FMCDebugTool logInfo:@"Proxy: OnSystemRequest (invalid)"];
            
            return;
        }
        
        // Capture what comes back from the post in json form
        NSString *responseString = [[NSString alloc] initWithData:httpResponseData encoding:NSUTF8StringEncoding];
        NSData *responseData = [responseString dataUsingEncoding:NSASCIIStringEncoding];
        
        //TODO:DEBUGOUTS
        //[[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:responseString]];
        //[FMCDebugTool logInfo:responseString];
        //TODO:ENDDEBUGOUTS
        
        // Build SystemRequest request
        FMCSystemRequest *request = [[[FMCSystemRequest alloc] init] autorelease];
        request.requestType = [FMCRequestType PROPRIETARY];
        request.bulkData = responseData;
        
        request.correlationID = [NSNumber numberWithInt:POLICIES_CORRELATION_ID];
        
        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: SystemRequest (request)"]];
        [FMCDebugTool logInfo:@"Proxy: SystemRequest (request)"];
        
        [self sendRPCRequestPrivate:request];
        
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    [connection release]; // Release the connection we allocated in sendEncodedSyncPData/sendSystemRequest
    FMCURLConnection *fmcConnection = (FMCURLConnection *)connection;
    NSString *requestKind = fmcConnection.tag;

    if ([requestKind isEqualToString:@"OnEncodedSyncPData"]) {
        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: OnEncodedSyncPData (error)"]];
        [FMCDebugTool logInfo:@"Proxy: OnEncodedSyncPData (error)"];
        
    } else {
        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"Proxy: OnSystemRequest (error)"]];
        [FMCDebugTool logInfo:@"Proxy: OnSystemRequest (error)"];
        
    }
    
    //TODO:DEBUGOUTS
    //[FMCDebugTool logInfo:@"%s, Connection failed with error: %@", __PRETTY_FUNCTION__, [error localizedDescription]];
    //TODO:ENDDEBUGOUTS
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
