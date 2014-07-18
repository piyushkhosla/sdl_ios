//  FMCProtocolListener.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>

#import "FMCAppLinkProtocolHeader.h"
@class FMCAppLinkProtocolMessage;

@protocol FMCProtocolListener

- (void)handleProtocolSessionStarted:(FMCServiceType)serviceType sessionID:(Byte)sessionID version:(Byte)version;
- (void)onProtocolMessageReceived:(FMCAppLinkProtocolMessage *)msg;

- (void)onProtocolOpened;
- (void)onProtocolClosed;
- (void)onError:(NSString *)info exception:(NSException *)e;

@end

