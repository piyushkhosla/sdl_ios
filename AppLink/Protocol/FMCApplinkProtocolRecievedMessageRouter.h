//
//  FMCApplinkProtocolRecievedMessageRouter.h
//  ProtocolReWrite
//
//  Created by Yates, Hugh (H.R.) on 6/12/14.
//  Copyright (c) 2014 AppLink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMCProtocolListener.h"
@class FMCAppLinkProtocolMessage;


@interface FMCApplinkProtocolRecievedMessageRouter : NSObject

@property (weak) id<FMCProtocolListener> delegate;

- (void)handleRecievedMessageAsynch:(FMCAppLinkProtocolMessage *)message;

@end
