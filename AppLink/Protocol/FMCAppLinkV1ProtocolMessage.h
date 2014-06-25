//
//  FMCAppLinkV1ProtocolMessage.h
//  SyncProxyTester
//

#import "FMCAppLinkProtocolMessage.h"

@interface FMCAppLinkV1ProtocolMessage : FMCAppLinkProtocolMessage

- (id)initWithHeader:(FMCAppLinkProtocolHeader*)header andPayload:(NSData *)payload;
- (NSDictionary *)rpcDictionary;

@end
