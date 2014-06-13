//
//  FMCAppLinkProtocolMessageAssembler.m
//  ProtocolReWrite
//
//  Created by Yates, Hugh (H.R.) on 6/12/14.
//  Copyright (c) 2014 AppLink. All rights reserved.
//

#import "FMCAppLinkProtocolMessageAssembler.h"
#import "FMCAppLinkProtocolHeader.h"

@implementation FMCAppLinkProtocolMessageAssembler

- (id)initWithSessionID:(UInt8)sessionID {
    if (self == [super init]) {
        _sessionID = sessionID;
    }
    return self;
}

- (void)handleMessage:(FMCAppLinkProtocolMessage *)message withCompletionHandler:(AppLinkMessageAssemblyCompletionHandler)completionHandler {

    // Validate input
    if (message.header.sessionID != self.sessionID) {
        NSLog(@"Error: message part sent to wrong assembler.");
        return;
    }

    if (self.parts == nil) {
        self.parts = [NSMutableDictionary new];
    }


    // Determine which frame it is and save it.
    // Note: frames are numbered 1,2,3, ..., 0
    // Always 0 for last frame.
    if (message.header.frameType == FMCFrameType_First) {
        // If it's the first-frame, extract the meta-data
        self.expectedBytes = NSSwapBigIntToHost(((UInt32 *)message.payload.bytes)[0]);
        self.frameCount = NSSwapBigIntToHost(((UInt32 *)message.payload.bytes)[1]);
        self.parts[@"firstframe"] = message.payload;
    } else if (message.header.frameType == FMCFrameType_Consecutive) {
        // Save the frame w/ frame# as the key
        NSInteger frameNumber = message.header.frameData;
        NSNumber *frameNumberObj = [NSNumber numberWithUnsignedInteger:frameNumber];
        self.parts[frameNumberObj] = message.payload;
    }


    //
    // If we have all the parts, assemble it and execute the completion handler.
    //
    FMCAppLinkProtocolMessage *assembledMessage = nil;
    if (self.parts.count == self.frameCount + 1) { // +1 since we also require the first-frame

        // Create the header
        FMCAppLinkProtocolHeader *header = message.header.copy;
        header.frameType = FMCFrameType_Single;
        header.frameType = FMCFrameData_SingleFrame;


        // Create the payload
        NSMutableData *payload = [[NSMutableData alloc] init];
        for (unsigned int i = 1; i < self.frameCount; i++) {
            NSData* dataToAppend = [self.parts objectForKey:[NSNumber numberWithUnsignedInt:i]];
            [payload appendData:dataToAppend];
        }
        // Append the last frame, it has a frame # of 0.
        NSData* dataToAppend = [self.parts objectForKey:[NSNumber numberWithUnsignedInt:0]];
        [payload appendData:dataToAppend];

        // Validation
        if (payload.length != self.expectedBytes) {
            NSLog(@"Warning: collected bytes size of %i not equal to expected size of %i.", payload.length, (unsigned int)self.expectedBytes);
        }
        
        // Create the message.
        assembledMessage = [[FMCAppLinkProtocolMessage alloc] initWithHeader:header andPayload:payload];


        // Execute completion handler.
        if (completionHandler != nil) {
            completionHandler(YES, assembledMessage);
        }

        // Done with this data, release it.
        self.parts = nil;

    }

    // Not done, let caller know
    if (completionHandler != nil) {
        completionHandler(NO, nil);
    }

}

@end
