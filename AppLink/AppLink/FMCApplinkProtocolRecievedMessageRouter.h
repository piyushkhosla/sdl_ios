//  FMCApplinkProtocolRecievedMessageRouter.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCProtocolListener.h"
@class FMCAppLinkProtocolMessage;


@interface FMCApplinkProtocolRecievedMessageRouter : NSObject

@property (weak) id<FMCProtocolListener> delegate;

- (void)handleRecievedMessage:(FMCAppLinkProtocolMessage *)message;

@end
