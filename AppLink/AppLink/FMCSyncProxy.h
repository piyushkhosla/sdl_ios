//  FMCSyncProxy.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//  Version: AppLink-20141001-130610-LOCAL-iOS

#import <Foundation/Foundation.h>
#import <AppLink/FMCProxyListener.h>
#import <AppLink/FMCRPCRequestFactory.h>
#import <AppLink/FMCTransport.h>
#import "FMCAbstractProtocol.h"

@interface FMCSyncProxy : NSObject <FMCProtocolListener, NSStreamDelegate> {
    Byte _version;
	Byte bulkSessionID;
	BOOL isConnected;
    BOOL alreadyDestructed;

}

@property (strong) FMCAbstractProtocol* protocol;
@property (strong) NSObject<FMCTransport>* transport;
@property (strong) NSMutableArray* proxyListeners;
@property (strong) NSTimer* handshakeTimer;
@property (strong) NSString *debugConsoleGroupName;

-(id) initWithTransport:(NSObject<FMCTransport>*) transport protocol:(FMCAbstractProtocol *)protocol delegate:(NSObject<FMCProxyListener>*) delegate;

-(void) dispose;
-(void) addDelegate:(NSObject<FMCProxyListener>*) delegate;

-(void) sendRPCRequest:(FMCRPCMessage*) msg;
-(void) handleRpcMessage:(NSDictionary*) msg;
-(void) handleProtocolMessage:(FMCAppLinkProtocolMessage*) msgData;

-(void) destroyHandshakeTimer;

+(void)enableSiphonDebug;
+(void)disableSiphonDebug;

-(NSString*) getProxyVersion;
-(NSObject<FMCTransport>*)getTransport;
-(FMCAbstractProtocol*)getProtocol;

- (void)putFileStream:(NSInputStream*)inputStream :(FMCPutFile*)putFileRPCRequest;


@end
