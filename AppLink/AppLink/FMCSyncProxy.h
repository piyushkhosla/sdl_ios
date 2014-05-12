//  FMCSyncProxy.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//  Version: ##Version##

#import <Foundation/Foundation.h>
#import <AppLink/FMCISyncProxy.h>
#import <AppLink/FMCProtocol.h>
#import <AppLink/FMCProxyListener.h>
#import <AppLink/FMCRPCRequestFactory.h>
#import <AppLink/FMCSyncTransport.h>

@interface FMCSyncProxy : NSObject<FMCProtocolListener, NSURLConnectionDelegate, NSStreamDelegate> {
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
    NSString* requestKind;
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

- (void)putFileStream:(NSInputStream*)inputStream :(FMCPutFile*)putFileRPCRequest;

@end
