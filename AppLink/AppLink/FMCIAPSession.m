//
//  FMCIAPSession.m
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//
#import "FMCDebugTool.h"
#import "FMCIAPSession.h"

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
    }
    return self;
}

- (BOOL)open:(NSUInteger)mode {
    NSString *logMessage = [NSString stringWithFormat:@"open accessory:%@ forProtocol:%@" , _accessory.name, _protocol];
    [FMCDebugTool logInfo:logMessage];

    BOOL success = NO;

    self.easession = [[EASession alloc] initWithAccessory:_accessory forProtocol:_protocol];
    if (_easession) {
        if(mode & FMCIAPSessionRead)
            [self startStream:_easession.inputStream];

        if(mode & FMCIAPSessionWrite)
            [self startStream:_easession.outputStream];
        
        success = YES;
    }

    return success;
}

- (void)close {
    NSString *logMessage = [NSString stringWithFormat:@"session::close"];
    [FMCDebugTool logInfo:logMessage];

    if (_easession) {
        [self stopStream:_easession.inputStream];
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
