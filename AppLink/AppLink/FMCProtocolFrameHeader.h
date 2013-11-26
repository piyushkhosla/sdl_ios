//  FMCProtocolFrameHeader.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>

typedef enum FMCFrameType {
	FMFrameType_Control = 0x00,
	FMFrameType_Single = 0x01,
	FMFrameType_First = 0x02,
	FMFrameType_Consecutive = 0x03,
	
} FMCFrameType;

typedef enum FMCSessionType {
	FMCSessionType_RPC = 0x7,
	FMCSessionType_BulkData = 0xF,
} FMCSessionType;

typedef enum FMCFrameData {
	FMFrameData_Heartbeat = 0x00,
	FMFrameData_StartSession = 0x01,
	FMFrameData_StartSessionACK = 0x02,
	FMFrameData_StartSessionNACK = 0x03,
	FMFrameData_EndSession = 0x04,
	
	FMFrameData_SingleFrame = 0x00,
	FMFrameData_FirstFrame = 0x00,
} FMCFrameData;

@interface FMCProtocolFrameHeader : NSObject {
	Byte _version;
	BOOL _compressed;
	FMCFrameType _frameType;
	FMCSessionType _sessionType;
	Byte _frameData;
	Byte _sessionID;
	UInt32 _dataSize;
    UInt32 _messageID;
}

@property(assign) Byte _version;
@property(assign) BOOL _compressed;
@property(assign) FMCFrameType _frameType;
@property(assign) FMCSessionType _sessionType;
@property(assign) Byte _frameData;
@property(assign) Byte _sessionID;
@property(assign) UInt32 _dataSize;
@property(assign) UInt32 _messageID;

@end