//
//  NewFMCAppLinkProtocolMessage.h
//  ProtocolReWrite
//

#import "FMCAppLinkProtocolHeader.h"


@interface FMCAppLinkProtocolMessage : NSObject

@property (strong) FMCAppLinkProtocolHeader *header;
@property (strong) NSData *payload;
@property (strong, readonly) NSData *data;

- (id)init;
- (id)initWithHeader:(FMCAppLinkProtocolHeader*)header andPayload:(NSData *)payload;
- (NSUInteger)size;
- (NSString *)description;

+ (UInt8)determineVersion:(NSData *)data;


@end
