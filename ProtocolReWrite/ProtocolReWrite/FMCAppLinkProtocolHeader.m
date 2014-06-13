//
//  NewFMCAppLinkProtocolHeader.m
//  ProtocolReWrite
//

#import "FMCAppLinkProtocolHeader.h"
#import "FMCAppLinkV1ProtocolHeader.h"
#import "FMCAppLinkV2ProtocolHeader.h"

@implementation FMCAppLinkProtocolHeader

@synthesize version = _version;
@synthesize size = _size;

- (id)init {
	if (self = [super init]) {
        _version = 0;
        _size = 0;
	}
	return self;
}

- (id)copyWithZone:(NSZone *)zone {
    [self doesNotRecognizeSelector:_cmd];
    return 0;
}

- (NSData *)data {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (void)parse:(NSData *)data {
        [self doesNotRecognizeSelector:_cmd];
}

+ (FMCAppLinkProtocolHeader *)headerForVersion:(UInt8)version {
    if (version == 1) {
        return [[FMCAppLinkV1ProtocolHeader alloc] init];
    }

    if (version == 2) {
        return [[FMCAppLinkV2ProtocolHeader alloc] init];
    }

    // TODO: some error handling here if unknown version is asked for,
    // but that needs to be balanced against future proofing. i.e. V3.
    // Requirements around V3 are as yet undefined so give a V2 header
    return [[FMCAppLinkV2ProtocolHeader alloc] init];
}

@end
