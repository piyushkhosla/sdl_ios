//  FMCIAPTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <UIKit/UIKit.h>
#import "FMCIAPTransport.h"
#import "FMCDebugTool.h"
#import "FMCSiphonServer.h"

#define LEGACY_PROTOCOL_STRING @"com.ford.sync.prot0"
#define CONTROL_PROTOCOL_STRING @"com.smartdevicelink.prot0"

#define IAP_INPUT_BUFFER_SIZE 1024

//#define DEBUG_USE_LEGACY


@interface FMCIAPTransport ()
{
    dispatch_queue_t writeQueue;
}

@property (strong) EASession *session;
@property (strong) EAAccessory *accessory;
@property (strong) NSMutableData *writeData;
@property (assign) BOOL onControlProtocol;
@property (assign) BOOL useLegacyProtocol;
@property (strong) NSString *protocolString;
@property (assign) BOOL isOutputStreamReady;
@property (assign) BOOL isInputStreamReady;
@property (assign) BOOL transportReady;


@property (strong) NSTimer* backgroundedTimer;


@end



@implementation FMCIAPTransport

- (id)init {
    if (self = [super initWithEndpoint:nil endpointParam:nil]) {

        [FMCDebugTool logInfo:@"Init" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

        writeQueue = dispatch_queue_create("com.Ford.AppLink.IAPWWriteQueue", DISPATCH_QUEUE_SERIAL);
        dispatch_set_target_queue(writeQueue, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0));

        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessoryConnected:) name:EAAccessoryDidConnectNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessoryDisconnected:) name:EAAccessoryDidDisconnectNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        
        [FMCSiphonServer init];
    }
    return self;
}


#pragma mark -
#pragma mark FMCTransport Implementation

