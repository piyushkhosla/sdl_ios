//  FMCWiProProtocol.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCWiProProtocol.h>

#import <UIKit/UIKit.h>
#import <AppLink/FMCBitConverter.h>
#import <AppLink/FMCDebugTool.h>
#import <AppLink/FMCProtocolFrameHeaderFactory.h>
#import <AppLink/FMCProtocolFrameHeader.h>
#import <AppLink/FMCBinaryFrameHeader.h>

#define HEADER_BUF_LENGTH 8
#define PROT2_HEADER_BUF_LENGTH 12
#define MTU_SIZE 512

//from.h
//-(FMMessageType) messageTypeForFrameHeader:(FMCProtocolFrameHeader*)header;

@implementation FMCWiProProtocol

-(id) init {
	if (self = [super init]) {
		msgLock = [[NSObject alloc] init];
		headerBuf = nil;
		dataBuf = nil;
		currentHeader = nil;
		[self resetHeaderAndData];
		frameAssemblerForSessionID = [[NSMutableDictionary alloc] initWithCapacity:2];
        
        _version = 1;
        _messageID = 0;
	}
	return self;
}

-(void) resetHeaderAndData {
    [headerBuf release];

	haveHeader = NO;
    if (_version == 1) {
        headerSize = HEADER_BUF_LENGTH * sizeof(Byte);
    } else {
        headerSize = PROT2_HEADER_BUF_LENGTH * sizeof(Byte);
    }
	headerBuf = [[NSMutableData alloc] initWithCapacity:headerSize];

    [dataBuf release];
    dataBuf = nil;

    [currentHeader release];
    currentHeader = nil;
}

- (void) setVersion:(Byte) version {
    _version = version;
    
    [headerBuf release];
    headerBuf = nil;
    
    if (version == 2) {
        headerSize = PROT2_HEADER_BUF_LENGTH * sizeof(Byte);
        headerBuf = [[NSMutableData alloc] initWithCapacity:headerSize];
    }
}

- (void) doAlertMessage:(NSString*) message withTitle:(NSString*) title{
	UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alertView show];
	[alertView release];
	
}//end action

-(FrameAssembler*) getFrameAssemblerForFrameHeader:(FMCProtocolFrameHeader*) header {
	id sessionIDKey = [NSNumber numberWithInt:header._sessionID];
    
	FrameAssembler *ret = [frameAssemblerForSessionID objectForKey:sessionIDKey];

	if (ret == nil) {
		if (header._sessionType == FMCSessionType_RPC) {
			ret = [[FrameAssembler alloc] initWithListeners:protocolListeners];
		} else if (header._sessionType == FMCSessionType_BulkData) {
			ret = [[BulkAssembler alloc] initWithListeners:protocolListeners];
		}
        
		[frameAssemblerForSessionID setObject:ret forKey:sessionIDKey];
        return [ret autorelease];
	}
	return ret;
}

