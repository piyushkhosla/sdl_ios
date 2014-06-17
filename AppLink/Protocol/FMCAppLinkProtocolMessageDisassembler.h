//
//  FMCAppLinkProtocolMessageDisassembler.h
//  ProtocolReWrite
//

#import <Foundation/Foundation.h>
#import "FMCAppLinkProtocolMessage.h"

@interface FMCAppLinkProtocolMessageDisassembler : NSObject

+ (NSArray *)disassemble:(FMCAppLinkProtocolMessage *)protocolMessage withLimit:(NSUInteger)mtu;

@end
