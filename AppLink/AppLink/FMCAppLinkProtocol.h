//  FMCAppLinkProtocol.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "FMCAbstractProtocol.h"
@class FMCAppLinkProtocolHeader;
@class FMCApplinkProtocolRecievedMessageRouter;


@interface FMCAppLinkProtocol : FMCAbstractProtocol <FMCProtocolListener>

- (void)sendStartSessionWithType:(FMCServiceType)serviceType;
- (void)sendEndSessionWithType:(FMCServiceType)serviceType sessionID:(Byte)sessionID;
- (void)sendRPCRequest:(FMCRPCRequest *)rpcRequest;
- (void)handleBytesFromTransport:(NSData *)receivedData;
- (void)sendHeartbeat;

@end
