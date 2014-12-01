//  FMCAbstractProtocol.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCRPCRequest.h"
#import "FMCAbstractTransport.h"
#import "FMCProtocolListener.h"


@interface FMCAbstractProtocol : NSObject <FMCTransportDelegate>

@property (strong) NSString *debugConsoleGroupName;
@property (weak) FMCAbstractTransport *transport;
@property (weak) id<FMCProtocolListener> protocolDelegate;

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
