//
//  FMCAppLinkV1ProtocolMessage.m
//  SyncProxyTester
//


#import "FMCAppLinkV1ProtocolMessage.h"
#import "FMCJsonDecoder.h"

@implementation FMCAppLinkV1ProtocolMessage

- (id)initWithHeader:(FMCAppLinkProtocolHeader*)header andPayload:(NSData *)payload {
	if (self = [self init]) {
        self.header = header;
        self.payload = payload;
	}
	return self;
}

- (NSDictionary *)rpcDictionary {
    NSDictionary* rpcMessageAsDictionary = [[FMCJsonDecoder instance] decode:self.payload];
    return rpcMessageAsDictionary;
}

@end