-(void) handleBytesFromTransport:(Byte *)receivedBytes length:(long)receivedBytesLength {
	long receivedBytesReadPos = 0;
    
    //Check for a version difference
    if (_version == 1) {
        //Nothing has been read into the buffer and version is 2
        if (headerBuf.length == 0 && (receivedBytes[0] >> 4) == 2) {
            [self setVersion:(Byte) receivedBytes[0] >> 4];
			//Buffer has something in it and version is 2
        } else if ((((Byte *)headerBuf.bytes)[0] >> 4) == 2) {
            //safe current state of the buffer and also set the new version
            NSMutableData* tempHeader = nil;
            tempHeader = [[NSMutableData alloc] initWithCapacity:headerBuf.length];
            tempHeader = headerBuf;
            [self setVersion:(Byte) ((Byte *)headerBuf.bytes)[0] >> 4];
            headerBuf = tempHeader;
        }
    }
    
	// If I don't yet know the message size, grab those bytes.
	if (!haveHeader) {
		// If I can't get the size, just get the bytes that are there.
        int sizeBytesNeeded;
        if (_version == 1) {
            sizeBytesNeeded = HEADER_BUF_LENGTH - headerBuf.length;
        } else {
            sizeBytesNeeded = PROT2_HEADER_BUF_LENGTH - headerBuf.length;
        }
        
		if (receivedBytesLength < sizeBytesNeeded) {
			[headerBuf appendBytes:receivedBytes + receivedBytesReadPos length:receivedBytesLength];
			return;
		} else {
            // If I got the size, allocate the buffer
			[headerBuf appendBytes:receivedBytes + receivedBytesReadPos length:sizeBytesNeeded];
			receivedBytesReadPos += sizeBytesNeeded;
			haveHeader = true;
			dataBufFinalLength = [FMCBitConverter intFromByteArray:(Byte*)headerBuf.bytes offset:4];
            
            [dataBuf release];
            dataBuf = nil;

			dataBuf = [[NSMutableData alloc] initWithCapacity:dataBufFinalLength];
			currentHeader = [[FMCProtocolFrameHeaderFactory parseHeader:headerBuf] retain];
		}
		
	}
	
	int bytesLeft = receivedBytesLength - receivedBytesReadPos;
	int bytesNeeded = dataBufFinalLength - dataBuf.length;
	// If I don't have enough bytes for the message, just grab what's there.
	if (bytesLeft < bytesNeeded) {
		[dataBuf appendBytes:receivedBytes + receivedBytesReadPos length:bytesLeft];
		return;
	} else {
        // Fill the buffer and call the handler!
		[dataBuf appendBytes:receivedBytes + receivedBytesReadPos length:bytesNeeded];
		receivedBytesReadPos += bytesNeeded;
		FrameAssembler *assembler = [self getFrameAssemblerForFrameHeader:currentHeader];
		[assembler handleFrame:currentHeader data:dataBuf];
		[self resetHeaderAndData];
		
		//If there are any bytes left, recurse.
		int moreBytesLeft = receivedBytesLength - receivedBytesReadPos;
		if (moreBytesLeft > 0) {
			[self handleBytesFromTransport:receivedBytes + receivedBytesReadPos  length:moreBytesLeft];
		}
	}
}

-(NSData*) assembleHeaderBytes:(FMCProtocolFrameHeader*) msg {
	UInt32 header = 0;
	header |= msg._version;
	header <<= 1;
	header |= (msg._compressed ? 1 : 0);
	header <<= 3;
	header |= msg._frameType;
	header <<= 8;
	header |= msg._sessionType;
	header <<= 8;
	header |= msg._frameData;
	header <<= 8;
	header |= msg._sessionID;
	
    NSData* ret;
    if (_version == 1) {
        Byte* mallocPtr = malloc(HEADER_BUF_LENGTH);
        if (mallocPtr == nil) {
            @throw [NSException exceptionWithName:@"OutOfMemoryException" reason:@"malloc failed" userInfo:nil];
        }
        ret = [[NSData alloc] initWithBytesNoCopy:mallocPtr length:HEADER_BUF_LENGTH];

        memcpy((void*)ret.bytes, [FMCBitConverter intToByteArray:header].bytes, 4);
        memcpy((void*)ret.bytes + 4, [FMCBitConverter intToByteArray:msg._dataSize].bytes, 4);
    } else {
        Byte* mallocPtr = malloc(PROT2_HEADER_BUF_LENGTH);
        if (mallocPtr == nil) {
            @throw [NSException exceptionWithName:@"OutOfMemoryException" reason:@"malloc failed" userInfo:nil];
        }
        ret = [[NSData alloc] initWithBytesNoCopy:mallocPtr length:PROT2_HEADER_BUF_LENGTH];
        
        memcpy((void*)ret.bytes, [FMCBitConverter intToByteArray:header].bytes, 4);
        memcpy((void*)ret.bytes + 4, [FMCBitConverter intToByteArray:msg._dataSize].bytes, 4);
        memcpy((void*)ret.bytes + 8, [FMCBitConverter intToByteArray:msg._messageID].bytes, 4);
    }
	
	return [ret autorelease];
}

-(void) sendFrameToTransport:(FMCProtocolFrameHeader *)header withData:(NSData*) data {
	if (data == nil || data.length == 0){
		[transport sendBytes:[self assembleHeaderBytes:header]];
	} else {
        NSMutableData* toSend;
        if (_version == 1) {
            toSend = [NSMutableData dataWithCapacity:data.length + HEADER_BUF_LENGTH];
        } else {
            toSend = [NSMutableData dataWithCapacity:data.length + PROT2_HEADER_BUF_LENGTH];
        }
		
		[toSend appendData:[self assembleHeaderBytes:header]];
		
		[toSend appendData:data];
		
		[transport sendBytes:toSend];
	}
	
}

