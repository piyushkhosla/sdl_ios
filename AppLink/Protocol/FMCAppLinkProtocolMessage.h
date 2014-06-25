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
+ (id)messageWithHeader:(FMCAppLinkProtocolHeader*)header andPayload:(NSData *)payload; // Returns a V1 or V2 object

- (NSUInteger)size;
- (NSString *)description;
- (NSDictionary *)rpcDictionary; // Use for RPC type messages to obtain the data in a dictionary

+ (UInt8)determineVersion:(NSData *)data;


@end
