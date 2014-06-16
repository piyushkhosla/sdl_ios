//  FMCTransport.h
//  FMCSyncTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCTransportDelegate.h"

@protocol FMCTransport

@property (weak) id<FMCTransportDelegate> delegate;

- (bool)connect;
- (void)disconnect;
- (bool)sendData:(NSData *)dataToSend;

@end
