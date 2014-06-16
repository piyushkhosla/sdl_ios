//
//  FMCAppLinkProtocolMessageAssembler.h
//  ProtocolReWrite
//
//  Created by Yates, Hugh (H.R.) on 6/12/14.
//  Copyright (c) 2014 AppLink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMCAppLinkProtocolMessage.h"

typedef void(^AppLinkMessageAssemblyCompletionHandler)(BOOL done, FMCAppLinkProtocolMessage *assembledMessage);


@interface FMCAppLinkProtocolMessageAssembler : NSObject

@property (assign, readonly) UInt8 sessionID;
@property (assign) UInt32 frameCount; // number of consecutive frames required for reassembly
@property (assign) UInt32 expectedBytes;
@property (strong) NSMutableDictionary *parts;

- (id)initWithSessionID:(UInt8)sessionID;
- (void)handleMessage:(FMCAppLinkProtocolMessage *)message withCompletionHandler:(AppLinkMessageAssemblyCompletionHandler)completionHandler;

@end
