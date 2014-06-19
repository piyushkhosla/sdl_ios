//  FMCIAPTransport.m
//  FMCSyncIAPTransport.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <UIKit/UIKit.h>
#import "FMCIAPTransport.h"
#import "FMCDebugTool.h"
#import "FMCSiphonServer.h"

#define SYNC_PROTOCOL_STRING @"com.ford.sync.prot0"

@interface FMCIAPTransport ()

-(void) accessoryConnected:(NSNotification*) connectNotification;
-(void) accessoryDisconnected:(NSNotification*) connectNotification;
-(NSString*) stringForEventCode:(NSStreamEvent) eventCode;

@end

@implementation FMCIAPTransport
@synthesize session;
@synthesize inStream;
@synthesize outStream;

-(id) init {
    
    [FMCDebugTool logType:FMCDebugType_Transport_iAP withInfo:@"Init"];
    
    if (self = [super init]) {
		transportLock = [[NSObject alloc] init];
		writeQueue = [[NSMutableArray alloc] initWithCapacity:10];
		spaceAvailable = NO;
        
        if (!registeredForNotifications) {
            registeredForNotifications = YES;
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessoryConnected:) name:EAAccessoryDidConnectNotification object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(accessoryDisconnected:) name:EAAccessoryDidDisconnectNotification object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        }
        
        if ([[UIApplication sharedApplication] applicationState] == UIApplicationStateBackground) {
            appInBackground = YES;
        } else {
            appInBackground = NO;
        }
        
        transportUsable = YES;
        [FMCSiphonServer init];
	}
	return self;
}

- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode {
    
//    //TODO:DEBUGOUTS
//    if (eventCode != NSStreamEventHasBytesAvailable && eventCode != NSStreamEventHasSpaceAvailable) {
//        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:[NSString stringWithFormat:@"iAP: %@ Stream Event: %@", ((aStream == inStream) ? @"In" : @"Out"), [self stringForEventCode:eventCode]]]];
//        [FMCDebugTool logInfo:[NSString stringWithFormat:@"iAP: %@ Stream Event: %@", ((aStream == inStream) ? @"In" : @"Out"), [self stringForEventCode:eventCode]]];
//    }
//    ///TODO:ENDDEBUGOUTS
    
	if (aStream == inStream) {
		if (eventCode == NSStreamEventHasBytesAvailable || eventCode == NSStreamEventOpenCompleted) {
			UInt8 buf[1024];
			while (YES) {
				int bytesRead = (int)[inStream read:buf maxLength:1024];
                
                [FMCSiphonServer _siphonRawTransportDataFromSync:buf msgBytesLength:bytesRead];
                
				if (bytesRead > 0) {
                    [FMCDebugTool logType:FMCDebugType_Transport_iAP usingOutput:FMCDebugOutput_DeviceConsole withInfo:[NSString stringWithFormat:@"Read %d bytes: %@", bytesRead, [self getHexString:buf length:bytesRead]]];
                    
                    [self handleDataReceivedFromTransport:[NSData dataWithBytes:buf length:bytesRead]];
				} else {
					break;
				}
                
			}
		} else if (eventCode == NSStreamEventEndEncountered) {
			[self disconnect];
		}
	} else if (aStream == outStream) {
		if (eventCode == NSStreamEventHasSpaceAvailable) {
			if (writeQueue.count > 0) {
				@synchronized(transportLock) {
					NSData* msgBytes = [writeQueue objectAtIndex:0];
                    
					spaceAvailable = NO;
                    
					int bytesWritten = (int)[outStream write:msgBytes.bytes maxLength:msgBytes.length];
                    
                    [FMCDebugTool logType:FMCDebugType_Transport_iAP usingOutput:FMCDebugOutput_DeviceConsole withInfo:[NSString stringWithFormat:@"Sent %d bytes: %@", bytesWritten, [self getHexString:msgBytes]]];
                    
                    [FMCSiphonServer _siphonRawTransportDataFromApp:msgBytes.bytes msgBytesLength:bytesWritten];
                    
					if (bytesWritten < msgBytes.length) {
						NSData* leftover = [NSData dataWithBytes:msgBytes.bytes + bytesWritten length:msgBytes.length - bytesWritten];
						//Insert the leftover bytes at the front of the queue
						[writeQueue insertObject:leftover atIndex:0];
					}
					[writeQueue removeObjectAtIndex:0];
				}
			} else {
				spaceAvailable = YES;
			}
		} else if (eventCode == NSStreamEventOpenCompleted) {
            [self notifyTransportConnected];
		} else if (eventCode == NSStreamEventEndEncountered) {
			//[self handleTransportDisconnected];
		}
	}
}

