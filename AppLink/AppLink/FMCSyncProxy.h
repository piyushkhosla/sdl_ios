//  FMCSyncProxy.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//  Version: ##Version##

#import <Foundation/Foundation.h>
#import <AppLink/FMCISyncProxy.h>
#import <AppLink/Protocol/FMCProtocol.h>
#import <AppLink/FMCProxyListener.h>
#import <AppLink/FMCRPCRequestFactory.h>
#import <AppLink/Transport/FMCTransport.h>

@interface FMCSyncProxy : NSObject<FMCProtocolListener, NSStreamDelegate> {
    Byte _version;
    
	NSObject<FMCTransport>* transport;
	NSObject<FMCProtocol>* protocol;
	NSMutableArray* proxyListeners;
	Byte rpcSessionID;
	Byte bulkSessionID;
	
    NSTimer* handshakeTimer;
    
	BOOL isConnected;
    BOOL alreadyDestructed;
}

-(id) initWithTransport:(NSObject<FMCTransport>*) transport protocol:(NSObject<FMCProtocol>*) protocol delegate:(NSObject<FMCProxyListener>*) delegate;

-(void) dispose;
-(void) addDelegate:(NSObject<FMCProxyListener>*) delegate;

-(void) sendRPCRequest:(FMCRPCMessage*) msg;
-(void) handleRpcMessage:(NSDictionary*) msg;

-(NSString*) getProxyVersion;

-(void) destroyHandshakeTimer;
-(void) handleProtocolMessage:(FMCAppLinkProtocolMessage*) msgData;

+(void)enableSiphonDebug;
+(void)disableSiphonDebug;

-(NSObject<FMCTransport>*)getTransport;
-(NSObject<FMCProtocol>*)getProtocol;

- (void)putFileStream:(NSInputStream*)inputStream :(FMCPutFile*)putFileRPCRequest;

@end
