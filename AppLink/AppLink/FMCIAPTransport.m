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
    [FMCDebugTool logInfo:@"Accessory Connected Event" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    
    double delay = [self retryDelay];
    NSString *logMessage = [NSString stringWithFormat:@"Connect Delay: %f", delay];
    [FMCDebugTool logInfo:logMessage];
    [self performSelector:@selector(connect) withObject:nil afterDelay:delay];
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
    
    [self connect];
}

-(void)applicationDidEnterBackground:(NSNotification *)notification {
    [FMCDebugTool logInfo:@"App Backgrounded Event" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
}

- (void)connect {
    // Make sure we don't have a session setup or already in progress
    if (!self.session && !self.sessionSetupInProgress) {
        self.sessionSetupInProgress = YES;
        // Reset the retry counter
        self.retryCounter = 0;
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
    [FMCDebugTool logInfo:@"Establish Session"];
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
    
    // Setup the control stream delegate
    FMCStreamDelegate *controlStreamDelegate = [FMCStreamDelegate new];
    // Setup the session on the control channel
    FMCIAPSession *controlSession = [[FMCIAPSession alloc] initWithAccessory:accessory
                                                                 forProtocol:CONTROL_PROTOCOL_STRING];
    if (self.protocolIndexTimer == nil) {
        self.protocolIndexTimer = [[FMCTimer alloc] initWithDuration:PROTOCOL_INDEX_TIMEOUT_SECONDS];
    }
    
    __weak typeof(self) weakSelf = self;
    __weak __block typeof(controlSession) weakSession = controlSession;
    
    // Setup the protocol index timed out event handler
    void (^elapsedBlock)(void) = ^{
        [FMCDebugTool logInfo:@"Protocol Index Timeout"];
        [weakSession close];
        weakSession.streamDelegate = nil;
        weakSession = nil;
        float randomNumber = ((float)arc4random() / UINT_MAX) + 0.2; // between 0.2 and 1.2
        [weakSelf performSelector:@selector(establishSession) withObject:nil afterDelay:randomNumber];
    };
    self.protocolIndexTimer.elapsedBlock = elapsedBlock;

    controlStreamDelegate.streamHasBytesHandler = ^(NSInputStream *istream) {
        // Grab a single byte from the stream
        uint8_t buf[1];
        NSUInteger len = [istream read:buf maxLength:1];
        if(len > 0)
        {
            [self.protocolIndexTimer cancel];
            NSString *logMessage = [NSString stringWithFormat:@"Switching to protocol %@", [[NSNumber numberWithChar:buf[0]] stringValue]];
            [FMCDebugTool logInfo:logMessage];
            // Done with control protocol session, destroy it.
            [weakSession close];
            weakSession.streamDelegate = nil;
            weakSession = nil;
            
            // Create session with indexed protocol
            NSString *indexedProtocolString = [NSString stringWithFormat:@"%@%@",
                                               INDEXED_PROTOCOL_STRING_PREFIX,
                                               [[NSNumber numberWithChar:buf[0]] stringValue]];
            
            [weakSelf createIAPDataSessionWithAccessory:accessory forProtocol:indexedProtocolString];
        }
    };
    
    controlStreamDelegate.streamEndHandler = ^(NSStream *stream) {
        [FMCDebugTool logInfo:@"Stream Event End"];
        [self.protocolIndexTimer cancel];
        [weakSession close];
        weakSession.streamDelegate = nil;
        weakSession = nil;
        float randomNumber = ((float)arc4random() / UINT_MAX) + 0.2; // between 0.2 and 1.2
        [weakSelf performSelector:@selector(establishSession) withObject:nil afterDelay:randomNumber];
    };
    
    controlStreamDelegate.streamErrorHandler = ^(NSStream *stream) {
        [FMCDebugTool logInfo:@"Stream Error"];
        [self.protocolIndexTimer cancel];
        [weakSession close];
        weakSession.streamDelegate = nil;
        weakSession = nil;
        float randomNumber = ((float)arc4random() / UINT_MAX) + 0.2; // between 0.2 and 1.2
        [weakSelf performSelector:@selector(establishSession) withObject:nil afterDelay:randomNumber];
    };
    
    SessionCompletionHandler completionHandler = ^void(BOOL success) {
        if (!success) {
            [FMCDebugTool logInfo:@"Couldn't open control session"];
            controlSession.streamDelegate = nil;
            weakSession = nil;
            float randomNumber = ((float)arc4random() / UINT_MAX) + 0.2; // between 0.2 and 1.2
            [weakSelf performSelector:@selector(establishSession) withObject:nil afterDelay:randomNumber];
        }
        else {
            [self.protocolIndexTimer start];
        }
    };
    
    if (controlSession) {
        controlSession.streamDelegate = controlStreamDelegate;
        controlSession.delegate = self;
        [controlSession openWithCompletionHandler:completionHandler];
    } else {
        controlSession = nil;
        float randomNumber = ((float)arc4random() / UINT_MAX) + 0.2; // between 0.2 and 1.2
        [weakSelf performSelector:@selector(establishSession) withObject:nil afterDelay:randomNumber];
    }
}

- (void)createIAPDataSessionWithAccessory:(EAAccessory *)accessory forProtocol:(NSString *)protocol {
    self.session = [[FMCIAPSession alloc] initWithAccessory:accessory forProtocol:protocol];
    
    __weak typeof(self) weakSelf = self;

    if (self.session) {
        FMCStreamDelegate *ioStreamDelegate = [FMCStreamDelegate new];
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
                    [self.delegate onDataReceived:dataIn];
                } else {
                    //[FMCDebugTool logInfo:@"No bytes read."];
                    break;
                }
            }
            
        };
        
        ioStreamDelegate.streamEndHandler = ^(NSStream *stream) {
            [FMCDebugTool logInfo:@"Stream Event End"];
            [self.session close];
            self.session.streamDelegate = nil;
            if (![LEGACY_PROTOCOL_STRING isEqualToString:self.session.protocol]) {
                float randomNumber = ((float)arc4random() / UINT_MAX) + 0.2; // between 0.2 and 1.2
                [weakSelf performSelector:@selector(establishSession) withObject:nil afterDelay:randomNumber];
            }
            self.session = nil;
        };
        
        ioStreamDelegate.streamErrorHandler = ^(NSStream *stream) {
            [FMCDebugTool logInfo:@"Stream Error"];
            [self.session close];
            self.session.streamDelegate = nil;
            if (![LEGACY_PROTOCOL_STRING isEqualToString:self.session.protocol]) {
                float randomNumber = ((float)arc4random() / UINT_MAX) + 0.2; // between 0.2 and 1.2
                [weakSelf performSelector:@selector(establishSession) withObject:nil afterDelay:randomNumber];
            }
            self.session = nil;
        };
        
        self.session.streamDelegate = ioStreamDelegate;
        self.session.delegate = self;
        
        SessionCompletionHandler completionHandler = ^void(BOOL success) {
            if (!success) {
                [FMCDebugTool logInfo:@"Couldn't open data session"];
                self.session.streamDelegate = nil;
                self.session = nil;
                float randomNumber = ((float)arc4random() / UINT_MAX) + 0.2; // between 0.2 and 1.2
                [weakSelf performSelector:@selector(establishSession) withObject:nil afterDelay:randomNumber];
            }
            else {
                [self.protocolIndexTimer start];
            }
        };

        [self.session openWithCompletionHandler:completionHandler];
    }
    else {
        float randomNumber = ((float)arc4random() / UINT_MAX) + 0.2; // between 0.2 and 1.2
        [weakSelf performSelector:@selector(establishSession) withObject:nil afterDelay:randomNumber];
    }
}

