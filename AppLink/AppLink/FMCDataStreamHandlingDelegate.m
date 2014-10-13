//
//  FMCDataStreamHandlingDelegate.m
//  AppLink
//

#import <objc/runtime.h>
#import "FMCAppLinkProtocolMessage.h"
#import "FMCDataStreamHandlingDelegate.h"
#import "FMCDebugTool.h"

@implementation FMCDataStreamHandlingDelegate

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)eventCode
{

    switch(eventCode)
    {
        case NSStreamEventHasBytesAvailable:
        {
            // Grab some bytes from the stream
            const int bufferSize = 1024;
            uint8_t buf[bufferSize];
            NSUInteger len = [(NSInputStream *)stream read:buf maxLength:bufferSize];
            if(len > 0)
            {
                NSData* data = [NSData dataWithBytes:buf length:len];
                [self.protocol sendRawData:data withServiceType:self.serviceType];
            }

            break;
        }
        case NSStreamEventEndEncountered:
        {
            // Cleanup the stream
            [stream close];
            [stream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            objc_setAssociatedObject(stream, @"RetainedDelegate", nil, OBJC_ASSOCIATION_RETAIN);

            break;
        }
        case NSStreamEventErrorOccurred:
        {
            [FMCDebugTool logInfo:@"Stream Event: Error" withType:FMCDebugType_RPC toOutput:FMCDebugOutput_All toGroup:self.protocol.debugConsoleGroupName];
            break;
        }
        default:
        {
            break;
        }
    }
}

@end
