//  FMCSyncProxy.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//  Version: AppLinkFramework-2.2.0-iOS

#import <Foundation/Foundation.h>
#import <AppLink/FMCISyncProxy.h>
#import <AppLink/FMCProtocol.h>
#import <AppLink/FMCProxyListener.h>
#import <AppLink/FMCRPCRequestFactory.h>
#import <AppLink/FMCSyncTransport.h>

@interface FMCSyncProxy : NSObject<FMCProtocolListener, NSURLConnectionDelegate> {
    Byte _version;
    
	NSObject<FMCSyncTransport>* transport;
	NSObject<FMCProtocol>* protocol;
	NSMutableArray* proxyListeners;
	Byte rpcSessionID;
	Byte bulkSessionID;
	
    NSTimer* handshakeTimer;
    
	BOOL isConnected;
    BOOL alreadyDestructed;
    
    NSMutableData* httpResponseData;
}

-(id)  initWithTransport:(NSObject<FMCSyncTransport>*) transport protocol:(NSObject<FMCProtocol>*) protocol delegate:(NSObject<FMCProxyListener>*) delegate;

-(void) dispose;
-(void) addDelegate:(NSObject<FMCProxyListener>*) delegate;

-(void) sendRPCRequest:(FMCRPCMessage*) msg;
-(void) handleRpcMessage:(NSDictionary*) msg;

-(NSString*) getProxyVersion;

-(void) destroyHandshakeTimer;
-(void) handleProtocolMessage:(FMCProtocolMessage*) msgData;

+(void)enableSiphonDebug;
+(void)disableSiphonDebug;

-(NSObject<FMCSyncTransport>*)getTransport;
-(NSObject<FMCProtocol>*)getProtocol;

@end
