//  FMCProtocolFrameHeaderFactory.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCProtocolFrameHeaderFactory.h>

#import <AppLink/FMCBitConverter.h>

@implementation FMCProtocolFrameHeaderFactory

+(FMCProtocolFrameHeader*) parseHeader:(NSData*) header {
	FMCProtocolFrameHeader* msg = [[[FMCProtocolFrameHeader alloc] init] autorelease];
	
	Byte version = (Byte)(((Byte*)header.bytes)[0] >> 4);
	BOOL compressed = (1 == ((((Byte*)header.bytes)[0] & 0x08) >> 3));
	Byte frameType = (Byte)(((Byte*)header.bytes)[0] & 0x07);
	Byte sessionType = ((Byte*)header.bytes)[1];
	Byte frameData = ((Byte*)header.bytes)[2];
	Byte sessionID = ((Byte*)header.bytes)[3];
	UInt32 dataSize = [FMCBitConverter intFromByteArray:((Byte*)header.bytes) offset:4];
    
    if (version == 2) {
        UInt32 messageID = [FMCBitConverter intFromByteArray:((Byte*)header.bytes) offset:8];
        msg._messageID = messageID;
    } else {
        msg._messageID = 0;
    }
	
	msg._version = version;
	msg._compressed = compressed;
	msg._frameType = frameType;
	msg._sessionType = sessionType;
	msg._frameData = frameData;
	msg._sessionID = sessionID;
	msg._dataSize = dataSize;
	
	return msg;
}

+(FMCProtocolFrameHeader*) startSessionWithSessionType:(FMCSessionType) sessionType messageID:(UInt32)messageID version:(Byte)version {
	FMCProtocolFrameHeader* header = [[[FMCProtocolFrameHeader alloc] init] autorelease];
    header._version = version;
	header._frameType = FMCFrameType_Control;
	header._sessionType = sessionType;
	header._frameData = FMCFrameData_StartSession;
    header._messageID = messageID;
	
	return header;
}


+(FMCProtocolFrameHeader*) endSessionWithSessionType:(FMCSessionType)sessionType sessionID:(Byte)sessionID messageID:(UInt32)messageID version:(Byte)version {
	FMCProtocolFrameHeader* header = [[[FMCProtocolFrameHeader alloc] init] autorelease];
    header._version = version;
	header._frameType = FMCFrameType_Control;
	header._sessionType = sessionType;
	header._sessionID = sessionID;
	header._frameData = FMCFrameData_EndSession;
    header._messageID = messageID;

	return header;
}
+(FMCProtocolFrameHeader*) singleFrameWithSessionType:(FMCSessionType) sessionType sessionID:(Byte) sessionID dataSize:(NSInteger) dataSize messageID:(UInt32)messageID version:(Byte)version {
	FMCProtocolFrameHeader* header = [[[FMCProtocolFrameHeader alloc] init] autorelease];
    header._version = version;
	header._sessionType = sessionType;
	header._sessionID = sessionID;
	header._frameType = FMCFrameType_Single;
	header._dataSize = dataSize;
    header._messageID = messageID;
	
	return header;
}

+(FMCProtocolFrameHeader*) firstFrameWithSessionType:(FMCSessionType) sessionType sessionID:(Byte) sessionID messageID:(UInt32)messageID version:(Byte)version {
	FMCProtocolFrameHeader* header = [[[FMCProtocolFrameHeader alloc] init] autorelease];
    header._version = version;
	header._sessionType = sessionType;
	header._sessionID = sessionID;
	header._frameType = FMCFrameType_First;
	header._dataSize = 8;
    header._messageID = messageID;
	
	return header;
}

+(FMCProtocolFrameHeader*) consecutiveFrameWithSessionType:(FMCSessionType) sessionType sessionID:(Byte) sessionID dataSize:(NSInteger) dataSize messageID:(UInt32)messageID version:(Byte)version {
	FMCProtocolFrameHeader* header = [[[FMCProtocolFrameHeader alloc] init] autorelease];
    header._version = version;
	header._sessionType = sessionType;
	header._sessionID = sessionID;
	header._frameType = FMCFrameType_Consecutive;
	header._dataSize = dataSize;
    header._messageID = messageID;
	
	return header;
}

@end
