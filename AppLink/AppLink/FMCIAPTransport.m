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
#import <CommonCrypto/CommonDigest.h>

@interface FMCIAPTransport () {
    dispatch_queue_t _io_queue;
    BOOL alreadyDestructed;
}

- (void)startEventListening;
- (void)stopEventListening;

@end



@implementation FMCIAPTransport

- (instancetype)init {
    if (self = [super init]) {

        alreadyDestructed = NO;
        _io_queue = dispatch_queue_create("com.ford.applink.transport", DISPATCH_QUEUE_SERIAL);

        [self startEventListening];
        [FMCSiphonServer init];
    }

    [FMCDebugTool logInfo:@"FMCIAPTransport Init"];

    return self;
}

- (void)startEventListening {
    [FMCDebugTool logInfo:@"FMCIAPTransport Listening For Events"];
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
    [FMCDebugTool logInfo:@"FMCIAPTransport Stopped Listening For Events"];
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


- (void)connect {
    dispatch_async(_io_queue, ^{
        [FMCDebugTool logInfo:@"IAP Connecting" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
        
        if (!self.session) {

            for (int i=0; i<CREATE_SESSION_RETRIES; i++) {
                NSError* error = nil;
                self.session = [FMCIAPConnectionManager createSession:&error];
                if (self.session)
                    break;
                else if (error != nil && [@"accessory" isEqualToString:error.domain]) {
                    [FMCDebugTool logInfo:@"No accessory supporting a required sync protocol was found."];
                    break;
                }
                else {
                    float randomNumber = ((float)arc4random() / UINT_MAX) + 0.2; // between 0.2 and 1.2
                    [NSThread sleepForTimeInterval:randomNumber];

                    if (i == CREATE_SESSION_RETRIES-1) {
                        [FMCDebugTool logInfo:@"Create session retries exhausted for this connect request."];
                    }
                }
            }
            if (self.session) {

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

                        // Log received data to file.
                        /*NSString *logMessage = [NSString stringWithFormat:@"Incoming: (%ld)", (long)bytesRead];
                        [FMCDebugTool logInfo:logMessage
                                andBinaryData:dataIn
                                     withType:FMCDebugType_Transport_iAP
                                     toOutput:FMCDebugOutput_File];*/

                        // If we read some bytes, pass on to delegate
                        // If no bytes, quit reading.
                        if (bytesRead > 0) {
                            [self.delegate onDataReceived:dataIn];
                        } else {
                            //[FMCDebugTool logInfo:@"No bytes read."];
                            break;
                        }
                    }

                };
                IOStreamDelegate.streamHasBytesHandler = streamReader;
                self.session.streamDelegate = IOStreamDelegate;

                self.session.delegate = self;
                [self.session open];
            }
        } else {
            [FMCDebugTool logInfo:@"Already Connected. Discarding this request."];
        }
    });

}

// This gets called after both I/O streams of the session have opened.
- (void)onSessionInitializationComplete:(BOOL)success {
    if (success) {
        [FMCDebugTool logInfo:@"Session Opened"];
        [self.delegate onTransportConnected];
    } else {
        [FMCDebugTool logInfo:@"Error: Session not opened."];
    }
}


- (void)disconnect {
    dispatch_sync(_io_queue, ^{
        [FMCDebugTool logInfo:@"IAP Disconnecting" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
        if (self.session != nil) {
            [self.session close];
            [self.session dispose];
            self.session = nil;
        }
    });
}

- (void)sendData:(NSData *)data {

    NSOutputStream *ostream = self.session.easession.outputStream;
    NSMutableData *remainder = data.mutableCopy;

    dispatch_async(_io_queue, ^{

        while (1) {
            if (remainder.length == 0)
                break;

            if (ostream.streamStatus == NSStreamStatusOpen && ostream.hasSpaceAvailable) {

                NSInteger bytesWritten = [ostream write:remainder.bytes maxLength:remainder.length];
                if (bytesWritten == -1) {
                    NSLog(@"Error: %@", [ostream streamError]);
                    break;
                }

                /*NSString *logMessage = [NSString stringWithFormat:@"Outgoing: (%ld)", (long)bytesWritten];
                [FMCDebugTool logInfo:logMessage
                        andBinaryData:[remainder subdataWithRange:NSMakeRange(0, bytesWritten)]
                             withType:FMCDebugType_Transport_iAP
                             toOutput:FMCDebugOutput_File];*/

                [remainder replaceBytesInRange:NSMakeRange(0, bytesWritten) withBytes:NULL length:0];
            }
        }
    });
}

- (void)destructObjects {
    if(!alreadyDestructed) {
        alreadyDestructed = YES;
        [self stopEventListening];
        _io_queue = nil;
        self.delegate = nil;
    }
}

- (void)dispose {
    [self destructObjects];
}

- (void)dealloc {
    [self destructObjects];
    [FMCDebugTool logInfo:@"FMCIAPTransport Dealloc" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
}

- (double)getDelay {
    NSString *appName = [[NSProcessInfo processInfo] processName];
    if (appName == nil) {
        appName = @"noname";
    }
    const char *ptr = [appName UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(ptr, strlen(ptr), md5Buffer);
    NSMutableString *output = [NSMutableString stringWithString:@"0x"];
    for(int i = 0; i < 8; i++)
        [output appendFormat:@"%02X",md5Buffer[i]];
    unsigned long long firstHalf;
    NSScanner* pScanner = [NSScanner scannerWithString: output];
    [pScanner scanHexLongLong:&firstHalf];
    return 2.0 * (firstHalf * 1.0) / 0xffffffffffffffff;
}

#pragma mark - EAAccessory Notifications

- (void)accessoryConnected:(NSNotification*) notification {
    [FMCDebugTool logInfo:@"Accessory Connected Event" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    
    double delay = [self getDelay];
    NSString *logMessage = [NSString stringWithFormat:@"Connect Delay: %f", delay];
    [FMCDebugTool logInfo:logMessage];
    [self performSelector:@selector(connect) withObject:nil afterDelay:delay];
}

- (void)accessoryDisconnected:(NSNotification*) notification {
    [FMCDebugTool logInfo:@"Accessory Disconnected Event" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

    EAAccessory* accessory = [notification.userInfo objectForKey:EAAccessoryKey];
    if (accessory.connectionID == self.session.accessory.connectionID) {
        [self disconnect];
        [self.delegate onTransportDisconnected];
    }
}

-(void)applicationWillEnterForeground:(NSNotification *)notification {
    [FMCDebugTool logInfo:@"App Foregrounded Event" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

    [self connect];
}

-(void)applicationDidEnterBackground:(NSNotification *)notification {
    [FMCDebugTool logInfo:@"App Backgrounded Event" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
}

@end
