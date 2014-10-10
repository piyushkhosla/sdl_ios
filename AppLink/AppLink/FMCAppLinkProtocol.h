//  FMCAppLinkProtocol.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "FMCAbstractProtocol.h"
@class FMCAppLinkProtocolHeader;
@class FMCApplinkProtocolRecievedMessageRouter;


@interface FMCAppLinkProtocol : FMCAbstractProtocol <FMCProtocolListener>

// Sending
- (void)sendStartSessionWithType:(FMCServiceType)serviceType;
- (void)sendEndSessionWithType:(FMCServiceType)serviceType;
- (void)sendRPCRequest:(FMCRPCRequest *)rpcRequest;
- (void)sendHeartbeat;
- (void)sendRawDataStream:(NSInputStream *)inputStream withServiceType:(FMCServiceType)serviceType;
- (void)sendRawData:(NSData *)data withServiceType:(FMCServiceType)serviceType;

// Recieving
- (void)handleBytesFromTransport:(NSData *)receivedData;

@end
