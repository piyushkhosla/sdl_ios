//  FMCDebugTool.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>

@class FMCRPCMessage;

@protocol FMCDebugToolConsole

-(void) logInfo:(NSString*) info;
-(void) logException:(NSException*) ex withMessage:(NSString*) message;
-(void) logMessage:(FMCRPCMessage*) message;

@end


typedef NS_ENUM(UInt8, FMCDebugType) {
	FMCDebugType_Debug = 0,
	FMCDebugType_Transport_iAP = 1,
    FMCDebugType_Transport_TCP = 2,
	FMCDebugType_Protocol = 3,
	FMCDebugType_RPC = 4
};

typedef NS_ENUM(UInt8, FMCDebugOutput) {
    FMCDebugOutput_All = 0,
    FMCDebugOutput_DeviceConsole = 1,
	FMCDebugOutput_DebugToolConsole = 2
};




@interface FMCDebugTool : NSObject {}

+(void) addConsole:(NSObject<FMCDebugToolConsole>*) console;
+(void) removeConsole:(NSObject<FMCDebugToolConsole>*) console;

+(void) logInfo:(NSString *)fmt, ... ; 
+(void) logInfo:(NSString *)info withType:(FMCDebugType)type;
+(void) logInfo:(NSString *)info withType:(FMCDebugType)type toOutput:(FMCDebugOutput)output;

+(void) logException:(NSException*) ex withMessage:(NSString*) fmt, ... ;

+(void) logMessage:(FMCRPCMessage*) rpcMessage;

+(NSString *) stringForDebugType:(FMCDebugType) type;

+(void) enableDebugToLogFile;
+(void) disableDebugToLogFile;

+ (void)rawTransportData:(const void*) msgBytes msgBytesLength:(int) msgBytesLength direction:(NSString *)direction;

+(void) writeToLogFile:(const void*) dataBytes msgBytesLength:(int) dataBytesLength prepend:(NSString *)prepend;

@end
