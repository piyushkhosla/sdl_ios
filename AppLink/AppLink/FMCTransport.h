//  FMCTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCTransportDelegate.h"

@protocol FMCTransport

@property (weak) id<FMCTransportDelegate> delegate;

- (void)connect;
- (void)disconnect;
- (void)sendData:(NSData *)dataToSend;
- (void)unregister;

@end