-(void) sendFrameToTransport:(FMCProtocolFrameHeader *)header {
	[self sendFrameToTransport:header withData:nil];
}

-(void) sendFrameToTransport:(FMCProtocolFrameHeader *)header withData:(NSData*) data offset:(NSInteger) offset length:(NSInteger) length{
	
    NSMutableData* toSend;
    if (_version == 1) {
        toSend = [NSMutableData dataWithCapacity:length + HEADER_BUF_LENGTH];
    } else {
        toSend = [NSMutableData dataWithCapacity:length + PROT2_HEADER_BUF_LENGTH];
    }
	
	[toSend appendData:[self assembleHeaderBytes:header]];
	
	[toSend appendBytes:data.bytes + offset length:length];
	
	[transport sendBytes:toSend];
	
}

//-(void) sendData:(NSData*)data sessionType:(FMCSessionType)sessionType sessionID:(Byte)sessionID {
-(void) sendData:(FMCProtocolMessage*) protocolMsg {
    protocolMsg._rpcType = (Byte) 0x00;
    FMCSessionType sessionType = protocolMsg._sessionType;
    Byte sessionID = protocolMsg._sessionID;
    
    NSData* data;
    if (_version == 2) {
        if (protocolMsg._bulkData != nil) {
            Byte* mallocPtr = malloc(12 + protocolMsg._jsonSize + protocolMsg._bulkData.length);
            if (mallocPtr == nil) {
                @throw [NSException exceptionWithName:@"OutOfMemoryException" reason:@"malloc failed" userInfo:nil];
            }
            data = [[NSData alloc] initWithBytesNoCopy:mallocPtr length:(12 + protocolMsg._jsonSize + protocolMsg._bulkData.length)];
            sessionType = FMCSessionType_BulkData;
        } else {
            Byte* mallocPtr = malloc(12 + protocolMsg._jsonSize);
            if (mallocPtr == nil) {
                @throw [NSException exceptionWithName:@"OutOfMemoryException" reason:@"malloc failed" userInfo:nil];
            }
            data = [[NSData alloc] initWithBytesNoCopy:mallocPtr length:(12 + protocolMsg._jsonSize)];
        }
        FMCBinaryFrameHeader* binFrameHeader = [[FMCBinaryFrameHeader alloc] init];
        binFrameHeader._rpcType = protocolMsg._rpcType;
        binFrameHeader._functionID = protocolMsg._functionID;
        binFrameHeader._correlationID = protocolMsg._correlationID;
        binFrameHeader._jsonSize = protocolMsg._jsonSize;
        
        memcpy((void*)data.bytes, [binFrameHeader assembleHeaderBytes].bytes, 12);
        memcpy((void*)data.bytes + 12, protocolMsg._data.bytes, protocolMsg._jsonSize);
        
        if (protocolMsg._bulkData != nil) {
            memcpy((void*)data.bytes + 12 + protocolMsg._jsonSize, protocolMsg._bulkData.bytes, protocolMsg._bulkData.length);
        }
        protocolMsg._data = data;
    }
    
    int maxDataSize;
    if (_version == 1) {
        maxDataSize = MTU_SIZE - HEADER_BUF_LENGTH;
    } else {
        maxDataSize = MTU_SIZE - PROT2_HEADER_BUF_LENGTH;
    }
	
	@synchronized (msgLock) {
        if (protocolMsg._data.length < maxDataSize) {
            
            _messageID++;
            FMCProtocolFrameHeader *singleHeader = [FMCProtocolFrameHeaderFactory singleFrameWithSessionType:sessionType sessionID:sessionID dataSize:protocolMsg._data.length messageID:_messageID version:_version];
            
            [self sendFrameToTransport:singleHeader withData:protocolMsg._data];
        } else {
            _messageID++;
            FMCProtocolFrameHeader *firstHeader = [FMCProtocolFrameHeaderFactory firstFrameWithSessionType:sessionType sessionID:sessionID messageID:_messageID version:_version];
            
            // Assemble first frame.
            int frameCount = protocolMsg._data.length / maxDataSize;
            if (protocolMsg._data.length % maxDataSize > 0) {
                frameCount++;
            }
            NSMutableData *firstFrameData = [NSMutableData dataWithCapacity:8];
            // First four bytes are data size.
            [firstFrameData appendData:[FMCBitConverter intToByteArray:protocolMsg._data.length]];
            // Second four bytes are frame count.
            [firstFrameData appendData:[FMCBitConverter intToByteArray:frameCount]];
            
            [self sendFrameToTransport:firstHeader withData:firstFrameData];
            
            int currentOffset = 0;
            
            for (int i = 0; i < frameCount; i++) {
                int bytesToWrite = protocolMsg._data.length - currentOffset;
                if (bytesToWrite > maxDataSize) { bytesToWrite = maxDataSize
                    ; }
                FMCProtocolFrameHeader *consecHeader = [FMCProtocolFrameHeaderFactory consecutiveFrameWithSessionType:sessionType sessionID:sessionID dataSize:bytesToWrite messageID:_messageID version:_version];
                [self sendFrameToTransport:consecHeader withData:protocolMsg._data offset:currentOffset length:bytesToWrite];
                currentOffset += bytesToWrite;
                
            }
        }
		
	}
}

