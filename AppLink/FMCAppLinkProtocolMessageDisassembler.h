//  FMCAppLinkProtocolMessageDisassembler.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCAppLinkProtocolMessage.h"

@interface FMCAppLinkProtocolMessageDisassembler : NSObject

+ (NSArray *)disassemble:(FMCAppLinkProtocolMessage *)protocolMessage withLimit:(NSUInteger)mtu;

@end