- (void)connect {
    [FMCDebugTool logInfo:@"Connect" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    
    if (!self.session){
        [self checkForValidConnectedAccessory];
        
        if (self.accessory && self.protocolString) {
            [self openSession];
        } else {
            [FMCDebugTool logInfo:@"No Devices Found" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
        }
    } else {
        [FMCDebugTool logInfo:@"Session Already Open" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    }
}

- (void)disconnect {
    [FMCDebugTool logInfo:@"Disconnect" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    
    if (self.session) {
        [self closeSession];
        
        if (!self.onControlProtocol) {
            [FMCDebugTool logInfo:@"Transport Not Ready" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
            self.transportReady = NO;
            [self notifyTransportDisconnected];
        }
    }
}

- (void)sendData:(NSData*) data {
    [self writeDataOut:data];
}



#pragma mark -
#pragma mark EAAccessory Notifications

- (void)accessoryConnected:(NSNotification*) notification {
    [FMCDebugTool logInfo:@"Accessory Connected" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    [self connect];
}

- (void)accessoryDisconnected:(NSNotification*) notification {
    [FMCDebugTool logInfo:@"Accessory Disconnected" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    [self disconnect];
}

-(void)applicationWillEnterForeground:(NSNotification *)notification {
    [FMCDebugTool logInfo:@"Will Enter Foreground" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    [self.backgroundedTimer invalidate];
    
    [self setupControllerForAccessory:nil withProtocolString:nil];
    [self connect];
}

-(void)applicationDidEnterBackground:(NSNotification *)notification {
    [FMCDebugTool logInfo:@"Did Enter Background" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    self.backgroundedTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(backgroundButAwake:) userInfo: nil repeats: YES];
}


#pragma mark -
#pragma mark Response Timers


- (void)protocolIndexRestart{
    
    //TODO:DEBUG
    [FMCDebugTool logInfo:@"PI Timer" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    
    if (!self.transportReady) {
        [FMCDebugTool logInfo:@"PI Restart" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
        [self closeSession];
        [self connect];
    }
        
}



#pragma mark -
#pragma mark NSStreamDelegateEventExtensions

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)event
{

    switch (event) {
        case NSStreamEventNone:
            break;
        case NSStreamEventOpenCompleted:
        {
            if (stream == [_session outputStream]) {
                self.isOutputStreamReady = YES;
            } else if (stream == [_session inputStream]) {
                self.isInputStreamReady = YES;
            }
            
            if (self.isOutputStreamReady && self.isInputStreamReady) {
                [FMCDebugTool logInfo:@"Streams Event Open" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
                
                if (self.onControlProtocol) {
                    [FMCDebugTool logInfo:@"Waiting For Protocol Index" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
                    
                    //Begin Connection Retry
//                    float randomNumber = (float)arc4random() / UINT_MAX; // between 0 and 1
//                    float randomMinMax = 0.0f + (0.5f-0.0f)*randomNumber; // between Min (0.0) and Max (0.5)
                    
//                    [FMCDebugTool logInfo:[NSString stringWithFormat:@"Wait: %f", 1.5f] withType:FMCDebugType_Transport_iAP];
                    [self performSelector:@selector(protocolIndexRestart) withObject:nil afterDelay:2.5f];

                } else {
                    [FMCDebugTool logInfo:@"Transport Ready" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
                    self.transportReady = YES;
                    [self notifyTransportConnected];
                }
                
            }
            break;
        }
        case NSStreamEventHasBytesAvailable:
            [self readDataIn];
            break;
        case NSStreamEventHasSpaceAvailable:
            break;
        case NSStreamEventErrorOccurred:
        {
            NSString *logMessage = [NSString stringWithFormat:@"Stream Error:%@", [[stream streamError] localizedDescription]];
            [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
            break;
        }
        case NSStreamEventEndEncountered:
        {
            if (stream == [_session outputStream]) {
                self.isOutputStreamReady = NO;
            } else if (stream == [_session inputStream]) {
                self.isInputStreamReady = NO;
            }
            
            if (!self.isOutputStreamReady && !self.isInputStreamReady) {
                [FMCDebugTool logInfo:@"Streams Event End" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
                [self disconnect];
                [self connect];
            }
            break;
        }
        default:
            break;
    }
}



#pragma mark -
#pragma mark Class Methods

- (void)setupControllerForAccessory:(EAAccessory *)accessory withProtocolString:(NSString *)protocolString
{
    self.accessory = accessory;
    self.protocolString = protocolString;
}

- (void)checkForValidConnectedAccessory {
    for (EAAccessory* accessory in [[EAAccessoryManager sharedAccessoryManager] connectedAccessories]) {
        
        [FMCDebugTool logInfo:[NSString stringWithFormat:@"Check Accessory: %@", accessory] withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

        self.useLegacyProtocol = NO;
        
#ifdef DEBUG_USE_LEGACY
        self.useLegacyProtocol = YES;
#else
		for (NSString *protocolString in [accessory protocolStrings]) {
            if ([protocolString isEqualToString:LEGACY_PROTOCOL_STRING]) {
                self.useLegacyProtocol = YES;
            }
            
            if ([protocolString isEqualToString:CONTROL_PROTOCOL_STRING]) {
                [FMCDebugTool logInfo:[NSString stringWithFormat:@"MultiApp Sync @ %@", CONTROL_PROTOCOL_STRING] withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
                
                self.useLegacyProtocol = NO;
                
                [self setupControllerForAccessory:accessory withProtocolString:CONTROL_PROTOCOL_STRING];
                return;
            }
        }
#endif
        
        if (self.useLegacyProtocol) {
            [FMCDebugTool logInfo:[NSString stringWithFormat:@"Legacy Sync @ %@", LEGACY_PROTOCOL_STRING] withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
            
            [self setupControllerForAccessory:accessory withProtocolString:LEGACY_PROTOCOL_STRING];
            return;
        }
	}
}

- (void)dealloc {
    [FMCDebugTool logInfo:@"Dealloc" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    
    [self closeSession];
    [self setupControllerForAccessory:nil withProtocolString:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EAAccessoryDidConnectNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EAAccessoryDidDisconnectNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
}



#pragma mark Session Control

- (void)openSession {
    if (self.accessory && self.protocolString) {
        
        self.session = [[EASession alloc] initWithAccessory:self.accessory forProtocol:self.protocolString];
        
        if (self.session) {
            [FMCDebugTool logInfo:@"Opening Streams" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
            
            [[self.session inputStream] setDelegate:self];
            [[self.session inputStream] scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            [[self.session inputStream] open];
            
            [[self.session outputStream] setDelegate:self];
            [[self.session outputStream] scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            [[self.session outputStream] open];
            
            if ([self.protocolString isEqualToString:CONTROL_PROTOCOL_STRING]) {
                self.onControlProtocol = YES;
            }
        } else {
            if ([self.protocolString isEqualToString:CONTROL_PROTOCOL_STRING]) {
                [FMCDebugTool logInfo:@"Session Not Opened (Control Protocol)" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
                
                //Begin Connection Retry
                float randomNumber = (float)arc4random() / UINT_MAX; // between 0 and 1
                float randomMinMax = 0.0f + (0.5f-0.0f)*randomNumber; // between Min (0.0) and Max (0.5)
                
                [FMCDebugTool logInfo:[NSString stringWithFormat:@"Wait: %f", randomMinMax] withType:FMCDebugType_Transport_iAP];
                [self performSelector:@selector(openSession) withObject:nil afterDelay:randomNumber];
            } else {
                [FMCDebugTool logInfo:@"Session Not Opened" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
            }
        }
    } else {
        [FMCDebugTool logInfo:@"Accessory Or Protocol String Not Set" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
    }
}

- (void)closeSession {
    if (self.session) {
        [FMCDebugTool logInfo:@"Closing Streams" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
        
        [[self.session inputStream] close];
        [[self.session inputStream] removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [[self.session inputStream] setDelegate:nil];
        
        [[self.session outputStream] close];
        [[self.session outputStream] removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [[self.session outputStream] setDelegate:nil];
        
        self.session = nil;
        self.writeData = nil;
        
        self.isOutputStreamReady = NO;
        self.isInputStreamReady = NO;
    }
}



#pragma mark Low Level Read/Write

// Write data to the accessory while there is space available and data to write
- (void)writeDataOut:(NSData *)dataOut {
    dispatch_async(writeQueue, ^{

        NSMutableData *remainder = dataOut.mutableCopy;

        while (1) {
            if (remainder.length == 0) break;

            if ( [[self.session outputStream] hasSpaceAvailable] ) {
                
                //TODO: Added for debug, issue with module
                //[NSThread sleepForTimeInterval:0.020];
                
                NSInteger bytesWritten = [[self.session outputStream] write:remainder.bytes maxLength:remainder.length];
                if (bytesWritten == -1) {
                    NSLog(@"Error: %@", [[self.session outputStream] streamError]);
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

// Read data while there is data and space available in the input buffer
- (void)readDataIn {
    uint8_t buf[IAP_INPUT_BUFFER_SIZE];
    while ([[self.session inputStream] hasBytesAvailable])
    {
        NSInteger bytesRead = [[self.session inputStream] read:buf maxLength:IAP_INPUT_BUFFER_SIZE];

        NSData *dataIn = [NSData dataWithBytes:buf length:bytesRead];

        NSString *logMessage = [NSString stringWithFormat:@"Incoming: (%ld)", (long)bytesRead];
        [FMCDebugTool logInfo:logMessage
                andBinaryData:dataIn
                     withType:FMCDebugType_Transport_iAP
                     toOutput:FMCDebugOutput_File];

        if (bytesRead > 0) {
            // TODO: change this to ndsata parameter for consistency
            [self handleBytesReceivedFromTransport:buf length:bytesRead];
        } else {
            break;
        }
    }
}



#pragma mark -
#pragma mark Overridden Methods

- (void)handleBytesReceivedFromTransport:(Byte *)receivedBytes length:(NSInteger)receivedBytesLength {
    
    if (self.onControlProtocol){

        NSNumber *dataProtocol = [NSNumber numberWithUnsignedInt:receivedBytes[0]];
        
        [FMCDebugTool logInfo:[NSString stringWithFormat:@"Moving To Protocol Index: %@", dataProtocol] withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
        
        if ([dataProtocol isEqualToNumber:[NSNumber numberWithInt:255]]) {
            [FMCDebugTool logInfo:@"All Available Protocol Strings Are In Use" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
            
            //FIXME: Restart but dont call back up to app or connect will keep getting called when busy...
            return;
        }
        else {
            NSString *currentProtocolString = [NSString stringWithFormat:@"com.smartdevicelink.prot%@", dataProtocol];
            
            [self closeSession];
            self.onControlProtocol = NO;

            [self setupControllerForAccessory:self.accessory withProtocolString:currentProtocolString];
            [self openSession];
        }
    }
    else {
        [super handleDataReceivedFromTransport:[NSData dataWithBytes:receivedBytes length:receivedBytesLength]];
    }
}



#pragma mark -
#pragma mark Debug Helpers

-(void) backgroundButAwake:(NSTimer*) t
{
    [FMCDebugTool logInfo:@"Still Awake..." withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];
}

@end
