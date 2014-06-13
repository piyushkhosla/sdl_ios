//  FMCProtocol.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCProtocolListener.h"
#import "FMCAppLinkProtocolMessage.h"
#import "FMCSyncTransport.h"
#import "FMCTransportListener.h"

@protocol FMCProtocol<FMCTransportListener>

@property(strong) id<FMCSyncTransport> transport;

- (void)handleBytesFromTransport:(NSData *)receivedData;
- (void)sendStartSessionWithType:(FMCServiceType)sessionType;
- (void)sendEndSessionWithType:(FMCServiceType)sessionType sessionID:(Byte)sessionID;
- (void)sendData:(FMCAppLinkProtocolMessage *)protocolMsg;

@end