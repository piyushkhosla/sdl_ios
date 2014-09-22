//  FMCAppLinkV1ProtocolMessage.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "FMCAppLinkProtocolMessage.h"

@interface FMCAppLinkV1ProtocolMessage : FMCAppLinkProtocolMessage

- (id)initWithHeader:(FMCAppLinkProtocolHeader*)header andPayload:(NSData *)payload;
- (NSDictionary *)rpcDictionary;

@end
