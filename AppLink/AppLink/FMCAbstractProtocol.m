//  FMCAbstractProtocol.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "FMCAbstractProtocol.h"

@implementation FMCAbstractProtocol
- (id)init {
	if (self = [super init]) {
        _debugConsoleGroupName = @"default";
	}
	return self;
}


// Implement in subclasses.
- (void)sendStartSessionWithType:(FMCServiceType)serviceType {
	[self doesNotRecognizeSelector:_cmd];
}

- (void)sendEndSessionWithType:(FMCServiceType)serviceType {
	[self doesNotRecognizeSelector:_cmd];
}

- (void)sendRPCRequest:(FMCRPCRequest *)rpcRequest {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)sendHeartbeat {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)handleBytesFromTransport:(NSData *)receivedData {
	[self doesNotRecognizeSelector:_cmd];
}

- (void)sendRawDataStream:(NSInputStream *)inputStream withServiceType:(FMCServiceType)serviceType {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)sendRawData:(NSData *)data withServiceType:(FMCServiceType)serviceType {
    [self doesNotRecognizeSelector:_cmd];
}

- (void)dispose {
    [self doesNotRecognizeSelector:_cmd];
}


#pragma - FMCTransportListener Implementation
- (void)onTransportConnected {
	[self.protocolDelegate onProtocolOpened];
}

- (void)onTransportDisconnected {
	[self.protocolDelegate onProtocolClosed];
}

- (void)onDataReceived:(NSData *)receivedData {
	[self handleBytesFromTransport:receivedData];
}

@end