-(void) sendStartSessionWithType:(FMCSessionType) sessionType {
    //TODO:DEBUGOUTS
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"consoleLog" object:@"StartSession (request)"]];
    [FMCDebugTool logInfo:@"StartSession (request)"];
    //TODO:ENDDEBUGOUTS
    
    FMCProtocolFrameHeader *header = [FMCProtocolFrameHeaderFactory startSessionWithSessionType:sessionType messageID:0x00 version:_version];
	
	@synchronized (msgLock) {
		[self sendFrameToTransport:header];
	}
}

-(void) sendEndSessionWithType:(FMCSessionType)sessionType sessionID:(Byte)sessionID {
	FMCProtocolFrameHeader *header = [FMCProtocolFrameHeaderFactory endSessionWithSessionType:sessionType sessionID:sessionID messageID:0x00 version:_version];
	@synchronized (msgLock) {
		[self sendFrameToTransport:header];
	}
}


-(void) dealloc {

    [headerBuf release];
    headerBuf = nil;

    [dataBuf release];
    dataBuf = nil;

    [currentHeader release];
    currentHeader = nil;

    [frameAssemblerForSessionID release];
    frameAssemblerForSessionID = nil;

    [msgLock release];
    msgLock = nil;
	
	[super dealloc];
}

@end

@implementation FrameAssembler

-(id) initWithListeners:(NSArray*)theListeners{
	if (self = [super init]) {
		listeners = [theListeners retain];
	}
	return self;
}

-(void) handleFirstFrame:(FMCProtocolFrameHeader*) header data:(NSData*) data {
	//The message is new, so let's figure out how big it is.
	hasFirstFrame = true;
	totalSize = [FMCBitConverter intFromByteArray:(Byte*)data.bytes offset:0] - 8;
	framesRemaining = [FMCBitConverter intFromByteArray:(Byte*)data.bytes offset:4];
    
    [accumulator release];
    accumulator = nil;
    
	accumulator = [[NSMutableData dataWithCapacity:totalSize] retain];
	
}

-(void) handleSecondFrame:(FMCProtocolFrameHeader*) header data:(NSData*) data {
	[self handleRemainingFrame:header data:data];
}

-(void) handleRemainingFrame:(FMCProtocolFrameHeader*) header data:(NSData*) data {
	[accumulator appendData:data];
	[self notifyIfFinished:header];
	
}

-(void) notifyIfFinished:(FMCProtocolFrameHeader*) header {
	if (framesRemaining == 0) {
		FMCProtocolMessage * message = [[FMCProtocolMessage alloc] init];
        if (header._sessionType == FMCSessionType_RPC) {
            message._messageType = FMCMessageType_RPC;
        } else if (header._sessionType == FMCSessionType_BulkData) {
            message._messageType = FMCMessageType_BULK;
        } // end-if
		message._sessionType = header._sessionType;
		message._sessionID = header._sessionID;
        
        if (_version == 2) {
            FMCBinaryFrameHeader* binFrameHeader = [FMCBinaryFrameHeader parseBinaryHeader:accumulator];
            message._version = _version;
            message._rpcType = binFrameHeader._rpcType;
            message._functionID = binFrameHeader._functionID;
            message._jsonSize = binFrameHeader._jsonSize;
            message._correlationID = binFrameHeader._correlationID;
            if (binFrameHeader._jsonSize > 0) {
                message._data = binFrameHeader._jsonData;
            }
            if (binFrameHeader._bulkData != nil) {
                message._bulkData = binFrameHeader._bulkData;
            }
        } else {
            message._data = accumulator;
        }
		
		NSArray* localListeners = nil;
		@synchronized (listeners) {
			localListeners = [listeners copy];
		}
			
		for (NSObject<FMCProtocolListener> *listener in localListeners) {
			[listener onProtocolMessageReceived:message];
		}
		[localListeners release];
        
        [message release];
		
		hasFirstFrame = false;
		hasSecondFrame = false;

        [accumulator release];
        accumulator = nil;

	}
}

