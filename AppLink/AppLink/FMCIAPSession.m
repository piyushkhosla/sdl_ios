//
//  FMCIAPSession.m
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//

#import "FMCIAPSession.h"
#import "FMCTimer.h"


@interface FMCIAPSession ()

@property (strong) FMCTimer *inputStreamTimer;
@property (strong) FMCTimer *outputStreamTimer;

@end


@implementation FMCIAPSession

- (instancetype)initWithAccessory:(EAAccessory *)accessory forProtocol:(NSString *)protocol{

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

- (BOOL)open {
    BOOL success = NO;

    self.easession = [[EASession alloc] initWithAccessory:_accessory forProtocol:_protocol];
    if (_easession) {
        
        __weak typeof(self) weakSelf = self;
        
        self.streamDelegate.streamOpenHandler = ^(NSStream *stream){
            if (stream == [weakSelf.easession outputStream]) {
                [weakSelf.outputStreamTimer cancel];
            } else if (stream == [weakSelf.easession inputStream]) {
                [weakSelf.inputStreamTimer cancel];
            }
        };
        
        self.streamDelegate.streamEndHandler = ^{
            [weakSelf close];
            [weakSelf open];
        };
        
        void (^elapsedBlock)(void) = ^{
            [self close];
            [self open];
        };
        if (self.inputStreamTimer == nil) {
            self.inputStreamTimer = [[FMCTimer alloc] initWithDuration:10];
            self.inputStreamTimer.elapsedBlock = elapsedBlock;
        }
        if (self.outputStreamTimer == nil) {
            self.outputStreamTimer = [[FMCTimer alloc] initWithDuration:10];
            self.outputStreamTimer.elapsedBlock = elapsedBlock;
        }
        
        [self.inputStreamTimer start];
        [self startStream:_easession.inputStream];
        [self.outputStreamTimer start];
        [self startStream:_easession.outputStream];
        success = YES;
    }

    return success;
}

- (void)close {

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
    [stream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [stream open];
}

- (void)stopStream:(NSStream *)stream {
    [stream close];
    [stream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [stream setDelegate:nil];
}

@end
