//
//  NewFMCAppLinkV2ProtocolHeader.h
//  ProtocolReWrite
//

#import "FMCAppLinkProtocolHeader.h"

@interface FMCAppLinkV2ProtocolHeader : FMCAppLinkProtocolHeader

@property (assign) UInt32 messageID;

- (id)init;
- (id)copyWithZone:(NSZone *)zone;
- (NSData *)data;
- (void)parse:(NSData *)data;
- (NSString *)description;

@end