-(void) handleMultiFrame:(FMCProtocolFrameHeader*) header data:(NSData*) data {
	if (!hasFirstFrame) {
		hasFirstFrame = true;
		[self handleFirstFrame:header data:data];
	} else if (!hasSecondFrame) {
		hasSecondFrame = true;
		framesRemaining--;
		[self handleSecondFrame:header data:data ];
	} else {
		framesRemaining--;
		[self handleRemainingFrame:header data:data];
	}
	
}

-(void) handleFrame:(FMCProtocolFrameHeader*) header data:(NSData*) data {
    if (header._version == 2) {
        _version = header._version;
    }
    
    if (header._frameType == FMFrameType_Control) {
        if (header._frameData == FMFrameData_StartSessionACK) {
            if (_version == 2) {
                _hashID = header._messageID;
            }
            NSArray* localListeners = nil;
            @synchronized (listeners) {
                localListeners = [listeners copy];
            }
            
            for (NSObject<FMCProtocolListener> *listener in localListeners) {
                [listener handleProtocolSessionStarted:header._sessionType sessionID:header._sessionID version:_version];
            }
            [localListeners release];
        }
    } else {
        if (header._frameType == FMFrameType_First || header._frameType == FMFrameType_Consecutive) {
            [self handleMultiFrame:header data:data];
        } else {
            FMCProtocolMessage * message = [[FMCProtocolMessage alloc] init];
            if (header._sessionType == FMCSessionType_RPC) {
                message._messageType = FMCMessageType_RPC;
            } else if (header._sessionType == FMCSessionType_BulkData) {
                message._messageType = FMCMessageType_BULK;
            } // end-if
            message._sessionType = header._sessionType;
            message._sessionID = header._sessionID;
            if (_version == 2) {
                FMCBinaryFrameHeader* binFrameHeader = [FMCBinaryFrameHeader parseBinaryHeader:data];
                message._version = _version;
                message._rpcType = binFrameHeader._rpcType;
                message._functionID = binFrameHeader._functionID;
                message._jsonSize = binFrameHeader._jsonSize;
                message._correlationID = binFrameHeader._correlationID;
                if (binFrameHeader._jsonSize > 0) {
                    message._data = binFrameHeader._jsonData;
                }
                if (binFrameHeader._bulkData != nil) {
                    message._bulkData = binFrameHeader._bulkData;
                }
            } else {
                message._data = data;
            }
            
            NSArray* localListeners = nil;
            @synchronized (listeners) {
                localListeners = [listeners copy];
            }
            
            for (NSObject<FMCProtocolListener> *listener in localListeners) {
                [listener onProtocolMessageReceived:message];
            }
            [localListeners release];
            
            [message release];
        }
    }
}

//FIXME

/*
-(FMMessageType) messageTypeForFrameHeader:(FMCProtocolFrameHeader*)header {
	if (header.frameType == FMFrameType_Control) {
		if (header.frameData == FMFrameData_StartSession) {
			return FMMessageType_StartSession;
		} else if (header.frameData == FMFrameData_StartSessionACK) {
			return FMMessageType_StartSessionACK;
		} else if (header.frameData == FMFrameData_StartSessionNACK) {
			return FMMessageType_StartSessionNACK;
		} else {
            //if (frameData == FrameData.EndSession.value())
			return FMMessageType_EndSession;
		}
	} else {
		return FMMessageType_Data;
	}
}
*/

-(void) dealloc {

    [accumulator release];
    accumulator = nil;
    
    [listeners release];
    listeners = nil;
    
    [super dealloc];
}

@end

@implementation BulkAssembler

-(void) handleSecondFrame:(FMCProtocolFrameHeader*) header data:(NSData*) data {
	bulkCorrId = [FMCBitConverter intFromByteArray:(Byte*)data.bytes offset:4];
	[accumulator appendBytes:data.bytes + 8 length:header._dataSize - 8];
	[self notifyIfFinished:header];
}

@end


