//
//  FMCAppLinkV2ProtocolMessage.h
//  SyncProxyTester
//

#import "FMCAppLinkProtocolMessage.h"

@interface FMCAppLinkV2ProtocolMessage : FMCAppLinkProtocolMessage

- (id)initWithHeader:(FMCAppLinkProtocolHeader*)header andPayload:(NSData *)payload;
- (NSDictionary *)rpcDictionary;

@end
