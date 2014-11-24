//
//  FMCIAPSession.m
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//
#import "FMCDebugTool.h"
#import "FMCIAPSession.h"
#import "FMCTimer.h"


@interface FMCIAPSession ()

@property (strong) FMCTimer *inputStreamTimer;
@property (strong) FMCTimer *outputStreamTimer;

@end


@implementation FMCIAPSession

- (instancetype)initWithAccessory:(EAAccessory *)accessory forProtocol:(NSString *)protocol{
    NSString *logMessage = [NSString stringWithFormat:@"initWithAccessory:%@ forProtocol:%@" , accessory.name, protocol];
    [FMCDebugTool logInfo:logMessage];


    self = [super init];
    if (self) {
        _accessory = accessory;
        _protocol = protocol;
        _streamDelegate = nil;
        _easession = nil;
        _inputStreamTimer = nil;
        _outputStreamTimer = nil;
    }
    return self;
}

- (BOOL)open:(NSUInteger)mode {
    NSString *logMessage = [NSString stringWithFormat:@"open accessory:%@ forProtocol:%@" , _accessory.name, _protocol];
    [FMCDebugTool logInfo:logMessage];

    BOOL success = NO;

    self.easession = [[EASession alloc] initWithAccessory:_accessory forProtocol:_protocol];
    if (_easession) {
        __weak typeof(self) weakSelf = self;

        self.streamDelegate.streamEndHandler = ^{
            [weakSelf close];
            [weakSelf open];
        };
        void (^elapsedBlock)(void) = ^{
            [self close];
            [self open];
        };
        self.streamDelegate.streamOpenHandler = ^(NSStream *stream){
            if (stream == [weakSelf.easession outputStream] &&
                weakSelf.outputStreamTimer != nil) {
                [weakSelf.outputStreamTimer cancel];
            } else if (stream == [weakSelf.easession inputStream] &&
                        weakSelf.inputStreamTimer != nil) {
                [weakSelf.inputStreamTimer cancel];
            }
        };

        if(mode & FMCIAPSessionRead) {
            if (self.inputStreamTimer == nil) {
                self.inputStreamTimer = [[FMCTimer alloc] initWithDuration:10];
                self.inputStreamTimer.elapsedBlock = elapsedBlock;
            }
            [self.inputStreamTimer start];
            [self startStream:_easession.inputStream];
        }

        if(mode & FMCIAPSessionWrite) {
            if (self.outputStreamTimer == nil) {
                self.outputStreamTimer = [[FMCTimer alloc] initWithDuration:10];
                self.outputStreamTimer.elapsedBlock = elapsedBlock;
            }
            [self.outputStreamTimer start];
            [self startStream:_easession.outputStream];
        }

        success = YES;
    }

    return success;
}

- (void)close {
    NSString *logMessage = [NSString stringWithFormat:@"session::close"];
    [FMCDebugTool logInfo:logMessage];

    if (_easession) {
        if (self.inputStreamTimer) {
            [self.inputStreamTimer cancel];
        }
        [self stopStream:_easession.inputStream];
        if (self.outputStreamTimer) {
            [self.outputStreamTimer cancel];
        }
        [self stopStream:_easession.outputStream];
        self.easession = nil;
    }

}

- (void)startStream:(NSStream *)stream {
    stream.delegate = self.streamDelegate;
    [stream scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode]; // TODO: Probably want a dedicated runloop, not the main.
    [stream open];
}

- (void)stopStream:(NSStream *)stream {
    [stream close];
    [stream removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [stream setDelegate:nil];
}

@end
