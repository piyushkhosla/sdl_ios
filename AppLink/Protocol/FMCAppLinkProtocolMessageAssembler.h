//
//  FMCAppLinkProtocolMessageAssembler.h
//  ProtocolReWrite
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