-(NSString*) stringForEventCode:(NSStreamEvent) eventCode {
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

- (BOOL)connect:(EAAccessory*)accessoryItem usedProtocol:(NSString*)protocolName
{
    @synchronized (transportLock) {
		// Select the first accessory:
        self.session = [[[EASession alloc] initWithAccessory:accessoryItem forProtocol:protocolName] autorelease];        
        
		if(accessoryItem != nil && self.session != nil) {
			self.inStream = self.session.inputStream;
			self.outStream = self.session.outputStream;
			
			@try {		
				// Initialize and schedule the input stream:
				if(self.inStream != nil) {
					self.inStream.delegate = self;
					[self.inStream scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
					[self.inStream open];
				} else {	
//                    //TODO:DEBUGOUTS
//                    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: connect:usedProtocol:  outStream not set"]];
//                    [FMCDebugTool logInfo:@"iAP: connect:usedProtocol: outStream not set"];
//                    //TODO:ENDDEBUGOUTS
                    
                    return NO;
				}
				
				// Initialize and schedule the output stream:
				if(self.outStream != nil) {
					self.outStream.delegate = self;
					[self.outStream scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
					[self.outStream open];
				} else {	
//                    //TODO:DEBUGOUTS
//                    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: connect:usedProtocol:  outStream not set"]];
//                    [FMCDebugTool logInfo:@"iAP: connect:usedProtocol: outStream not set"];
//                    //TODO:ENDDEBUGOUTS
                    
                    return NO;
				}
			}
			@catch (id streamEx) {
				return NO;
			}
		
        } else {
            
//            //TODO:DEBUGOUTS
//            [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: connect:usedProtocol: Session and Accessory not set"]];
//            [FMCDebugTool logInfo:@"iAP: connect:usedProtocol: Session and Accessory not set"];
//            //TODO:ENDDEBUGOUTS
            
			return NO;
		}
	}
    
    [FMCDebugTool logType:FMCDebugType_Transport_iAP withInfo:@"Connected To Sync"];
    
    return YES;
}

- (bool) connect {
    if (connectedSyncAccessory != nil) {
        [self connect:connectedSyncAccessory usedProtocol:SYNC_PROTOCOL_STRING];
    } else {
        [self checkConnectedSyncAccessory];
        if (connectedSyncAccessory != nil) {
            [self connect:connectedSyncAccessory usedProtocol:SYNC_PROTOCOL_STRING];
        } else {
            return NO;
        }
    }
	return YES;
}

-(void) checkConnectedSyncAccessory {
    
    [FMCDebugTool logType:FMCDebugType_Transport_iAP withInfo:@"Looking For Sync"];
    
    for (EAAccessory* anAccessory in [[EAAccessoryManager sharedAccessoryManager] connectedAccessories]) {
        
//        //TODO:DEBUGOUTS
//        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Accessory Found"]];
//        [FMCDebugTool logInfo:@"iAP: Accessory Found"];
//        //TODO:ENDDEBUGOUTS
        
		for (NSString *aProtocolString in [anAccessory protocolStrings]) {
//            //TODO:DEBUGOUTS
//            [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Found Protocol String"]];
//            [FMCDebugTool logInfo:@"iAP: Found protocol string: %@", aProtocolString];
//            ///TODO:ENDDEBUGOUTS
			
            if ([aProtocolString isEqualToString:SYNC_PROTOCOL_STRING]) {
                
                [FMCDebugTool logType:FMCDebugType_Transport_iAP withInfo:@"Found Sync"];
                

                if (connectedSyncAccessory != nil) {
                    [connectedSyncAccessory release];
                    connectedSyncAccessory = nil;
                }
                
                connectedSyncAccessory = [anAccessory retain];
                return;
                break;
			}
		}
	}
}

-(void)applicationWillEnterForeground:(NSNotification *)notification {
//    //TODO:DEBUGOUTS
//    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Will Enter Foreground"]];
//    [FMCDebugTool logInfo:@"iAP: Will Enter Foreground"];
//    //TODO:ENDDEBUGOUTS
    
    appInBackground = NO;
    [self connect];
}

-(void)applicationDidEnterBackground:(NSNotification *)notification {
//    //TODO:DEBUGOUTS
//    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Did Enter Background"]];
//    [FMCDebugTool logInfo:@"iAP: Did Enter Background"];
//    //TODO:ENDDEBUGOUTS
    
    appInBackground = YES;
}

-(EAAccessory*) getSyncAccessoryFromNotification:(NSNotification*) notification {
    EAAccessory *accessory = [[notification userInfo] objectForKey:EAAccessoryKey];
    
    for (NSString *protocolString in [accessory protocolStrings]) {
        if ([protocolString isEqualToString:SYNC_PROTOCOL_STRING]) {
            return accessory;
        }
    }
    
    return nil;
}

-(void) accessoryConnected:(NSNotification*) connectNotification {
    
    [FMCDebugTool logType:FMCDebugType_Transport_iAP withInfo:@"Accessory Connected"];
    
    EAAccessory *connectedAccessory = [self getSyncAccessoryFromNotification:connectNotification];
    
    if(connectedAccessory == nil) {
    	// connectedAccessory is not a SYNC accessory
        return;
    }
    
    // We're assuming connectedSyncAccessory will be nil
	if (connectedSyncAccessory != nil) {
        [connectedSyncAccessory release];
        connectedSyncAccessory = nil;
	}
    
	connectedSyncAccessory = [connectedAccessory retain];
	[self connect];
    
}

-(void) accessoryDisconnected:(NSNotification*) connectNotification {
    
    [FMCDebugTool logType:FMCDebugType_Transport_iAP withInfo:@"Accessory Disconnected"];
    
    EAAccessory *disconnectedAccessory = [self getSyncAccessoryFromNotification:connectNotification];
    
    if(disconnectedAccessory == nil) {
    	// disconnectedAccessory is not a SYNC accessory
        return;
    }
    
    if ([disconnectedAccessory connectionID] == [connectedSyncAccessory connectionID]) {
        if (session != nil) {
            [self disconnect];
        }
        
        [connectedSyncAccessory release];
        connectedSyncAccessory = nil;
    }
}

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

-(void) queueData:(NSData*) msgBytes {
	@synchronized (transportLock) {
		if (spaceAvailable) {
			spaceAvailable = NO;
			
			int bytesWritten = (int)[outStream write:msgBytes.bytes maxLength:msgBytes.length];

            [FMCDebugTool logType:FMCDebugType_Transport_iAP usingOutput:FMCDebugOutput_DeviceConsole withInfo:[NSString stringWithFormat:@"Sent %d bytes: %@", bytesWritten, [self getHexString:msgBytes]]];
            
            [FMCSiphonServer _siphonRawTransportDataFromApp:msgBytes.bytes msgBytesLength:bytesWritten];
            
			if (bytesWritten < msgBytes.length) {
				[writeQueue insertObject:[NSData dataWithBytes:msgBytes.bytes + bytesWritten length:msgBytes.length - bytesWritten] atIndex:0];
			}
			
		} else {
			[writeQueue addObject:msgBytes];
		}
	}
}

- (bool) sendData:(NSData*) msgBytes {
    
//    [FMCDebugTool logType:FMCDebugType_Transport_iAP withInfo:[NSString stringWithFormat:@"Queueing %d bytes: %@", msgBytes.length, [self getHexString:msgBytes]]];
	[self queueData:msgBytes];
	return YES;
}

- (void) disconnect {
    
    [FMCDebugTool logType:FMCDebugType_Transport_iAP withInfo:@"Disconnect"];
    
    @synchronized (transportLock) {
        [self notifyTransportDisconnected];
        transportUsable = NO;
        
		if (session != nil) {
			
            [outStream close];
			[outStream removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
			[outStream setDelegate:nil];
            [outStream release];
            outStream = nil;
            
            [inStream close];
            [inStream removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
			[inStream setDelegate:nil];
			[inStream release];
			inStream = nil;
			
			[session release];
			session = nil;
			
			[writeQueue release];
			writeQueue = nil;
            
		}
	}
}

- (void) dealloc {
    
    [self disconnect];
    
//    //TODO:DEBUGOUTS
//    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Dealloc"]];
//    [FMCDebugTool logInfo:@"iAP: Dealloc"];
//    //TODO:ENDDEBUGOUTS
    
    if (registeredForNotifications) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:EAAccessoryDidConnectNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:EAAccessoryDidDisconnectNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillEnterForegroundNotification object:nil];
        registeredForNotifications = NO;
    }
    
    [connectedSyncAccessory release];
    connectedSyncAccessory = nil;
    
	[transportLock release];
    
	[super dealloc];
}

@end
