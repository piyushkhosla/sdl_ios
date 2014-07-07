//  FMCDebugTool.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/Debug/FMCDebugToolConsole.h>

typedef NS_ENUM(UInt8, FMCDebugType) {
	FMCDebugType_Debug = 0,
	FMCDebugType_Transport_iAP = 1,
    FMCDebugType_Transport_TCP = 2,
	FMCDebugType_Protocol = 3,
	FMCDebugType_RPC = 4
};

typedef NS_ENUM(UInt8, FMCDebugOutputType) {
    FMCDebugOutput_DeviceConsole = 0,
	FMCDebugOutput_DebugConsole = 1,
    FMCDebugOutput_All = 2
};

@interface FMCDebugTool : NSObject {}

+(void) addConsole:(NSObject<FMCDebugToolConsole>*) aConsole;
+(void) removeConsole:(NSObject<FMCDebugToolConsole>*) aConsole;

+(void) logInfo:(NSString *)fmt, ... ;
+(void) logInfo:(NSString *)info withType:(FMCDebugType)debugType;
+(void) logInfo:(NSString *)info withType:(FMCDebugType)debugType toOutput:(FMCDebugOutputType)outputType;

+(void) logException:(NSException*) ex withMessage:(NSString*) fmt, ... ;

+(NSString *) stringForDebugType:(FMCDebugType) debugType;

@end
