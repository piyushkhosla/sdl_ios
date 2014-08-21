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
    FMCDebugOutput_All = 0xFF,
    FMCDebugOutput_DeviceConsole = 1,
	FMCDebugOutput_DebugToolConsole = 2,
	FMCDebugOutput_File = 4
};




@interface FMCDebugTool : NSObject {}

+ (void)addConsole:(NSObject<FMCDebugToolConsole>*) console;
+ (void)removeConsole:(NSObject<FMCDebugToolConsole>*) console;

+ (void)logInfo:(NSString *)fmt, ... ;
+ (void)logInfo:(NSString *)info withType:(FMCDebugType)type;
+ (void)logInfo:(NSString *)info withType:(FMCDebugType)type toOutput:(FMCDebugOutput)output;
+ (void)logInfo:(NSString *)info andBinaryData:(NSData *)data withType:(FMCDebugType)type toOutput:(FMCDebugOutput)output;
+ (void)logException:(NSException*) ex withMessage:(NSString*) fmt, ... ;
+ (void)logMessage:(FMCRPCMessage*) rpcMessage;

+ (void)enableDebugToLogFile;
+ (void)disableDebugToLogFile;
+ (void)writeToLogFile:(NSString *)info;

+ (NSString *)stringForDebugType:(FMCDebugType) type;


@end
