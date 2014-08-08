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

@property (strong) NSTimer* backgroundedTimer;


@end



@implementation FMCIAPTransport

- (id)init {
    if (self = [super initWithEndpoint:nil endpointParam:nil]) {

        writeQueue = dispatch_queue_create("com.Ford.AppLink.IAPWWriteQueue", DISPATCH_QUEUE_SERIAL);
        
        [FMCDebugTool logInfo:@"Init" withType:FMCDebugType_Transport_iAP];
        
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
    [FMCDebugTool logInfo:@"Looking To Connect" withType:FMCDebugType_Transport_iAP];
    
    [self checkForValidConnectedAccessory];
    
    if (self.accessory && self.protocolString) {
        [self openSession];
    }

}

- (void)disconnect {
    [FMCDebugTool logInfo:@"Disconnect" withType:FMCDebugType_Transport_iAP];
    
    if (self.session) {
        [self closeSession];
        
        if (!self.onControlProtocol) {
            [self notifyTransportDisconnected];
        }
    }
}

- (void)sendData:(NSData*) data {

    dispatch_async(writeQueue, ^{
        if (!self.writeData) {
            self.writeData = [[NSMutableData alloc] init];
        }
        [self.writeData appendData:data];
    });

    [self writeDataOut];

}



#pragma mark -
#pragma mark EAAccessory Notifications

- (void)accessoryConnected:(NSNotification*) notification {
    [FMCDebugTool logInfo:@"Accessory Connected" withType:FMCDebugType_Transport_iAP];
    [self connect];
}

- (void)accessoryDisconnected:(NSNotification*) notification {
    [FMCDebugTool logInfo:@"Accessory Disconnected" withType:FMCDebugType_Transport_iAP];
    [self disconnect];
}

-(void)applicationWillEnterForeground:(NSNotification *)notification {
    [FMCDebugTool logInfo:@"Will Enter Foreground" withType:FMCDebugType_Transport_iAP];
    
    [self.backgroundedTimer invalidate];
//    [self connect];
}

-(void)applicationDidEnterBackground:(NSNotification *)notification {
    [FMCDebugTool logInfo:@"Did Enter Background" withType:FMCDebugType_Transport_iAP];
    self.backgroundedTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(backgroundButAwake:) userInfo: nil repeats: YES];
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
//            NSString *logMessage = [NSString stringWithFormat:@"Stream is Open:%@", stream.description];
//            [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Transport_iAP];

            BOOL isOnControlProtocol = self.onControlProtocol;
            
            if (stream == [_session outputStream]) {
                self.isOutputStreamReady = YES;
            } else if (stream == [_session inputStream]) {
                self.isInputStreamReady = YES;
            }
            
            if (isOnControlProtocol && self.isOutputStreamReady && self.isInputStreamReady) {
                [FMCDebugTool logInfo:@"Waiting To Recieve Protocol Index" withType:FMCDebugType_Transport_iAP];
            } else if (!isOnControlProtocol && self.isOutputStreamReady && self.isInputStreamReady) {
                [FMCDebugTool logInfo:@"Transport Ready" withType:FMCDebugType_Transport_iAP];
                [self notifyTransportConnected];
            }
            break;
        }
        case NSStreamEventHasBytesAvailable:
            [self readDataIn];
            break;
        case NSStreamEventHasSpaceAvailable:
            [self writeDataOut];
            break;
        case NSStreamEventErrorOccurred:
        {
            NSString *logMessage = [NSString stringWithFormat:@"Stream Error:%@", [[stream streamError] localizedDescription]];
            [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Transport_iAP];
            break;
        }
        case NSStreamEventEndEncountered:
        {
//            NSString *logMessage = [NSString stringWithFormat:@"Stream is Closed:%@", stream.description];
//            [FMCDebugTool logInfo:logMessage withType:FMCDebugType_Transport_iAP];
            
            if (stream == [_session outputStream]) {
                self.isOutputStreamReady = NO;
            } else if (stream == [_session inputStream]) {
                self.isInputStreamReady = NO;
            }
            
            if (!self.isOutputStreamReady && !self.isInputStreamReady) {
                [self disconnect];
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
        
        [FMCDebugTool logInfo:[NSString stringWithFormat:@"Check Accessory: %@", accessory] withType:FMCDebugType_Transport_iAP];

        self.useLegacyProtocol = NO;
        
#ifdef DEBUG_USE_LEGACY
        self.useLegacyProtocol = YES;
#else
		for (NSString *protocolString in [accessory protocolStrings]) {
            if ([protocolString isEqualToString:LEGACY_PROTOCOL_STRING]) {
                self.useLegacyProtocol = YES;
            }
            
            if ([protocolString isEqualToString:CONTROL_PROTOCOL_STRING]) {
                [FMCDebugTool logInfo:[NSString stringWithFormat:@"MultiApp Sync @ %@", CONTROL_PROTOCOL_STRING] withType:FMCDebugType_Transport_iAP];
                
                self.useLegacyProtocol = NO;
                
                [self setupControllerForAccessory:accessory withProtocolString:CONTROL_PROTOCOL_STRING];
                return;
            }
        }
#endif
        
        if (self.useLegacyProtocol) {
            [FMCDebugTool logInfo:[NSString stringWithFormat:@"Legacy Sync @ %@", LEGACY_PROTOCOL_STRING] withType:FMCDebugType_Transport_iAP];
            
            [self setupControllerForAccessory:accessory withProtocolString:LEGACY_PROTOCOL_STRING];
            return;
        }
	}
}

