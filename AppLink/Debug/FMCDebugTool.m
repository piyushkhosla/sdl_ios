//  FMCDebugTool.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/Debug/FMCDebugTool.h>

#import <AppLink/Debug/FMCSiphonServer.h>

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
	
	va_list args;
	va_start(args, fmt);
    
    toOutRaw = [[NSString alloc] initWithFormat:fmt arguments:args];
    
    va_end(args);
    
    [self logType:FMCDebugType_Debug usingOutput:FMCDebugOutput_DeviceConsole withInfo:toOutRaw];
    [toOutRaw release];
}

+(void) logType:(FMCDebugType)debugType withInfo:(NSString*) info{
    
    [self logType:debugType usingOutput:FMCDebugOutput_All withInfo:info];
    
}

+(void) logType:(FMCDebugType)debugType usingOutput:(FMCDebugOutputType)outputType withInfo:(NSString*) info {
	NSString* toOutRaw = nil;
    //NSLog(@"FMCDebugTool, fmt = %@", fmt);
    
    toOutRaw = [[NSString alloc] initWithString:info];
    
    //NSMutableString *toOut = [[NSMutableString alloc] initWithFormat:@"%@: ", VERSION_STRING];
//    NSMutableString *toOut = [[NSMutableString alloc] initWithString:@"FMCDebugTool: "];
    NSMutableString *toOut = [[NSMutableString alloc] initWithFormat:@"AppLink (%@): ", [FMCDebugTool stringForDebugType:debugType]];
    
    [toOut appendString:toOutRaw];
    
    [toOutRaw release];
	
    [FMCSiphonServer init];
    [FMCSiphonServer _siphonNSLogData:toOut];
    
    if (outputType == FMCDebugOutput_All || outputType == FMCDebugOutput_DeviceConsole) {
        NSLog(@"%@", toOut);
    }
    
    if (outputType == FMCDebugOutput_All || outputType == FMCDebugOutput_DebugConsole) {
        for (NSObject<FMCDebugToolConsole>* console in debugToolConsoleList) {
            [console logInfo:toOut];
        }
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




+(NSString *) stringForDebugType:(FMCDebugType) debugType{
    
    switch (debugType) {
        case FMCDebugType_Debug:
            return @"Debug";
            break;
        case FMCDebugType_Transport_iAP:
            return @"iAP";
            break;
        case FMCDebugType_Transport_TCP:
            return @"TCP";
            break;
        case FMCDebugType_Protocol:
            return @"Protocol";
            break;
        case FMCDebugType_RPC:
            return @"RPC";
            break;
            
        default:
            return @"Invalid DebugType";
            break;
    }
    
}

@end
