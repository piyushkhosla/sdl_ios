//  FMCDebugTool.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCDebugTool.h>
#import <AppLink/FMCRPCMessage.h>
#import <AppLink/FMCSiphonServer.h>
#import "FMCHexUtility.h"

#define LOG_ERROR_ENABLED

static NSMutableArray* debugToolConsoleList = nil;
bool debugToLogFile = false;

@implementation FMCDebugTool

+(NSMutableArray*) getConsoleList {
	if (debugToolConsoleList == nil) {
		debugToolConsoleList = [[NSMutableArray alloc] initWithCapacity:2];
	}
	return debugToolConsoleList;
}


#pragma mark -
#pragma mark Debug Console Management

+(void) addConsole:(NSObject<FMCDebugToolConsole>*) console {
	[[FMCDebugTool getConsoleList] addObject:console];
}

+(void) removeConsole:(NSObject<FMCDebugToolConsole>*) console {
	[[FMCDebugTool getConsoleList] removeObject:console];
}


#pragma mark -
#pragma mark logInfo

+(void) logInfo:(NSString*) fmt, ... {
    
    NSString* toOutRaw = nil;
	
	va_list args;
	va_start(args, fmt);
    
    toOutRaw = [[NSString alloc] initWithFormat:fmt arguments:args];
    
    va_end(args);
    
    [self logInfo:toOutRaw withType:FMCDebugType_Debug toOutput:FMCDebugOutput_DeviceConsole];
}

+(void) logInfo:(NSString *)info withType:(FMCDebugType)debugType{
    
    [self logInfo:info withType:debugType toOutput:FMCDebugOutput_All];
    
}

+ (void)logInfo:(NSString *)info andBinaryData:(NSData *)data withType:(FMCDebugType)type toOutput:(FMCDebugOutput)output {

    // convert binary data to string, append the two strings, then pass to usual log method.
    NSMutableString *outputString = [[NSMutableString alloc] init];
    if (info) {
        [outputString appendString:info];
    }

    if (data) {
        NSString *dataString = [FMCHexUtility getHexString:data];
        if (dataString) {
            [outputString appendString:dataString];
        }
    }

    [FMCDebugTool logInfo:outputString withType:type toOutput:output];
}

+ (void)logInfo:(NSString *)info withType:(FMCDebugType)type toOutput:(FMCDebugOutput)output {

    // Start string with it's type:"iAP", "TCP" etc, leave empty if Debug
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:5];
    if (type != FMCDebugType_Debug) {
        outputString = [NSMutableString  stringWithFormat:@"[%@] ", [FMCDebugTool stringForDebugType:type]];
    }

    // Append the actual message.
    [outputString appendString:info];
   

    //Output To DeviceConsole
    if (output & FMCDebugOutput_DeviceConsole) {
        NSLog(@"%@", outputString);
    }
    
    //Output To DebugToolConsoles
    if (output & FMCDebugOutput_DebugToolConsole) {
        for (NSObject<FMCDebugToolConsole>* console in debugToolConsoleList) {
            [console logInfo:outputString];
        }
    }
    
    //Output To LogFile
    if (output & FMCDebugOutput_File) {
        [FMCDebugTool writeToLogFile:outputString];
    }

    //Output To Siphon
    [FMCSiphonServer init];
    [FMCSiphonServer _siphonNSLogData:outputString];
}


#pragma mark -
#pragma mark logException

+(void) logException:(NSException*) ex withMessage:(NSString*) fmt, ...  {
	NSString* toOutRaw = nil;
	
	va_list args;
	va_start(args, fmt);

    toOutRaw = [[NSString alloc] initWithFormat:fmt arguments:args];
    
    NSMutableString *toOut = [[NSMutableString alloc] initWithString:@"FMCDebugTool: "];
    [toOut appendString:toOutRaw];
    
    va_end(args);
    
    [FMCSiphonServer init];
    bool dataLogged = [FMCSiphonServer _siphonNSLogData:toOut];
    if (dataLogged) {
        dataLogged = [FMCSiphonServer _siphonNSLogData:[ex reason]];
    }
    
	
#ifdef LOG_ERROR_ENABLED
	if (!dataLogged) {
        NSLog(@"%@: %@", toOut, ex);
    }
#endif
	
	for (NSObject<FMCDebugToolConsole>* console in debugToolConsoleList) {
		[console logException:ex withMessage:toOut];
	}
    
}


#pragma mark -
#pragma mark logMessage

+(void) logMessage:(FMCRPCMessage*) rpcMessage {
    
	if ([rpcMessage isKindOfClass:FMCRPCMessage.class]) {
        
        NSMutableString *toOut = [[NSMutableString alloc] initWithCapacity:5];
        
        toOut = [NSMutableString stringWithFormat:@"New: %@", [rpcMessage getFunctionName]];
        
        //TODO: Output is only Function Name, Parse rpcMessage object like in FMCConsoleController
        //Output DeviceConsole
        NSLog(@"%@", toOut);
        
        
        //Output DebugToolConsole
        for (NSObject<FMCDebugToolConsole>* console in debugToolConsoleList) {
            [console logMessage:rpcMessage];
        }
        
        //TODO: Output is only Function Name, Parse rpcMessage object like in FMCConsoleController
        //Output Siphon
        [FMCSiphonServer init];
        [FMCSiphonServer _siphonNSLogData:toOut];

	}
}

+ (void)enableDebugToLogFile{
    debugToLogFile = true;
    
    [FMCDebugTool logInfo:@"[Debug] Log File Enabled" withType:FMCDebugType_Debug];
    
    //Delete Log File If It Exists
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"applink.log"];

    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]) {
        [FMCDebugTool logInfo:@"[Debug] Log File Exisits, Deleteing" withType:FMCDebugType_Debug];
        [manager removeItemAtPath:filePath error:nil];
    }
    
}

+ (void)disableDebugToLogFile {
    debugToLogFile = false;
}

+ (void)writeToLogFile:(NSString *)info {

    // Warning: do not call any logInfo method from here. recursion of death.

    if (!debugToLogFile || info == NULL || info.length == 0) {
        return;
    }

    // Create timestamp string, add it in front of the message to be logged
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM/dd/YY HH:mm:ss.SSS"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    NSString *outputString = [dateString stringByAppendingFormat:@": %@\n", info ];
    
    // file write takes an NSData, so convert string to data.
    NSData *dataToLog = [outputString dataUsingEncoding:NSUTF8StringEncoding];

    // If open/create file and write
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"applink.log"];

    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    if (fileHandle){
        [fileHandle seekToEndOfFile];
        [fileHandle writeData:dataToLog];
        [fileHandle closeFile];
    }
    else {
        [dataToLog writeToFile:filePath atomically:NO];
    }

}


#pragma mark -
#pragma mark Helper Methods

+(NSString *) stringForDebugType:(FMCDebugType) debugType{
    
    switch (debugType) {
        case FMCDebugType_Debug:
            return @"App Debug";
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
