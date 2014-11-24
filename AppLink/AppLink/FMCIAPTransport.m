//  FMCIAPTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import "FMCIAPSession.h"
#import "FMCDebugTool.h"
#import "FMCSiphonServer.h"
#import "FMCIAPConfig.h"
#import "FMCIAPConnectionManager.h"
#import "FMCIAPTransport.h"

@interface FMCIAPTransport ()

- (void)startEventListening;
- (void)stopEventListening;

@end



@implementation FMCIAPTransport

- (instancetype)init {
    if (self = [super init]) {

        [FMCDebugTool logInfo:@"Init"
                     withType:FMCDebugType_Transport_iAP
                     toOutput:FMCDebugOutput_All
                      toGroup:self.debugConsoleGroupName];

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

    if (!self.session) {
        self.session = [FMCIAPConnectionManager createSession];
        [self.session open];
    }


}

- (void)disconnect {
    [FMCDebugTool logInfo:@"Disconnect" withType:FMCDebugType_Transport_iAP toOutput:FMCDebugOutput_All toGroup:self.debugConsoleGroupName];

    [self stopEventListening];
    [self.session close];
    self.session = nil;
}

- (void)sendData:(NSData*) data {
    [self writeDataOut:data];
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




#pragma mark Low Level Read/Write

// Write data to the accessory while there is space available and data to write
- (void)writeDataOut:(NSData *)dataOut {

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


// We recieved data. Give it to our delegate.
- (void)handleBytesReceivedFromTransport:(Byte *)receivedBytes length:(NSInteger)receivedBytesLength {
    [self.delegate onDataReceived:[NSData dataWithBytes:receivedBytes length:receivedBytesLength]];
}


@end
