//  FMCIAPTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "FMCIAPSession.h"
#import "FMCDebugTool.h"
#import "FMCSiphonServer.h"
#import "FMCIAPConfig.h"
#import "FMCIAPConnectionManager.h"
#import "FMCIAPTransport.h"
#import "FMCStreamDelegate.h"

@interface FMCIAPTransport () {
    dispatch_queue_t _io_queue;
}

- (void)startEventListening;
- (void)stopEventListening;

@end



@implementation FMCIAPTransport

- (instancetype)init {
    if (self = [super init]) {

        [FMCDebugTool logInfo:@"FMCIAPTransport Init"
                     withType:FMCDebugType_Transport_iAP
                     toOutput:FMCDebugOutput_All
                      toGroup:self.debugConsoleGroupName];

        _io_queue = dispatch_queue_create("com.ford.applink.transport", DISPATCH_QUEUE_SERIAL);

        [self startEventListening];
        [FMCSiphonServer init];
    }
    return self;
}

- (void)startEventListening {

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(accessoryConnected:)
                                                 name:EAAccessoryDidConnectNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(accessoryDisconnected:)
                                                 name:EAAccessoryDidDisconnectNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillEnterForeground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidEnterBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];

}

- (void)stopEventListening {

    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:EAAccessoryDidConnectNotification
                                                  object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:EAAccessoryDidDisconnectNotification
                                                  object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationDidEnterBackgroundNotification
                                                  object:nil];

    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIApplicationWillEnterForegroundNotification
                                                  object:nil];

}


#pragma mark - FMCTransport Implementation

- (void)connect {
    [FMCDebugTool logInfo:@"Connect" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

    dispatch_async(_io_queue, ^{
        if (!self.session) {

            self.session = [FMCIAPConnectionManager createSession];



            //
            // Setup the stream reading block;
            //
            FMCStreamDelegate *IOStreamDelegate = [FMCStreamDelegate new];
            FMCStreamHasBytesHandler streamReader = ^(NSInputStream *istream){

                uint8_t buf[IAP_INPUT_BUFFER_SIZE];

                while ([istream hasBytesAvailable])
                {
                    // Read bytes
                    NSInteger bytesRead = [istream read:buf maxLength:IAP_INPUT_BUFFER_SIZE];
                    NSData *dataIn = [NSData dataWithBytes:buf length:bytesRead];

                    // Log
                    NSString *logMessage = [NSString stringWithFormat:@"Incoming: (%ld)", (long)bytesRead];
                    [FMCDebugTool logInfo:logMessage
                            andBinaryData:dataIn
                                 withType:FMCDebugType_Transport_iAP
                                 toOutput:FMCDebugOutput_File];

                    // If we read some bytes, pass on to delegate
                    // If no bytes, quit reading.
                    if (bytesRead > 0) {
                        [self.delegate onDataReceived:dataIn];
                    } else {
                        break;
                    }
                }
                
            };
            IOStreamDelegate.streamHasBytesHandler = streamReader;


            BOOL bOpened = [self.session open:(FMCIAPSessionRead|FMCIAPSessionWrite)];
            if (bOpened) {
                [self.delegate onTransportConnected];
            }
        }
    });

}

- (void)disconnect {
    [FMCDebugTool logInfo:@"Disconnect" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

    dispatch_async(_io_queue, ^{
        [self stopEventListening];
        [self.session close];
        self.session = nil;
    });
}

- (void)sendData:(NSData *)data {

    dispatch_async(_io_queue, ^{
        NSOutputStream *ostream = self.session.easession.outputStream;
        NSMutableData *remainder = data.mutableCopy;

        while (1) {
            if (remainder.length == 0)
                break;

            if (ostream.hasSpaceAvailable) {

                //TODO: Added for debug, issue with module
                //[NSThread sleepForTimeInterval:0.020];

                NSInteger bytesWritten = [ostream write:remainder.bytes maxLength:remainder.length];
                if (bytesWritten == -1) {
                    NSLog(@"Error: %@", [ostream streamError]);
                    break;
                }

                NSString *logMessage = [NSString stringWithFormat:@"Outgoing: (%ld)", (long)bytesWritten];
                [FMCDebugTool logInfo:logMessage
                        andBinaryData:[remainder subdataWithRange:NSMakeRange(0, bytesWritten)]
                             withType:FMCDebugType_Transport_iAP
                             toOutput:FMCDebugOutput_File];

                [remainder replaceBytesInRange:NSMakeRange(0, bytesWritten) withBytes:NULL length:0];
            }
        }
    });
}

- (void)dealloc {
    _io_queue = nil;
}


#pragma mark - EAAccessory Notifications

- (void)accessoryConnected:(NSNotification*) notification {
    [FMCDebugTool logInfo:@"Accessory Connected" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

    [self connect];
}

- (void)accessoryDisconnected:(NSNotification*) notification {
    [FMCDebugTool logInfo:@"Accessory Disconnected" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

    EAAccessory* accessory = [notification.userInfo objectForKey:EAAccessoryKey];
    if (accessory.connectionID == self.session.accessory.connectionID) {
        [self disconnect];
        [self.delegate onTransportDisconnected];
    }
}

-(void)applicationWillEnterForeground:(NSNotification *)notification {
    [FMCDebugTool logInfo:@"Will Enter Foreground" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

    [self connect];
}

-(void)applicationDidEnterBackground:(NSNotification *)notification {
    [FMCDebugTool logInfo:@"Did Enter Background" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
}

@end
