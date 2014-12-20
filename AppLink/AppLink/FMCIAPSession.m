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
@property (assign) BOOL alreadyDestructed;
@end


@implementation FMCIAPSession

- (instancetype)initWithAccessory:(EAAccessory *)accessory forProtocol:(NSString *)protocol{
    NSString *logMessage = [NSString stringWithFormat:@"FMCIAPSession initWithAccessory:%@ forProtocol:%@" , accessory, protocol];
    [FMCDebugTool logInfo:logMessage];


    self = [super init];
    if (self) {
        _alreadyDestructed = NO;
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

- (BOOL)open {
    NSString *logMessage = [NSString stringWithFormat:@"Opening IAPSession withAccessory:%@ forProtocol:%@" , _accessory.name, _protocol];
    [FMCDebugTool logInfo:logMessage];

    BOOL success = NO;

    self.easession = [[EASession alloc] initWithAccessory:_accessory forProtocol:_protocol];
    if (_easession) {
        [FMCDebugTool logInfo:@"EASession Initialized, Opening Streams"];
        __weak typeof(self) weakSelf = self;

        // Setup the stream close event handler
        self.streamDelegate.streamEndHandler = ^(NSStream *stream){
            [FMCDebugTool logInfo:@"Stream Event End"];

            [weakSelf close];
        };

        self.streamDelegate.streamErrorHandler = ^(NSStream *stream){
            [FMCDebugTool logInfo:@"Stream Error"];
            
            [weakSelf close];
        };

        // Setup the stream open timed out event handler
        void (^elapsedBlock)(void) = ^{
            [FMCDebugTool logInfo:@"Stream Open Timeout"];
            [weakSelf close];
            [weakSelf open];
        };


        // Setup the stream open event handler
        self.streamDelegate.streamOpenHandler = ^(NSStream *stream){
            // Cancel timers, set stream opened flag
            if (stream == [weakSelf.easession outputStream]) {
                [FMCDebugTool logInfo:@"Output Stream Opened"];
                weakSelf.isOutputStreamOpen = YES;

                if (weakSelf.outputStreamTimer != nil) {
                    [weakSelf.outputStreamTimer cancel];
                }
            } else if (stream == [weakSelf.easession inputStream]) {
                [FMCDebugTool logInfo:@"Input Stream Opened"];
                weakSelf.isInputStreamOpen = YES;

                if (weakSelf.inputStreamTimer != nil) {
                    [weakSelf.inputStreamTimer cancel];
                }
            }

            // When both streams are open, session initialization is complete. Let the delegate know.
            if (weakSelf.isInputStreamOpen && weakSelf.isOutputStreamOpen) {
                [weakSelf.delegate onSessionInitializationComplete:YES];
            }
        };

        //
        // Open the streams
        //
        if (self.inputStreamTimer == nil) {
            self.inputStreamTimer = [[FMCTimer alloc] initWithDuration:STREAM_OPEN_TIMEOUT_SECONDS];
            self.inputStreamTimer.elapsedBlock = elapsedBlock;
        }
        [self.inputStreamTimer start];
        [FMCDebugTool logInfo:@"Opening Input Stream"];
        [self startStream:_easession.inputStream];

        if (self.outputStreamTimer == nil) {
            self.outputStreamTimer = [[FMCTimer alloc] initWithDuration:STREAM_OPEN_TIMEOUT_SECONDS];
            self.outputStreamTimer.elapsedBlock = elapsedBlock;
        }
        [self.outputStreamTimer start];
        [FMCDebugTool logInfo:@"Opening Output Stream"];
        [self startStream:_easession.outputStream];

        NSRunLoop *loop = [NSRunLoop currentRunLoop];
        [loop run];
        
        success = YES;

    } else {
        [FMCDebugTool logInfo:@"EASession Initialization Failed"];
    }


    return success;
}

- (void)close {
    [FMCDebugTool logInfo:@"FMCIAPSession Closing"];


    if (_easession) {
        // Cancel input stream open timer (if set)
        if (self.inputStreamTimer) {
            [self.inputStreamTimer cancel];
            self.inputStreamTimer = nil;
        }
        // Close input stream (if open)
        if (self.isInputStreamOpen) {
            [self stopStream:_easession.inputStream];
            self.isInputStreamOpen = NO;
        }

        // Cancel output stream open timer (if set)
        if (self.outputStreamTimer) {
            [self.outputStreamTimer cancel];
            self.outputStreamTimer = nil;
        }
        // Close output stream (if open)
        if (self.isOutputStreamOpen) {
            [self stopStream:_easession.outputStream];
            self.isOutputStreamOpen = NO;
        }

        self.easession = nil;
    }



}

- (void)startStream:(NSStream *)stream {
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    stream.delegate = self.streamDelegate;
    [stream scheduleInRunLoop:loop forMode:NSDefaultRunLoopMode];
    [stream open];
}

- (void)stopStream:(NSStream *)stream {

    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    // Verify stream is in a state that can be closed.
    // (N.B. Closing a stream that has not been opened has very, very bad effects.)
    if (stream.streamStatus != NSStreamStatusNotOpen &&
        stream.streamStatus != NSStreamStatusClosed) {

        [stream close];
        [stream removeFromRunLoop:loop forMode:NSDefaultRunLoopMode];
        [stream setDelegate:nil];
            
        if (stream.streamStatus == NSStreamStatusClosed) {

            if (stream == [self.easession inputStream]) {
                [FMCDebugTool logInfo:@"Input Stream Closed"];
            } else if (stream == [self.easession outputStream]) {
                [FMCDebugTool logInfo:@"Output Stream Closed"];
            }
        }
    }
}

- (void)destructObjects {
    if(!self.alreadyDestructed) {
        self.alreadyDestructed = YES;
        self.delegate = nil;
        self.accessory = nil;
        self.protocol = nil;
        self.streamDelegate = nil;
        self.easession = nil;
        self.inputStreamTimer = nil;
        self.outputStreamTimer = nil;
    }
}

- (void)dispose {
    [self destructObjects];
}

- (void)dealloc {
    [self destructObjects];
    [FMCDebugTool logInfo:@"FMCIAPSession Dealloc"];
}

@end
