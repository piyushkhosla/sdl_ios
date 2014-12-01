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
            self.streamOpenHandler(stream);
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
            self.streamErrorHandler(stream);
            break;
        }
        case NSStreamEventEndEncountered:
        {
            self.streamEndHandler(stream);
            break;
        }
        case NSStreamEventNone:
        default:
        {
            break;
        }
    }
}

FMCStreamOpenHandler defaultStreamOpenHandler = ^(NSStream *stream) {
    [FMCDebugTool logInfo:@"Stream Event Open"];
};

FMCStreamHasBytesHandler defaultStreamHasBytesHandler = ^(NSInputStream *istream) {
    [FMCDebugTool logInfo:@"Stream Event Has Bytes"];
};

FMCStreamHasSpaceHandler defaultStreamHasSpaceHandler = ^(NSOutputStream *ostream) {

};

FMCStreamErrorHandler defaultStreamErrorHandler = ^(NSStream *stream) {
    [FMCDebugTool logInfo:@"Stream Event Error"];
};

FMCStreamEndHandler defaultStreamEndHandler = ^(NSStream *stream) {
    [FMCDebugTool logInfo:@"Stream Event End"];
};

@end