// This gets called after both I/O streams of the session have opened.
- (void)onSessionInitializationComplete:(BOOL)success forSession:(FMCIAPSession *)session {
    if (![CONTROL_PROTOCOL_STRING isEqualToString:session.protocol]) {
        self.sessionSetupInProgress = NO;
        if (success) {
            [FMCDebugTool logInfo:@"Session Opened"];
            [self.delegate onTransportConnected];
        } else {
            [FMCDebugTool logInfo:@"Error: Session not opened."];
        }
    }
}

// Retry establishSession on Stream End events only if it was the control session and we haven't already connected on non-control protocol
- (void)onSessionStreamsEnded:(FMCIAPSession *)session {
    if (!self.session && [CONTROL_PROTOCOL_STRING isEqualToString:session.protocol]) {
        [FMCDebugTool logInfo:@"onSessionStreamsEnded"];
        [session close];
        [session dispose];
        session = nil;
        [FMCDebugTool logInfo:@"Retrying establishConnection"];
        float randomNumber = ((float)arc4random() / UINT_MAX) + 0.2; // between 0.2 and 1.2
        [self performSelector:@selector(establishSession) withObject:nil afterDelay:randomNumber];
    }
}

- (void)disconnect {
    dispatch_sync(_transport_queue, ^{
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
    CC_MD5(ptr, (unsigned int)strlen(ptr), md5Buffer);
    NSMutableString *output = [NSMutableString stringWithString:@"0x"];
    for(int i = 0; i < 8; i++)
        [output appendFormat:@"%02X",md5Buffer[i]];
    unsigned long long firstHalf;
    NSScanner* pScanner = [NSScanner scannerWithString: output];
    [pScanner scanHexLongLong:&firstHalf];
    return 2.0 * (firstHalf * 1.0) / 0xffffffffffffffff;
}

@end
