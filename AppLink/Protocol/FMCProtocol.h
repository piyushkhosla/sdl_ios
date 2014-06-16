//  FMCProtocol.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCProtocolListener.h"
#import "FMCAppLinkProtocolMessage.h"
#import "FMCTransport.h"
#import "FMCTransportDelegate.h"

@protocol FMCProtocol<FMCTransportDelegate>

@property (weak) id<FMCProtocolListener> protocolDelegate;
@property (strong) id<FMCTransport> transport;

- (void)handleBytesFromTransport:(NSData *)receivedData;
- (void)sendStartSessionWithType:(FMCServiceType)sessionType;
- (void)sendEndSessionWithType:(FMCServiceType)sessionType sessionID:(Byte)sessionID;
- (void)sendData:(FMCAppLinkProtocolMessage *)protocolMsg;

@end