- (void)dealloc {
    [FMCDebugTool logInfo:@"Dealloc" withType:FMCDebugType_Transport_iAP];
    
    [self closeSession];
    [self setupControllerForAccessory:nil withProtocolString:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EAAccessoryDidConnectNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:EAAccessoryDidDisconnectNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
}



#pragma mark Session Control

- (void)openSession {
//    [FMCDebugTool logInfo:@"Open Session" withType:FMCDebugType_Transport_iAP];
    
    if (self.accessory && self.protocolString) {
        
        self.session = [[EASession alloc] initWithAccessory:self.accessory forProtocol:self.protocolString];
        
        if (self.session) {
            [FMCDebugTool logInfo:@"Opening Session" withType:FMCDebugType_Transport_iAP];
            
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
                [FMCDebugTool logInfo:@"Session is nil on control" withType:FMCDebugType_Transport_iAP];
                //[FMCDebugTool logInfo:@"App may not have declared multiapp com.smartdevicelink.prot strings in Info.plist" withType:FMCDebugType_Transport_iAP];
                
                //Begin Connection Retry
                float randomNumber = (float)arc4random() / UINT_MAX; // between 0 and 1
                float randomMinMax = 0.0f + (0.5f-0.0f)*randomNumber; // between Min (0.0) and Max (0.5)
                
                [FMCDebugTool logInfo:[NSString stringWithFormat:@"Wait: %f", randomMinMax] withType:FMCDebugType_Transport_iAP];
                [self performSelector:@selector(openSession) withObject:nil afterDelay:randomNumber];
            } else {
                [FMCDebugTool logInfo:@"Session is nil" withType:FMCDebugType_Transport_iAP];
            }
        }
    } else {
        [FMCDebugTool logInfo:@"Accessory or ProtocolString is nil" withType:FMCDebugType_Transport_iAP];
    }
}

- (void)closeSession {
//    [FMCDebugTool logInfo:@"Close Session" withType:FMCDebugType_Transport_iAP];
    
    if (self.session) {
        [FMCDebugTool logInfo:@"Closing Session" withType:FMCDebugType_Transport_iAP];
        
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
- (void)writeDataOut {
    dispatch_async(writeQueue, ^{
        while (([[self.session outputStream] hasSpaceAvailable]) && ([self.writeData length] > 0))
        {
            NSInteger bytesWritten = [[self.session outputStream] write:[self.writeData bytes] maxLength:[self.writeData length]];
            
            [FMCSiphonServer _siphonRawTransportDataFromApp:[self.writeData bytes] msgBytesLength:(int)bytesWritten];
            
            if (bytesWritten == -1) {
                [FMCDebugTool logInfo:@"WriteDataOut Error" withType:FMCDebugType_Transport_iAP];
                break;
            }
            else if (bytesWritten > 0) {
                [self.writeData replaceBytesInRange:NSMakeRange(0, bytesWritten) withBytes:NULL length:0];
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
        
        [FMCSiphonServer _siphonRawTransportDataFromSync:buf msgBytesLength:(int)bytesRead];
        
        if (bytesRead > 0) {
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
        
        [FMCDebugTool logInfo:[NSString stringWithFormat:@"Moving To Protocol Index: %@", dataProtocol] withType:FMCDebugType_Transport_iAP];
        
        if ([dataProtocol isEqualToNumber:[NSNumber numberWithInt:255]]) {
            [FMCDebugTool logInfo:@"All Available Protocols Are In Use" withType:FMCDebugType_Transport_iAP];
            
            //FIXME: Restart but dont call back up to app or connect will keep getting called when busy...
            return;
        }
        else {
            NSString *currentProtocolString = [NSString stringWithFormat:@"com.smartdevicelink.prot%@", dataProtocol];
            
//            [FMCDebugTool logInfo:[NSString stringWithFormat:@"Switch To Data Protocol: %@", currentProtocolString] withType:FMCDebugType_Transport_iAP];
            
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

-(NSString*) getHexString:(UInt8*)bytes length:(int) length {
	NSMutableString* ret = [NSMutableString stringWithCapacity:(length * 2)];
	for (int i = 0; i < length; i++) {
		[ret appendFormat:@"%02X", ((Byte*)bytes)[i]];
	}
	return ret;
}

-(NSString*) getHexString:(NSData*) data {
	return [self getHexString:(Byte*)data.bytes length:(int)data.length];
}

-(void) backgroundButAwake:(NSTimer*) t
{
    [FMCDebugTool logInfo:@"Still Awake..." withType:FMCDebugType_Transport_iAP];
}

@end
