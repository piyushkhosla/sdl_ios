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

@property (strong) FMCTimer *inputStreamTimer;
@property (strong) FMCTimer *outputStreamTimer;

@end


@implementation FMCIAPSession

- (instancetype)initWithAccessory:(EAAccessory *)accessory forProtocol:(NSString *)protocol{
    NSString *logMessage = [NSString stringWithFormat:@"IAPSession initWithAccessory:%@ forProtocol:%@" , accessory, protocol];
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
    NSString *logMessage = [NSString stringWithFormat:@"Opening IAPSession withAccessory:%@ forProtocol:%@" , _accessory.name, _protocol];
    [FMCDebugTool logInfo:logMessage];

    BOOL success = NO;

    self.easession = [[EASession alloc] initWithAccessory:_accessory forProtocol:_protocol];
    if (_easession) {
        [FMCDebugTool logInfo:@"EASession Opened"];
        __weak typeof(self) weakSelf = self;

        self.streamDelegate.streamEndHandler = ^{
            [FMCDebugTool logInfo:@"Stream Event End"];
            [weakSelf close];
            if (![LEGACY_PROTOCOL_STRING isEqualToString:weakSelf.protocol]) {
                [weakSelf open:mode];
            }
        };
        void (^elapsedBlock)(void) = ^{
            [FMCDebugTool logInfo:@"Stream Open Timeout"];
            [self close];
            [self open:mode];
        };
        self.streamDelegate.streamOpenHandler = ^(NSStream *stream){
            [FMCDebugTool logInfo:@"Stream Event Open"];
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
                self.inputStreamTimer = [[FMCTimer alloc] initWithDuration:STREAM_OPEN_TIMEOUT_SECONDS];
                self.inputStreamTimer.elapsedBlock = elapsedBlock;
            }
            [FMCDebugTool logInfo:@"Opening InputStream"];
            [self.inputStreamTimer start];
            [self startStream:_easession.inputStream];
        }

        if(mode & FMCIAPSessionWrite) {
            if (self.outputStreamTimer == nil) {
                self.outputStreamTimer = [[FMCTimer alloc] initWithDuration:STREAM_OPEN_TIMEOUT_SECONDS];
                self.outputStreamTimer.elapsedBlock = elapsedBlock;
            }
            [FMCDebugTool logInfo:@"Opening OutputStream"];
            [self.outputStreamTimer start];
            [self startStream:_easession.outputStream];
        }

        success = YES;
    }
    else {
        [FMCDebugTool logInfo:@"EASession Open Failed"];
    }
    
    if (success)
        [FMCDebugTool logInfo:@"IAPSession Opened"];
    else
        [FMCDebugTool logInfo:@"IAPSession Open Failed"];

    return success;
}

- (void)close {
    [FMCDebugTool logInfo:@"IAPSession closing"];

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
    [FMCDebugTool logInfo:@"IAPSession Closed"];
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
