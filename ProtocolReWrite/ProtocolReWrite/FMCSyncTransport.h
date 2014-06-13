//  FMCSyncTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCTransportListener.h"

@protocol FMCSyncTransport

@property (assign) int mtuSize;
@property (assign) id<FMCSyncTransport> delegate;

- (bool)connect;
- (void)disconnect;
- (bool)sendBytes:(NSData *)msg;

@end
