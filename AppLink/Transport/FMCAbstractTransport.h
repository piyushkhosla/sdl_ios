//  FMCAbstractTransport.h
//  FMCAbstractSyncTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCTransport.h"
#import "FMCTransportDelegate.h"

@interface FMCAbstractTransport : NSObject<FMCTransport>

@property (weak) id<FMCTransportDelegate> delegate;
//@property (readonly) bool isConnected;

- (void)notifyTransportConnected;
- (void)notifyTransportDisconnected;
- (void)handleDataReceivedFromTransport:(NSData *)receivedData;

@end
