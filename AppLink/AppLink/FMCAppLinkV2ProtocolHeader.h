//  FMCAppLinkV2ProtocolHeader.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "FMCAppLinkProtocolHeader.h"

@interface FMCAppLinkV2ProtocolHeader : FMCAppLinkProtocolHeader

@property (assign) UInt32 messageID;

- (id)init;
- (id)copyWithZone:(NSZone *)zone;
- (NSData *)data;
- (void)parse:(NSData *)data;
- (NSString *)description;

@end
