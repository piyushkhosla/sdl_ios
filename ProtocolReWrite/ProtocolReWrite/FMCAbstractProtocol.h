//  FMCAbstractProtocol.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCProtocol.h"
#import "FMCSyncTransport.h"
#import "FMCProtocolListener.h"


@interface FMCAbstractProtocol : NSObject<FMCProtocol>

@property (strong) id<FMCSyncTransport> transport;
@property (weak) id<FMCProtocolListener> protocolDelegate;

@end
