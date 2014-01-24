//  FMCAbstractProtocol.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCAbstractProtocol.h>

@implementation FMCAbstractProtocol

-(void) sendStartSessionWithType:(FMCSessionType) sessionType {
	[self doesNotRecognizeSelector:_cmd];
}

-(void) sendEndSessionWithType:(FMCSessionType)sessionType sessionID:(Byte)sessionID {
	[self doesNotRecognizeSelector:_cmd];
}

/*
-(void) sendData:(NSData*) data sessionType:(FMCSessionType)sessionType sessionID:(Byte)sessionID {
	[self doesNotRecognizeSelector:_cmd];
}
*/
-(void) sendData:(FMCProtocolMessage*) protocolMsg {
    [self doesNotRecognizeSelector:_cmd];
}

-(void) handleBytesFromTransport:(Byte *)receivedBytes length:(long)receivedBytesLength {
	[self doesNotRecognizeSelector:_cmd];
}

-(id) init {
	if (self = [super init]) {
		protocolListeners = [[NSMutableArray alloc] initWithCapacity:1];
	}
	return self;
}

-(void) addProtocolListener:(NSObject<FMCProtocolListener>*)listener {
	@synchronized (protocolListeners) {
		[protocolListeners addObject:listener];
	}
}	

-(void) removeProtocolListener:(NSObject<FMCProtocolListener>*)listener {
	@synchronized (protocolListeners) {
		[protocolListeners removeObject:listener];
	}
}

-(void) setTransport:(NSObject<FMCSyncTransport>*) theTransport {
	transport = theTransport;
}

-(NSObject<FMCSyncTransport>*) transport {
	return transport;
}

- (void) onTransportConnected {
	NSArray* localListeners = nil;
	
	@synchronized(protocolListeners) {
		localListeners = [protocolListeners copy];
	}
	
	for (NSObject<FMCProtocolListener>* listener in localListeners) {
		
		[listener onProtocolOpened];
	}
	[localListeners release];
}

- (void) onTransportDisconnected {NSArray* localListeners = nil;
	@synchronized(protocolListeners) {
		localListeners = [protocolListeners copy];
	}
	
	for (NSObject<FMCProtocolListener>* listener in localListeners) {
		
		[listener onProtocolClosed];
	}
	[localListeners release];
}

- (void) onBytesReceived:(Byte*)bytes length:(long) length {
	[self handleBytesFromTransport:(Byte*)bytes length:length];
}

-(void) dealloc {
	[protocolListeners release];
	[super dealloc];
}

@end
