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

- (void)startStream:(NSStream *)stream ;
- (void)stopStream:(NSStream *)stream;

@end


@implementation FMCIAPSession

- (instancetype)initWithAccessory:(EAAccessory *)accessory forProtocol:(NSString *)protocol{
    NSString *logMessage = [NSString stringWithFormat:@"FMCIAPSession initWithAccessory:%@ forProtocol:%@" , accessory, protocol];
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
    }
    return self;
}


- (BOOL)start {

    __weak typeof(self) weakSelf = self;

    NSString *logMessage = [NSString stringWithFormat:@"Opening EASession withAccessory:%@ forProtocol:%@" , _accessory.name, _protocol];
    [FMCDebugTool logInfo:logMessage];

    if ((self.easession = [[EASession alloc] initWithAccessory:_accessory forProtocol:_protocol])) {
        [FMCDebugTool logInfo:@"Created Session Object"];

        dispatch_queue_t _session_queue = dispatch_queue_create("com.ford.applink.session", DISPATCH_QUEUE_SERIAL);
        dispatch_async(_session_queue, ^{

            // Stream Error Handler
            weakSelf.streamDelegate.streamErrorHandler = ^(NSStream *stream) {
                [FMCDebugTool logInfo:@"Stream Error"];
                [weakSelf.delegate onSessionStreamsEnded:weakSelf];
            };

            // Stream Open Handler
            weakSelf.streamDelegate.streamOpenHandler = ^(NSStream *stream){

                if (stream == [weakSelf.easession outputStream]) {
                    [FMCDebugTool logInfo:@"Output Stream Opened"];
                    weakSelf.isOutputStreamOpen = YES;
                } else if (stream == [weakSelf.easession inputStream]) {
                    [FMCDebugTool logInfo:@"Input Stream Opened"];
                    weakSelf.isInputStreamOpen = YES;
                }

                // When both streams are open, session initialization is complete. Let the delegate know.
                if (weakSelf.isInputStreamOpen && weakSelf.isOutputStreamOpen) {
                    [weakSelf.delegate onSessionInitializationCompleteForSession:weakSelf];
                }
            };


            // Start the streams.
            [weakSelf startStream:weakSelf.easession.outputStream];
            [weakSelf startStream:weakSelf.easession.inputStream];
            [[NSRunLoop currentRunLoop] run]; // Note: This does not return! Thread stuck here.
        });

        return YES;

    } else {
        [FMCDebugTool logInfo:@"Error: Could Not Create Session Object"];
        return NO;
    }

}

- (void)stop {
    [self stopStream:self.easession.outputStream];
    [self stopStream:self.easession.inputStream];
    self.easession = nil;
}

- (void)startStream:(NSStream *)stream {
    NSRunLoop *loop = [NSRunLoop currentRunLoop];
    stream.delegate = self.streamDelegate;
    [stream scheduleInRunLoop:loop forMode:NSDefaultRunLoopMode];
    [stream open];
}

- (void)stopStream:(NSStream *)stream {

    // Verify stream is in a state that can be closed.
    // (N.B. Closing a stream that has not been opened has very, very bad effects.)

    // When you disconect the cable you get a stream end event and come here but stream is already in closed state.
    // Still need to remove from run loop.

    NSUInteger status1 = stream.streamStatus;
    if (status1 != NSStreamStatusNotOpen &&
        status1 != NSStreamStatusClosed) {

        [stream close];
    }

    [stream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [stream setDelegate:nil];

    NSUInteger status2 = stream.streamStatus;
    if (status2 == NSStreamStatusClosed) {
        if (stream == [self.easession inputStream]) {
            [FMCDebugTool logInfo:@"Input Stream Closed"];
        } else if (stream == [self.easession outputStream]) {
            [FMCDebugTool logInfo:@"Output Stream Closed"];
        }
    }
}

- (void)dealloc {
    self.delegate = nil;
    self.accessory = nil;
    self.protocol = nil;
    self.streamDelegate = nil;
    self.easession = nil;
    [FMCDebugTool logInfo:@"FMCIAPSession Dealloc"];
}

@end
