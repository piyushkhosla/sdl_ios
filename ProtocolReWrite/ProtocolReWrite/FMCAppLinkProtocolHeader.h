//
//  NewFMCAppLinkProtocolHeader.h
//  ProtocolReWrite
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(UInt8, FMCFrameType) {
	FMCFrameType_Control = 0,
	FMCFrameType_Single = 1,
	FMCFrameType_First = 2,
	FMCFrameType_Consecutive = 3
};

typedef NS_ENUM(UInt8, FMCServiceType) {
	FMCServiceType_RPC = 7,
	FMCServiceType_BulkData = 0xF,
};

typedef NS_ENUM(UInt8, FMCFrameData) {
	FMCFrameData_Heartbeat = 0,
	FMCFrameData_StartSession = 1,
	FMCFrameData_StartSessionACK = 2,
	FMCFrameData_StartSessionNACK = 3,
	FMCFrameData_EndSession = 4,
	FMCFrameData_SingleFrame = 0,
	FMCFrameData_FirstFrame = 0,
    FMCFrameData_ConsecutiveLastFrame = 0
};


@interface FMCAppLinkProtocolHeader : NSObject <NSCopying> {
    UInt8 _version;
    NSUInteger _size;
}

@property (assign, readonly) UInt8 version;
@property (assign, readonly) NSUInteger size;
@property (assign) BOOL compressed;
@property (assign) FMCFrameType frameType;
@property (assign) FMCServiceType serviceType;
@property (assign) FMCFrameData frameData;
@property (assign) UInt8 sessionID;
@property (assign) UInt32 bytesInPayload;

- (id)init;
- (id)copyWithZone:(NSZone *)zone;
- (NSData *)data;
- (void)parse:(NSData *)data;
+ (FMCAppLinkProtocolHeader *)headerForVersion:(UInt8)version;

@end
