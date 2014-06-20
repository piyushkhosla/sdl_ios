//
//  NewFMCAppLinkProtocolMessage.m
//  ProtocolReWrite
//

#import "FMCAppLinkProtocolMessage.h"
#import "FMCRPCPayload.h"

@interface FMCAppLinkProtocolMessage ()

@property (strong) NSMutableData *internalBuffer;

@end

@implementation FMCAppLinkProtocolMessage

// For use in decoding a stream of bytes.
// Pass in bytes representing message (or beginning of message)
// Looks at and parses first byte to determine version.
+ (UInt8)determineVersion:(NSData *)data {
    UInt8 firstByte = ((UInt8*)data.bytes)[0];
    UInt8 version = firstByte >> 4;
    return version;
}

- (id)init {
	if (self = [super init]) {

	}
	return self;
}

- (id)initWithHeader:(FMCAppLinkProtocolHeader*)header andPayload:(NSData *)payload {
	if (self = [self init]) {
        self.header = header;
        self.payload = payload;
	}
	return self;
}

- (NSUInteger)size {
    return (self.header.size + self.payload.length);
}

- (NSData *)data {
    NSMutableData *dataOut = [NSMutableData dataWithCapacity:[self size]];
    [dataOut appendData:self.header.data];
    [dataOut appendData:self.payload];

    return dataOut;
}

- (NSString *)description {
    NSMutableString* description = [[NSMutableString alloc] init];
    [description appendString:self.header.description];
    [description appendFormat:@" Payload: %i bytes.", self.payload.length];
    return description;
}

@end
