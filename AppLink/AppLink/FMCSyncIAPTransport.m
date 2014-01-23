//  FMCSyncIAPTransport.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <UIKit/UIKit.h>
#import <AppLink/FMCSyncIAPTransport.h>
#import <AppLink/FMCDebugTool.h>
#import <AppLink/FMCSiphonServer.h>

#define SYNC_PROTOCOL_STRING @"com.ford.sync.prot0"

@interface FMCSyncIAPTransport ()

-(void) accessoryConnected:(NSNotification*) connectNotification;
-(void) accessoryDisconnected:(NSNotification*) connectNotification;
-(NSString*) stringForEventCode:(NSStreamEvent) eventCode;

@end

@implementation FMCSyncIAPTransport
@synthesize session;
@synthesize inStream;
@synthesize outStream;

-(id) init {
    //TODO:DEBUGOUTS
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Init"]];
    [FMCDebugTool logInfo:@"iAP: Init"];
    //TODO:ENDDEBUGOUTS
    if (self = [super initWithEndpoint:nil endpointParam:nil]) {
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
//    [FMCDebugTool logInfo:@"FMSyncIAPTransport: stream:handleEvent: begins (eventCode = %@)", [self stringForEventCode:eventCode]];
	if (aStream == inStream) {
		if (eventCode == NSStreamEventHasBytesAvailable || eventCode == NSStreamEventOpenCompleted) {
			UInt8 buf[1024];
			while (YES) {
				int bytesRead = [inStream read:buf maxLength:1024];
                
                [FMCSiphonServer _siphonRawTransportDataFromSync:buf msgBytesLength:bytesRead];
                
				if (bytesRead > 0) {
					[self handleBytesReceivedFromTransport:buf	length:bytesRead];
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
                    
					int bytesWritten = [outStream write:msgBytes.bytes maxLength:msgBytes.length];
                    
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
//    //TODO:DEBUGOUTS
//    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Connecting To Sync"]];
//    [FMCDebugTool logInfo:@"iAP: Connecting To Sync"];
//    //TODO:ENDDEBUGOUTS
    @synchronized (transportLock) {
		// Select the first accessory:
        self.session = [[[EASession alloc] initWithAccessory:accessoryItem forProtocol:protocolName] autorelease];        
        
		if(accessoryItem != nil && self.session != nil) {
			self.inStream = self.session.inputStream;
			self.outStream = self.session.outputStream;
			
			@try {		
				// Initialize and schedule the input stream:
				if(self.inStream != nil) {
                    [FMCDebugTool logInfo:@"iAP: connect:usedProtocol: Initializing input steam"];
					self.inStream.delegate = self;
					[self.inStream scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
					[self.inStream open];
				} else {	
					return NO;
				}
				
				// Initialize and schedule the output stream:
				if(self.outStream != nil) {
                    [FMCDebugTool logInfo:@"iAP: connect:usedProtocol: Initializing output steam"];
					self.outStream.delegate = self;
					[self.outStream scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
					[self.outStream open];
				} else {	
					return NO;
				}
			}
			@catch (id streamEx) {
				return NO;
			}
		
        } else {
            [FMCDebugTool logInfo:@"iAP: connect:usedProtocol: Session and Accessory not set"];
			return NO;
		}
	}
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
    
    //TODO:DEBUGOUTS
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Looking For Sync"]];
    [FMCDebugTool logInfo:@"iAP: Looking For Sync"];
    //TODO:ENDDEBUGOUTS
    
    for (EAAccessory* anAccessory in [[EAAccessoryManager sharedAccessoryManager] connectedAccessories]) {
        
        //TODO:DEBUGOUTS
        [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Accessory Found"]];
        [FMCDebugTool logInfo:@"iAP: Accessory Found"];
        //TODO:ENDDEBUGOUTS
        
		for (NSString *aProtocolString in [anAccessory protocolStrings]) {
            //TODO:DEBUGOUTS
            [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Found Protocol String"]];
            [FMCDebugTool logInfo:@"iAP: Found protocol string: %@", aProtocolString];
            ///TODO:ENDDEBUGOUTS
			
            if ([aProtocolString isEqualToString:SYNC_PROTOCOL_STRING]) {
                //TODO:DEBUGOUTS
                [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Found Sync"]];
                [FMCDebugTool logInfo:@"iAP: Found SYNC accessory: %@", anAccessory.name];
                ///TODO:ENDDEBUGOUTS
                
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
    //TODO:DEBUGOUTS
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Accessory Connected"]];
    [FMCDebugTool logInfo:@"iAP: Accessory Connected"];
    //TODO:ENDDEBUGOUTS
    
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
    
    //TODO:DEBUGOUTS
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Accessory Disconnected"]];
    [FMCDebugTool logInfo:@"iAP: Accessory Disconnected"];
    //TODO:ENDDEBUGOUTS
    
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
	return [self getHexString:(Byte*)data.bytes length:data.length];
}


-(void) queueData:(NSData*) msgBytes {
	@synchronized (transportLock) {
		if (spaceAvailable) {
			spaceAvailable = NO;
			
			int bytesWritten = [outStream write:msgBytes.bytes maxLength:msgBytes.length];
            
            [FMCSiphonServer _siphonRawTransportDataFromApp:msgBytes.bytes msgBytesLength:bytesWritten];
            
			if (bytesWritten < msgBytes.length) {
				[writeQueue insertObject:[NSData dataWithBytes:msgBytes.bytes + bytesWritten length:msgBytes.length - bytesWritten] atIndex:0];
			}
			
		} else {
			[writeQueue addObject:msgBytes];
		}
	}
}

- (bool) sendBytes:(NSData*) msgBytes {
	[self queueData:msgBytes];
	return YES;
}

- (void) disconnect {
    //TODO:DEBUGOUTS
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Disconnect"]];
    [FMCDebugTool logInfo:@"iAP: Disconnect"];
    //TODO:ENDDEBUGOUTS
    
    [self notifyTransportDisconnected];
    
    @synchronized (transportLock) {
		
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
    
    //TODO:DEBUGOUTS
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"iAP: Dealloc"]];
    [FMCDebugTool logInfo:@"iAP: Dealloc"];
    //TODO:ENDDEBUGOUTS
    
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
