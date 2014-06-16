//  FMCAbstractTransport.m
//  FMCAbstractSyncTransport.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "FMCAbstractTransport.h"

@implementation FMCAbstractTransport


- (void)notifyTransportConnected {
//	_isConnected = YES;
	[self.delegate onTransportConnected];
}

- (void)notifyTransportDisconnected {
//	if (self.isConnected) {
        [self.delegate onTransportDisconnected];
//	}
//    _isConnected = NO;
}

- (void)handleDataReceivedFromTransport:(NSData *)receivedData {
    
    [self.delegate onDataReceived:receivedData];
}


#pragma mark FMCTransport Implementation

- (bool)connect {
	[self doesNotRecognizeSelector:_cmd];
	return NO;
}

- (void)disconnect {
	[self doesNotRecognizeSelector:_cmd];
}

- (bool)sendData:(NSData *)dataToSend {
	[self doesNotRecognizeSelector:_cmd];
	return NO;
}

@end
