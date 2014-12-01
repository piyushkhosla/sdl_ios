//
//  FMCIAPSession.m
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//
#import "FMCDebugTool.h"
#import "FMCIAPSession.h"
#import "FMCTimer.h"
#import "FMCIAPConfig.h"


@interface FMCIAPSession ()

@property (assign) BOOL isInputStreamOpen;
@property (assign) BOOL isOutputStreamOpen;
@property (strong) FMCTimer *inputStreamTimer;
@property (strong) FMCTimer *outputStreamTimer;

@end


@implementation FMCIAPSession

- (instancetype)initWithAccessory:(EAAccessory *)accessory forProtocol:(NSString *)protocol{
    NSString *logMessage = [NSString stringWithFormat:@"IAPSession initWithAccessory:%@ forProtocol:%@" , accessory, protocol];
    [FMCDebugTool logInfo:logMessage];


    self = [super init];
    if (self) {
        _delegate = nil;
        _accessory = accessory;
        _protocol = protocol;
        _streamDelegate = nil;
        _easession = nil;
        _isInputStreamOpen = NO;
        _isOutputStreamOpen = NO;
        _inputStreamTimer = nil;
        _outputStreamTimer = nil;
    }
    return self;
}

- (BOOL)open:(NSUInteger)mode {
    NSString *logMessage = [NSString stringWithFormat:@"Opening IAPSession withAccessory:%@ forProtocol:%@" , _accessory.name, _protocol];
    [FMCDebugTool logInfo:logMessage];

    BOOL success = NO;

    self.easession = [[EASession alloc] initWithAccessory:_accessory forProtocol:_protocol];
    if (_easession) {
        [FMCDebugTool logInfo:@"IAPSession Initialized, Opening Streams"];
        __weak typeof(self) weakSelf = self;

        // Setup the stream close event handler
        self.streamDelegate.streamEndHandler = ^(NSStream *stream){
            [FMCDebugTool logInfo:@"Stream Event End"];
            [weakSelf close];
            if (![LEGACY_PROTOCOL_STRING isEqualToString:weakSelf.protocol]) {
                [weakSelf open:mode];
            }

            // Clear stream open flags
            if ([stream isMemberOfClass:[NSInputStream class]]) {
                weakSelf.isInputStreamOpen = NO;
            } else if ([stream isMemberOfClass:[NSOutputStream class]]) {
                weakSelf.isOutputStreamOpen = NO;
            }
        };

        // Setup the stream open timed out event handler
        void (^elapsedBlock)(void) = ^{
            [FMCDebugTool logInfo:@"Stream Open Timeout"];
            [weakSelf close];
            [weakSelf open:mode];
        };

        // Setup the stream open event handler
        self.streamDelegate.streamOpenHandler = ^(NSStream *stream){
            // Cancel timers, set stream opened flag
            if (stream == [weakSelf.easession outputStream] &&
                weakSelf.outputStreamTimer != nil) {
                [FMCDebugTool logInfo:@"Output Stream Opened"];
                weakSelf.isOutputStreamOpen = YES;
                [weakSelf.outputStreamTimer cancel];
            } else if (stream == [weakSelf.easession inputStream] &&
                        weakSelf.inputStreamTimer != nil) {
                [FMCDebugTool logInfo:@"Input Stream Opened"];
                weakSelf.isInputStreamOpen = YES;
                [weakSelf.inputStreamTimer cancel];
            }

            // When both streams are open, session initialization is complete. Let the delegate know.
            if (weakSelf.isInputStreamOpen && weakSelf.isOutputStreamOpen) {
                [weakSelf.delegate onSessionInitializationComplete:YES];
            }
        };

        //
        // Open the appropriate stream(s)
        //
        if(mode & FMCIAPSessionRead) {
            if (self.inputStreamTimer == nil) {
                self.inputStreamTimer = [[FMCTimer alloc] initWithDuration:STREAM_OPEN_TIMEOUT_SECONDS];
                self.inputStreamTimer.elapsedBlock = elapsedBlock;
            }
            [FMCDebugTool logInfo:@"Opening Input Stream"];
            [self.inputStreamTimer start];
            [self startStream:_easession.inputStream];
        }

        if(mode & FMCIAPSessionWrite) {
            if (self.outputStreamTimer == nil) {
                self.outputStreamTimer = [[FMCTimer alloc] initWithDuration:STREAM_OPEN_TIMEOUT_SECONDS];
                self.outputStreamTimer.elapsedBlock = elapsedBlock;
            }
            [FMCDebugTool logInfo:@"Opening Output Stream"];
            [self.outputStreamTimer start];
            [self startStream:_easession.outputStream];
        }

        success = YES;
    } else {
        [FMCDebugTool logInfo:@"IAPSession Initialization Failed"];
    }


    return success;
}

- (void)close {
    [FMCDebugTool logInfo:@"IAPSession Closing"];

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
    [stream scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [stream open];
}

- (void)stopStream:(NSStream *)stream {
    [stream close];
    [stream removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [stream setDelegate:nil];
}

@end
