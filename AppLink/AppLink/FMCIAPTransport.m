//  FMCIAPTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "FMCIAPSession.h"
#import "FMCDebugTool.h"
#import "FMCSiphonServer.h"
#import "FMCIAPConfig.h"
#import "FMCIAPTransport.h"
#import "FMCStreamDelegate.h"
#import "EAAccessoryManager+SyncProtocols.h"
#import "FMCTimer.h"
#import <CommonCrypto/CommonDigest.h>

@interface FMCIAPTransport () {
    dispatch_queue_t _transport_queue;
    BOOL _alreadyDestructed;
}

@property (assign) int retryCounter;
@property (assign) BOOL sessionSetupInProgress;
@property (strong) FMCTimer *protocolIndexTimer;

- (void)startEventListening;
- (void)stopEventListening;

@end



@implementation FMCIAPTransport

- (instancetype)init {
    if (self = [super init]) {

        _alreadyDestructed = NO;
        _transport_queue = dispatch_queue_create("com.ford.applink.transport", DISPATCH_QUEUE_SERIAL);

        _session = nil;
        _controlSession = nil;
        _retryCounter = 0;
        _sessionSetupInProgress = NO;
        _protocolIndexTimer = nil;
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

#pragma mark - EAAccessory Notifications

- (void)accessoryConnected:(NSNotification*) notification {
    NSMutableString *logMessage = [NSMutableString stringWithFormat:@"Accessory Connected Connecting in %0.03fs", self.retryDelay];
    [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    
    self.retryCounter = 0;
    [self performSelector:@selector(connect) withObject:nil afterDelay:self.retryDelay];
}

- (void)accessoryDisconnected:(NSNotification*) notification {
    [FMCDebugTool logInfo:@"Accessory Disconnected Event" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    
    EAAccessory* accessory = [notification.userInfo objectForKey:EAAccessoryKey];
    if (accessory.connectionID == self.session.accessory.connectionID) {
        self.sessionSetupInProgress = NO;
        [self disconnect];
        [self.delegate onTransportDisconnected];
    }
}

-(void)applicationWillEnterForeground:(NSNotification *)notification {
    [FMCDebugTool logInfo:@"App Foregrounded Event" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    self.retryCounter = 0;
    [self connect];
}

-(void)applicationDidEnterBackground:(NSNotification *)notification {
    [FMCDebugTool logInfo:@"App Backgrounded Event" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
}

- (void)connect {
    // Make sure we don't have a session setup or already in progress
    if (!self.session && !self.sessionSetupInProgress) {
        self.sessionSetupInProgress = YES;

        // Start the session setup in the background
        dispatch_async(_transport_queue, ^{
            [self establishSession];
        });
    }
    // DEBUG only
    else if (self.session) {
        [FMCDebugTool logInfo:@"Session already established."];
    }
    else {
        [FMCDebugTool logInfo:@"Session setup already in progress."];
    }
}

- (void)establishSession {
    [FMCDebugTool logInfo:@"Attempting To Connect"];
    if (self.retryCounter < CREATE_SESSION_RETRIES) {
        self.retryCounter++;
        EAAccessory *accessory = nil;
        // Multiapp session
        if ((accessory = [EAAccessoryManager findAccessoryForProtocol:CONTROL_PROTOCOL_STRING])) {
            [self createIAPControlSessionWithAccessory:accessory];
        }
        // Legacy session
        else if ((accessory = [EAAccessoryManager findAccessoryForProtocol:LEGACY_PROTOCOL_STRING])) {
            [self createIAPDataSessionWithAccessory:accessory forProtocol:LEGACY_PROTOCOL_STRING];
        }
        // No compatible accessory
        else {
            [FMCDebugTool logInfo:@"No accessory supporting a required sync protocol was found."];
            self.sessionSetupInProgress = NO;
        }
    }
    else if (self.retryCounter == CREATE_SESSION_RETRIES) {
        self.retryCounter++;
        [FMCDebugTool logInfo:@"Create session retries exhausted."];
        self.sessionSetupInProgress = NO;
    }
    else {
        [FMCDebugTool logInfo:@"Session attempts exhausted - Debug remove me"];
    }
}

- (void)createIAPControlSessionWithAccessory:(EAAccessory *)accessory {

    [FMCDebugTool logInfo:@"Starting MultiApp Session"];
    self.controlSession = [[FMCIAPSession alloc] initWithAccessory:accessory forProtocol:CONTROL_PROTOCOL_STRING];
    if (self.controlSession) {
        self.controlSession.delegate = self;

        // Create Protocol Index Timer
        if (self.protocolIndexTimer == nil) {
            self.protocolIndexTimer = [[FMCTimer alloc] initWithDuration:PROTOCOL_INDEX_TIMEOUT_SECONDS];
        }
        
        __weak typeof(self) weakSelf = self;

        // Protocol index timeout handler
        void (^elapsedBlock)(void) = ^{
            [FMCDebugTool logInfo:@"Protocol Index Timeout"];
            [weakSelf.controlSession stop];
            weakSelf.controlSession.streamDelegate = nil;
            weakSelf.controlSession = nil;
            [weakSelf retryEstablishSession];
        };
        self.protocolIndexTimer.elapsedBlock = elapsedBlock;

        // Configure Streams Delegate
        FMCStreamDelegate *controlStreamDelegate = [FMCStreamDelegate new];
        self.controlSession.streamDelegate = controlStreamDelegate;

        // Control Session Has Bytes Handler
        controlStreamDelegate.streamHasBytesHandler = ^(NSInputStream *istream) {
            [FMCDebugTool logInfo:@"Control Stream Received Data"];

            // Grab a single byte from the stream
            uint8_t buf[1];
            NSUInteger len = [istream read:buf maxLength:1];
            if(len > 0)
            {
                NSString *logMessage = [NSString stringWithFormat:@"Switching to protocol %@", [[NSNumber numberWithChar:buf[0]] stringValue]];
                [FMCDebugTool logInfo:logMessage];
                // Done with control protocol session, destroy it.
                [weakSelf.protocolIndexTimer cancel];
                [weakSelf.controlSession stop];
                weakSelf.controlSession.streamDelegate = nil;
                weakSelf.controlSession = nil;
                
                // Create session with indexed protocol
                NSString *indexedProtocolString = [NSString stringWithFormat:@"%@%@",
                                                   INDEXED_PROTOCOL_STRING_PREFIX,
                                                   [[NSNumber numberWithChar:buf[0]] stringValue]];
                
                [weakSelf createIAPDataSessionWithAccessory:accessory forProtocol:indexedProtocolString];
            }
        };
        
        // Control Session Stream End Handler
        controlStreamDelegate.streamEndHandler = ^(NSStream *stream) {
            [FMCDebugTool logInfo:@"Control Stream Event End"];
            if (weakSelf.controlSession != nil) { // End events come in pairs, only perform this once per set.
                [weakSelf.protocolIndexTimer cancel];
                [weakSelf.controlSession stop];
                weakSelf.controlSession.streamDelegate = nil;
                weakSelf.controlSession = nil;
                [weakSelf retryEstablishSession];
            }
        };
        
        // Control Session Stream Error Handler
        controlStreamDelegate.streamErrorHandler = ^(NSStream *stream) {
            [FMCDebugTool logInfo:@"Stream Error"];
            [weakSelf.protocolIndexTimer cancel];
            [weakSelf.controlSession stop];
            weakSelf.controlSession.streamDelegate = nil;
            weakSelf.controlSession = nil;
            [weakSelf retryEstablishSession];
        };



        if (![self.controlSession start]) {
            [FMCDebugTool logInfo:@"Control Session Failed"];
            self.controlSession.streamDelegate = nil;
            self.controlSession = nil;
            [self retryEstablishSession];
        }

    } else {
        [FMCDebugTool logInfo:@"Failed MultiApp Control FMCIAPSession Initialization"];
        [self retryEstablishSession];
    }
}

- (void)retryEstablishSession {
    self.sessionSetupInProgress = NO;

    [FMCDebugTool logInfo:@"Retry"];
    [FMCDebugTool logInfo:@"No retries allowed"];
    return;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([self retryDelay] * NSEC_PER_SEC)), _transport_queue, ^{
        [self establishSession];
    });
}

- (void)createIAPDataSessionWithAccessory:(EAAccessory *)accessory forProtocol:(NSString *)protocol {

    [FMCDebugTool logInfo:@"Starting Data Session"];
    self.session = [[FMCIAPSession alloc] initWithAccessory:accessory forProtocol:protocol];
    if (self.session) {
        self.session.delegate = self;

        __weak typeof(self) weakSelf = self;

        // Configure Streams Delegate
        FMCStreamDelegate *ioStreamDelegate = [FMCStreamDelegate new];
        self.session.streamDelegate = ioStreamDelegate;

        // Data Session Has Bytes Handler
        ioStreamDelegate.streamHasBytesHandler = ^(NSInputStream *istream){
            uint8_t buf[IAP_INPUT_BUFFER_SIZE];
            
            while ([istream hasBytesAvailable])
            {
                // Read bytes
                NSInteger bytesRead = [istream read:buf maxLength:IAP_INPUT_BUFFER_SIZE];
                NSData *dataIn = [NSData dataWithBytes:buf length:bytesRead];
                
                // If we read some bytes, pass on to delegate
                // If no bytes, quit reading.
                if (bytesRead > 0) {
                    [weakSelf.delegate onDataReceived:dataIn];
                } else {
                    //[FMCDebugTool logInfo:@"No bytes read."];
                    break;
                }
            }
            
        };
        
        // Data Session Stream End Handler
        ioStreamDelegate.streamEndHandler = ^(NSStream *stream) {
            [FMCDebugTool logInfo:@"Data Stream Event End"];
            [weakSelf.session stop];
            weakSelf.session.streamDelegate = nil;
            if (![LEGACY_PROTOCOL_STRING isEqualToString:weakSelf.session.protocol]) {
                [weakSelf retryEstablishSession];
            }
            weakSelf.session = nil;
        };
        
        // Data Session Stream Error Handler
        ioStreamDelegate.streamErrorHandler = ^(NSStream *stream) {
            [FMCDebugTool logInfo:@"Data Stream Error"];
            [weakSelf.session stop];
            weakSelf.session.streamDelegate = nil;
            if (![LEGACY_PROTOCOL_STRING isEqualToString:weakSelf.session.protocol]) {
                [weakSelf retryEstablishSession];
            }
            weakSelf.session = nil;
        };
        

        if (![self.session start]) {
            [FMCDebugTool logInfo:@"Data Session Failed"];
            self.session.streamDelegate = nil;
            self.session = nil;
            [self retryEstablishSession];
        }

    }
    else {
        [FMCDebugTool logInfo:@"Failed MultiApp Data FMCIAPSession Initialization"];
        [self retryEstablishSession];
    }

}

// This gets called after both I/O streams of the session have opened.
- (void)onSessionInitializationCompleteForSession:(FMCIAPSession *)session {

    // Control Session Opened
    if ([CONTROL_PROTOCOL_STRING isEqualToString:session.protocol]) {
        [FMCDebugTool logInfo:@"Control Session Established"];
        [self.protocolIndexTimer start];
    }

    // Data Session Opened
    if (![CONTROL_PROTOCOL_STRING isEqualToString:session.protocol]) {
        self.sessionSetupInProgress = NO;
        dispatch_async(dispatch_get_main_queue(), ^{
            [FMCDebugTool logInfo:@"Data Session Established"];
            [self.delegate onTransportConnected];
        });
    }
}

// Retry establishSession on Stream End events only if it was the control session and we haven't already connected on non-control protocol
- (void)onSessionStreamsEnded:(FMCIAPSession *)session {
    if (!self.session && [CONTROL_PROTOCOL_STRING isEqualToString:session.protocol]) {
        [FMCDebugTool logInfo:@"onSessionStreamsEnded"];
        [session stop];
        [self retryEstablishSession];
    }
}

- (void)disconnect {
    dispatch_sync(_transport_queue, ^{
        [FMCDebugTool logInfo:@"IAP Disconnecting" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
        if (self.session != nil) {
            [self.session stop];
            self.session = nil;
        }
    });
}

- (void)sendData:(NSData *)data {

    NSOutputStream *ostream = self.session.easession.outputStream;
    NSMutableData *remainder = data.mutableCopy;

    dispatch_async(_transport_queue, ^{
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
    if(!_alreadyDestructed) {
        _alreadyDestructed = YES;
        [self stopEventListening];
        _transport_queue = nil;
        self.controlSession = nil;
        self.session = nil;
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

- (double)retryDelay {

    const double min_value = 0.0;
    const double max_value = 10.0;
    double range_length = max_value - min_value;

    static double delay = 0;

    if (delay == 0) {
        NSString *appName = [[NSProcessInfo processInfo] processName];
        if (appName == nil) {
            appName = @"noname";
        }
        const char *ptr = [appName UTF8String];
        unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
        CC_MD5(ptr, (unsigned int)strlen(ptr), md5Buffer);
        NSMutableString *output = [NSMutableString stringWithString:@"0x"];
        for(int i = 0; i < 8; i++)
            [output appendFormat:@"%02X",md5Buffer[i]];
        unsigned long long firstHalf;
        NSScanner* pScanner = [NSScanner scannerWithString: output];
        [pScanner scanHexLongLong:&firstHalf];
        double hashBasedValueInRange0to1 = ((double)firstHalf)/0xffffffffffffffff;
        delay = range_length * hashBasedValueInRange0to1 + min_value;

        NSMutableString *logMessage = [NSMutableString stringWithFormat:@"Preconnect Delay = %0.03fs", delay];
        [FMCDebugTool logInfo:logMessage];

    }

    return delay;
}

@end
