//  FMCProtocolFrameHeader.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCProtocolMessage.h>

@implementation FMCProtocolFrameHeader

@synthesize _version;
@synthesize _compressed;
@synthesize _frameType;
@synthesize _sessionType;
@synthesize _frameData;
@synthesize _sessionID;
@synthesize _dataSize;
@synthesize _messageID;


-(id) init {
	if (self = [super init]) {
		_version = 1;
		_compressed = false;
		_frameType = FMCFrameType_Control;
		_sessionType = FMCSessionType_RPC;
		_frameData = 0;
		_sessionID = 0;
		_dataSize = 0;
        _messageID = 0;
	}
	return self;
}
				
@end
