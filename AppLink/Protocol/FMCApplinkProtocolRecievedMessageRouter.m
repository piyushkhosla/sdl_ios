//
//  FMCApplinkProtocolRecievedMessageRouter.m
//  ProtocolReWrite
//
//  This class gets handed the FMCAppLinkProtocol messages as they are recieved
//  and decides what happens to them and where they are sent on to.
//

#import "FMCApplinkProtocolRecievedMessageRouter.h"
#import "FMCAppLinkProtocolMessage.h"
#import "FMCAppLinkProtocolMessageAssembler.h"


@implementation FMCApplinkProtocolRecievedMessageRouter

- (id)init {
	if (self = [super init]) {
        self.messageAssemblers = [NSMutableDictionary dictionaryWithCapacity:2];
	}
	return self;
}

- (void)handleRecievedMessage:(FMCAppLinkProtocolMessage *)message {

    FMCFrameType frameType = message.header.frameType;

    switch (frameType) {
        case FMCFrameType_Single:
            [self handleProtocolMessage:message];
            break;

        case FMCFrameType_Control:
            [self handleControlMessage:message];
            break;

        case FMCFrameType_First:
        case FMCFrameType_Consecutive:
            [self handleMultiPartMessage:message];
            break;

        default:
            break;
    }

}

- (void)handleProtocolMessage:(FMCAppLinkProtocolMessage *)message {
    [self.delegate onProtocolMessageReceived:message];
}

- (void)handleControlMessage:(FMCAppLinkProtocolMessage *)message {

    if (message.header.frameData == FMCFrameData_StartSessionACK) {
        [self.delegate handleProtocolSessionStarted:message.header.serviceType
                                          sessionID:message.header.sessionID
                                            version:message.header.version];
    }
}


- (void)handleMultiPartMessage:(FMCAppLinkProtocolMessage *)message {

    // Pass multipart messages to an assembler and call delegate when done.
    NSNumber *sessionID = [NSNumber numberWithUnsignedChar:message.header.sessionID];

    FMCAppLinkProtocolMessageAssembler *assembler = self.messageAssemblers[sessionID];
    if (assembler == nil) {
        assembler = [[FMCAppLinkProtocolMessageAssembler alloc] initWithSessionID:message.header.sessionID];
        self.messageAssemblers[sessionID] = assembler;
    }

    AppLinkMessageAssemblyCompletionHandler completionHandler = ^void(BOOL done, FMCAppLinkProtocolMessage *assembledMessage) {
        if (done) {
            [self handleProtocolMessage:message];
        }
    };
    [assembler handleMessage:message withCompletionHandler:completionHandler];

}


@end
