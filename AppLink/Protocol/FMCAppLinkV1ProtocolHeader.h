//
//  NewFMCAppLinkV2ProtocolHeader.h
//  ProtocolReWrite
//

#import "FMCAppLinkProtocolHeader.h"

@interface FMCAppLinkV1ProtocolHeader : FMCAppLinkProtocolHeader

- (id)init;
- (NSData *)data;
- (id)copyWithZone:(NSZone *)zone;
- (void)parse:(NSData *)data;
- (NSString *)description;

@end
