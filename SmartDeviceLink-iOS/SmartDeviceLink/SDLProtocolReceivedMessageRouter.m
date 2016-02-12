//  SDLProtocolReceivedMessageRouter.m
//

//  This class gets handed the SDLProtocol messages as they are received and decides what happens to them and where they are sent on to.

#import "SDLProtocolReceivedMessageRouter.h"
#import "SDLProtocolMessage.h"
#import "SDLProtocolMessageAssembler.h"
#import "SDLDebugTool.h"


@interface SDLProtocolReceivedMessageRouter ()

@property (assign) BOOL alreadyDestructed;
@property (strong) NSMutableDictionary *messageAssemblers;

- (void)dispatchProtocolMessage:(SDLProtocolMessage *)message;
- (void)dispatchControlMessage:(SDLProtocolMessage *)message;
- (void)dispatchMultiPartMessage:(SDLProtocolMessage *)message;

@end


@implementation SDLProtocolReceivedMessageRouter

- (instancetype)init {
    if (self = [super init]) {
        _alreadyDestructed = NO;
        self.messageAssemblers = [NSMutableDictionary dictionaryWithCapacity:2];
    }
    return self;
}

- (void)handleReceivedMessage:(SDLProtocolMessage *)message {
    SDLFrameType frameType = message.header.frameType;

    switch (frameType) {
        case SDLFrameType_Single: {
            [self dispatchProtocolMessage:message];
        } break;
        case SDLFrameType_Control: {
            [self dispatchControlMessage:message];
        } break;
        case SDLFrameType_First: // fallthrough
        case SDLFrameType_Consecutive: {
            [self dispatchMultiPartMessage:message];
        } break;
        default: break;
    }
}

- (void)dispatchProtocolMessage:(SDLProtocolMessage *)message {
    if ([self.delegate respondsToSelector:@selector(onProtocolMessageReceived:)]) {
        [self.delegate onProtocolMessageReceived:message];
    }
}

- (void)dispatchControlMessage:(SDLProtocolMessage *)message {
    switch (message.header.frameData) {
        case SDLFrameData_StartSessionACK: {
            if ([self.delegate respondsToSelector:@selector(handleProtocolStartSessionACK:sessionID:version:)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
                [self.delegate handleProtocolStartSessionACK:message.header.serviceType
                                                   sessionID:message.header.sessionID
                                                     version:message.header.version];
#pragma clang diagnostic pop
            }
            
            if ([self.delegate respondsToSelector:@selector(handleProtocolStartSessionACK:)]) {
                [self.delegate handleProtocolStartSessionACK:message.header];
            }
        } break;
        case SDLFrameData_StartSessionNACK: {
            if ([self.delegate respondsToSelector:@selector(handleProtocolStartSessionNACK:)]) {
                [self.delegate handleProtocolStartSessionNACK:message.header.serviceType];
            }
        } break;
        case SDLFrameData_EndSessionACK: {
            if ([self.delegate respondsToSelector:@selector(handleProtocolEndSessionACK:)]) {
                [self.delegate handleProtocolEndSessionACK:message.header.serviceType];
            }
        } break;
        case SDLFrameData_EndSessionNACK: {
            if ([self.delegate respondsToSelector:@selector(handleProtocolStartSessionNACK:)]) {
                [self.delegate handleProtocolEndSessionNACK:message.header.serviceType];
            }
        } break;
        case SDLFrameData_Heartbeat: {
            if ([self.delegate respondsToSelector:@selector(handleHeartbeatForSession:)]) {
                [self.delegate handleHeartbeatForSession:message.header.sessionID];
            }
        } break;
        case SDLFrameData_HeartbeatACK: {
            if ([self.delegate respondsToSelector:@selector(handleHeartbeatACK)]) {
                [self.delegate handleHeartbeatACK];
            }
        } break;
        default: break;
    }
}

- (void)dispatchMultiPartMessage:(SDLProtocolMessage *)message {
    // Pass multipart messages to an assembler and call delegate when done.
    NSNumber *sessionID = [NSNumber numberWithUnsignedChar:message.header.sessionID];

    SDLProtocolMessageAssembler *assembler = self.messageAssemblers[sessionID];
    if (assembler == nil) {
        assembler = [[SDLProtocolMessageAssembler alloc] initWithSessionID:message.header.sessionID];
        self.messageAssemblers[sessionID] = assembler;
    }

    SDLMessageAssemblyCompletionHandler completionHandler = ^void(BOOL done, SDLProtocolMessage *assembledMessage) {
        if (done) {
            [self dispatchProtocolMessage:assembledMessage];
        }
    };
    [assembler handleMessage:message withCompletionHandler:completionHandler];
}

- (void)destructObjects {
    if (!self.alreadyDestructed) {
        self.alreadyDestructed = YES;
        self.delegate = nil;
    }
}

- (void)dispose {
    [self destructObjects];
}

- (void)dealloc {
    [self destructObjects];
}

@end
