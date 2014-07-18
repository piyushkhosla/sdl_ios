//  FMCAppLinkProtocolMessage.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "FMCAppLinkProtocolMessage.h"
#import "FMCAppLinkV1ProtocolMessage.h"
#import "FMCAppLinkV2ProtocolMessage.h"

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

- (NSDictionary *)rpcDictionary {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
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
    [description appendFormat:@" Payload: %lu bytes.", (unsigned long)self.payload.length];

    return description;
}

// Returns a V1 or V2 object
+ (id)messageWithHeader:(FMCAppLinkProtocolHeader*)header andPayload:(NSData *)payload {
    FMCAppLinkProtocolMessage *newMessage = nil;

    UInt8 version = header.version;
    if (version == 1) {
        newMessage = [[FMCAppLinkV1ProtocolMessage alloc] initWithHeader:(FMCAppLinkProtocolHeader*)header andPayload:(NSData *)payload];
    } else if (version >= 2) {
        newMessage = [[FMCAppLinkV2ProtocolMessage alloc] initWithHeader:(FMCAppLinkProtocolHeader*)header andPayload:(NSData *)payload];
    }

    return newMessage;
}

@end
