//
//  FMCIAPSession.m
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//

#import "FMCIAPSession.h"

@implementation FMCIAPSession

- (instancetype)initWithAccessory:(EAAccessory *)accessory forProtocol:(NSString *)protocol{

    self = [super init];
    if (self) {
        _accessory = accessory;
        _protocol = protocol;
        _streamDelegate = nil;
        _easession = nil;
    }
    return self;
}

- (BOOL)open {
    BOOL success = NO;

    self.easession = [[EASession alloc] initWithAccessory:_accessory forProtocol:_protocol];
    if (_easession) {
        [self startStream:_easession.inputStream];
        [self startStream:_easession.outputStream];
        success = YES;
    }

    return success;
}

- (void)close {

    if (_easession) {
        [self stopStream:_easession.inputStream];
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
