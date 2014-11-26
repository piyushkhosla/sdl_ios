//  FMCSyncProxy.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//  Version: AppLink-20141001-130610-LOCAL-iOS

#import <Foundation/Foundation.h>
#import <AppLink/FMCProxyListener.h>
#import <AppLink/FMCRPCRequestFactory.h>
#import "FMCAbstractProtocol.h"
#import "FMCAbstractTransport.h"
#import "FMCTimer.h"

@interface FMCSyncProxy : NSObject <FMCProtocolListener, NSStreamDelegate> {
    Byte _version;
	Byte bulkSessionID;
	BOOL isConnected;
    BOOL alreadyDestructed;

}

@property (strong) FMCAbstractProtocol *protocol;
@property (strong) FMCAbstractTransport *transport;
@property (strong) NSMutableArray *proxyListeners;
@property (strong) FMCTimer *startSessionTimer;
@property (strong) NSString *debugConsoleGroupName;
@property (readonly) NSString *proxyVersion;

- (id)initWithTransport:(FMCAbstractTransport *)transport
               protocol:(FMCAbstractProtocol *)protocol
               delegate:(NSObject<FMCProxyListener> *)delegate;

- (void)dispose;
- (void)addDelegate:(NSObject<FMCProxyListener> *)delegate;

- (void)sendRPCRequest:(FMCRPCMessage *)msg;
- (void)handleRpcMessage:(NSDictionary *)msg;
- (void)handleProtocolMessage:(FMCAppLinkProtocolMessage *)msgData;

- (void)putFileStream:(NSInputStream *)inputStream withRequest:(FMCPutFile *)putFileRPCRequest;

+ (void)enableSiphonDebug;
+ (void)disableSiphonDebug;


@end
