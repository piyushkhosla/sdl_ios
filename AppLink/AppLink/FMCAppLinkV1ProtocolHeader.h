//  FMCAppLinkV1ProtocolHeader.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "FMCAppLinkProtocolHeader.h"

@interface FMCAppLinkV1ProtocolHeader : FMCAppLinkProtocolHeader

- (id)init;
- (NSData *)data;
- (id)copyWithZone:(NSZone *)zone;
- (void)parse:(NSData *)data;
- (NSString *)description;

@end
