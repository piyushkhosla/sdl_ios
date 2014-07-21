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


@property (strong) EASession *session;
@property (strong) EAAccessory *accessory;

@property (strong) NSMutableData *writeData;

@property (assign) BOOL onControlProtocol;
@property (assign) BOOL useLegacyProtocol;

@property (strong) NSString *protocolString;


@end



@implementation FMCIAPTransport

- (id)init {
    if (self = [super initWithEndpoint:nil endpointParam:nil]) {
        
        [FMCDebugTool logInfo:@"Init" withType:FMCDebugType_Transport_iAP];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessoryConnected:) name:EAAccessoryDidConnectNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessoryDisconnected:) name:EAAccessoryDidDisconnectNotification object:nil];
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
    if (!self.writeData) {
        self.writeData = [[NSMutableData alloc] init];
    }
    
    [self.writeData appendData:data];
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



#pragma mark -
#pragma mark NSStreamDelegateEventExtensions

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)event
{
//    if (eventCode != NSStreamEventHasBytesAvailable && eventCode != NSStreamEventHasSpaceAvailable) {
//    [FMCDebugTool logInfo:[NSString stringWithFormat:@"%@ Stream Event: %@", ((stream == [self.session inputStream]) ? @"In" : @"Out"), [self stringForEventCode:event]] withType:FMCDebugType_Transport_iAP];
//    }
    
    switch (event) {
        case NSStreamEventNone:
            break;
        case NSStreamEventOpenCompleted:
            if ((stream == [_session outputStream]) && !self.onControlProtocol) {
                    [self notifyTransportConnected];
            }
            break;
        case NSStreamEventHasBytesAvailable:
            [self readDataIn];
            break;
        case NSStreamEventHasSpaceAvailable:
            [self writeDataOut];
            break;
        case NSStreamEventErrorOccurred:
            break;
        case NSStreamEventEndEncountered:
            if (stream == [self.session inputStream]) {
                [self disconnect];
            }
            break;
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
}



#pragma mark Session Control

- (void)openSession {
    [FMCDebugTool logInfo:@"Open Session" withType:FMCDebugType_Transport_iAP];
    
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
            [FMCDebugTool logInfo:@"Session is nil" withType:FMCDebugType_Transport_iAP];
            if ([self.protocolString isEqualToString:CONTROL_PROTOCOL_STRING]) {
                [FMCDebugTool logInfo:@"App may not have declared multi com.smartdevicelink.prot strings in Info.plist" withType:FMCDebugType_Transport_iAP];
            }
        }
    } else {
        [FMCDebugTool logInfo:@"Accessory or ProtocolString is nil" withType:FMCDebugType_Transport_iAP];
    }
}

- (void)closeSession {
    [FMCDebugTool logInfo:@"Close Session" withType:FMCDebugType_Transport_iAP];
    
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
    }
}



#pragma mark Low Level Read/Write

// Write data to the accessory while there is space available and data to write
- (void)writeDataOut {
    @synchronized(self)
    {
        while (([[self.session outputStream] hasSpaceAvailable]) && ([self.writeData length] > 0))
        {
            NSInteger bytesWritten = [[self.session outputStream] write:[self.writeData bytes] maxLength:[self.writeData length]];
            if (bytesWritten == -1) {
                [FMCDebugTool logInfo:@"WriteDataOut Error" withType:FMCDebugType_Transport_iAP];
                break;
            }
            else if (bytesWritten > 0) {
                [self.writeData replaceBytesInRange:NSMakeRange(0, bytesWritten) withBytes:NULL length:0];
            }
        }
    }
}

// Read data while there is data and space available in the input buffer
- (void)readDataIn {
    uint8_t buf[IAP_INPUT_BUFFER_SIZE];
    while ([[self.session inputStream] hasBytesAvailable])
    {
        NSInteger bytesRead = [[self.session inputStream] read:buf maxLength:IAP_INPUT_BUFFER_SIZE];
        
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
        
        [FMCDebugTool logInfo:[NSString stringWithFormat:@"Data Protocol: %@", dataProtocol] withType:FMCDebugType_Transport_iAP];
        
        if ([dataProtocol isEqualToNumber:[NSNumber numberWithInt:255]]) {
            [FMCDebugTool logInfo:@"All Available Protocols Are In Use" withType:FMCDebugType_Transport_iAP];
            
            //FIXME: Restart but dont call back up to app or connect will keep getting called when busy...
            return;
        }
        else {
            NSString *currentProtocolString = [NSString stringWithFormat:@"com.smartdevicelink.prot%@", dataProtocol];
            
            [FMCDebugTool logInfo:[NSString stringWithFormat:@"Switch To Data Protocol: %@", currentProtocolString] withType:FMCDebugType_Transport_iAP];
            
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

- (NSString*)stringForEventCode:(NSStreamEvent) eventCode {
	switch (eventCode) {
		case NSStreamEventOpenCompleted:
			return @"OpenCompleted";
			break;
		case NSStreamEventHasSpaceAvailable:
			return @"HasSpaceAvailable";
			break;
		case NSStreamEventEndEncountered:
			return @"EndEncountered";
			break;
		case NSStreamEventErrorOccurred:
			return @"ErrorOccurred";
			break;
		case NSStreamEventHasBytesAvailable:
			return @"HasBytesAvailable";
			break;
		default:
			break;
	}
	return nil;
}

@end
