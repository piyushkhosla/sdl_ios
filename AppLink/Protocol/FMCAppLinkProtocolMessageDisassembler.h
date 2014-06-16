//
//  FMCAppLinkProtocolMessageDisassembler.h
//  ProtocolReWrite
//
//  Created by Yates, Hugh (H.R.) on 6/10/14.
//  Copyright (c) 2014 AppLink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMCAppLinkProtocolMessage.h"

@interface FMCAppLinkProtocolMessageDisassembler : NSObject

+ (NSArray *)disassemble:(FMCAppLinkProtocolMessage *)protocolMessage withLimit:(NSUInteger)mtu;

@end
