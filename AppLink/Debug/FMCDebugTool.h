//  FMCDebugTool.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/Debug/FMCDebugToolConsole.h>

@interface FMCDebugTool : NSObject {}

+(void) addConsole:(NSObject<FMCDebugToolConsole>*) aConsole;
+(void) removeConsole:(NSObject<FMCDebugToolConsole>*) aConsole;
+(void) logInfo:(NSString*) fmt, ... ;
+(void) logException:(NSException*) ex withMessage:(NSString*) fmt, ... ;

@end
