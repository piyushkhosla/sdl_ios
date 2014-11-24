//
//  FMCStreamDelegate.m
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//

#import "FMCDebugTool.h"
#import "FMCStreamDelegate.h"

@implementation FMCStreamDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        _streamOpenHandler = defaultStreamOpenHandler;
        _streamHasBytesHandler = defaultStreamHasBytesHandler;
        _streamHasSpaceHandler = defaultStreamHasSpaceHandler;
        _streamErrorHandler = defaultStreamErrorHandler;
        _streamEndHandler = defaultStreamErrorHandler;
    }
    return self;
}

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)eventCode
{

    switch(eventCode)
    {
        case NSStreamEventOpenCompleted:
        {
            self.streamOpenHandler();
            break;
        }
        case NSStreamEventHasBytesAvailable:
        {
            self.streamHasBytesHandler((NSInputStream *)stream);
            break;
        }
        case NSStreamEventHasSpaceAvailable:
        {
            self.streamHasSpaceHandler((NSOutputStream *)stream);
            break;
        }
        case NSStreamEventErrorOccurred:
        {
            self.streamErrorHandler();
            break;
        }
        case NSStreamEventEndEncountered:
        {
            self.streamEndHandler();
            break;
        }
        case NSStreamEventNone:
        default:
        {
            break;
        }
    }
}

FMCStreamOpenHandler defaultStreamOpenHandler = ^(void) {
    [FMCDebugTool logInfo:@"Stream Open."];
};

FMCStreamHasBytesHandler defaultStreamHasBytesHandler = ^(NSInputStream *istream) {
    [FMCDebugTool logInfo:@"Stream Has Bytes."];
};

FMCStreamHasSpaceHandler defaultStreamHasSpaceHandler = ^(NSOutputStream *ostream) {
    [FMCDebugTool logInfo:@"Stream Has Space."];
};

FMCStreamErrorHandler defaultStreamErrorHandler = ^(void) {
    [FMCDebugTool logInfo:@"Stream Error."];
};

FMCStreamEndHandler defaultStreamEndHandler = ^(void) {
    [FMCDebugTool logInfo:@"Stream End."];
};

@end

