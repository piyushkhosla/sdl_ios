//  FMCDebugTool.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCDebugTool.h>

#import <AppLink/FMCSiphonServer.h>

#define LOG_INFO_ENABLED
#define LOG_ERROR_ENABLED

//From .h
//+(void) logInfo:(NSString*) fmt, ... ; // NS_FORMAT_FUNCTION(1,2);
//+(void) logException:(NSException*) ex withMessage:(NSString*) fmt, ... ; // NS_FORMAT_FUNCTION(2,3);

static NSMutableArray* debugToolConsoleList = nil;

@implementation FMCDebugTool

+(NSMutableArray*) getConsoleList {
	if (debugToolConsoleList == nil) {
		debugToolConsoleList = [[NSMutableArray alloc] initWithCapacity:2];
	}
	return debugToolConsoleList;
}


+(void) addConsole:(NSObject<FMCDebugToolConsole>*) aConsole {
	[[FMCDebugTool getConsoleList] addObject:aConsole];
}

+(void) removeConsole:(NSObject<FMCDebugToolConsole>*) aConsole {
	[[FMCDebugTool getConsoleList] removeObject:aConsole];
}

+(void) logInfo:(NSString*) fmt, ... {
	NSString* toOutRaw = nil;
    //NSLog(@"FMCDebugTool, fmt = %@", fmt);
	
    va_list args;
    va_start(args, fmt);
        
    toOutRaw = [[NSString alloc] initWithFormat:fmt arguments:args];
    
    //NSMutableString *toOut = [[NSMutableString alloc] initWithFormat:@"%@: ", VERSION_STRING];
    NSMutableString *toOut = [[NSMutableString alloc] initWithString:@"FMCDebugTool: "];
    [toOut appendString:toOutRaw];
    
    [toOutRaw release];
    
	va_end(args);
	
    [FMCSiphonServer init];
    bool dataLogged = [FMCSiphonServer _siphonNSLogData:toOut];
    
    
#ifdef LOG_INFO_ENABLED
    if(!dataLogged){
        NSLog(@"%@", toOut);
    }
#endif
    
	for (NSObject<FMCDebugToolConsole>* console in debugToolConsoleList) {
		[console logInfo:toOut];
	}
    
    [toOut release];
}

+(void) logException:(NSException*) ex withMessage:(NSString*) fmt, ...  {
	NSString* toOutRaw = nil;
	
	va_list args;
	va_start(args, fmt);

    toOutRaw = [[NSString alloc] initWithFormat:fmt arguments:args];
    
//    NSMutableString *toOut = [[NSMutableString alloc] initWithFormat:@"%@: ", VERSION_STRING];
    NSMutableString *toOut = [[NSMutableString alloc] initWithString:@"FMCDebugTool: "];
    [toOut appendString:toOutRaw];
    
    [toOutRaw release];
    
    va_end(args);
    
    [FMCSiphonServer init];
    bool dataLogged = [FMCSiphonServer _siphonNSLogData:toOut];
    if (dataLogged) {
        dataLogged = [FMCSiphonServer _siphonNSLogData:[ex reason]];
    } // end-if
    
	
#ifdef LOG_ERROR_ENABLED
	if (!dataLogged) {
        NSLog(@"%@: %@", toOut, ex);
    }
#endif
	
	for (NSObject<FMCDebugToolConsole>* console in debugToolConsoleList) {
		[console logException:ex withMessage:toOut];
	}
    
    [toOut release];
}

@end
