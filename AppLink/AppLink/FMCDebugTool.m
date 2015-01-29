//  FMCDebugTool.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCDebugTool.h>
#import <AppLink/FMCRPCMessage.h>
#import <AppLink/FMCSiphonServer.h>
#import "FMCHexUtility.h"
#import "NSThread+ThreadIndex.h"

#define LOG_ERROR_ENABLED

static NSMutableDictionary* namedConsoleSets = nil;

bool debugToLogFile = false;

@implementation FMCDebugTool


#pragma mark - Console Management
+ (void)addConsole:(NSObject<FMCDebugToolConsole> *)console {
	[self addConsole:console toGroup:@"default"];
}

+ (void)addConsole:(NSObject<FMCDebugToolConsole> *)console toGroup:(NSString *)groupName {
    // Make sure master dictionary exists
    if (namedConsoleSets == nil) {
        namedConsoleSets = [NSMutableDictionary new];
    }

    // Make sure the set to contain this group's elements exists
    if ([namedConsoleSets objectForKey:groupName] == nil) {
        [namedConsoleSets setValue:[NSMutableSet new] forKey:groupName];
    }

    // Add the console to the set
    [[namedConsoleSets valueForKey:groupName] addObject:console];

}

+ (void)removeConsole:(NSObject<FMCDebugToolConsole> *)console {
	[self removeConsole:console fromGroup:@"default"];
}

+ (void)removeConsole:(NSObject<FMCDebugToolConsole> *)console fromGroup:(NSString *)groupName {
    [[FMCDebugTool getConsoleListenersForGroup:groupName] removeObject:console];
}

+ (NSMutableSet*)getConsoleListenersForGroup:(NSString *)groupName {
	return [namedConsoleSets valueForKey:groupName];
}


#pragma mark - logging
// TODO: Can we get rid of the "toGroup" stuff and merge it with the "toOutput" system?

+ (void)logInfo:(NSString *)info {
    [self logInfo:info withType:FMCDebugType_Debug toOutput:FMCDebugOutput_All toGroup:@"default"];
}

+ (void)logInfo:(NSString *)info withType:(FMCDebugType)type {
    [self logInfo:info withType:type toOutput:FMCDebugOutput_All toGroup:@"default"];
}

+ (void)logInfo:(NSString *)info withType:(FMCDebugType)type toOutput:(FMCDebugOutput)output {
    [FMCDebugTool logInfo:info withType:type toOutput:output toGroup:@"default"];
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

    [FMCDebugTool logInfo:outputString withType:type toOutput:output toGroup:@"default"];
}

// The designated logInfo method. All outputs should be performed here.
+ (void)logInfo:(NSString *)info withType:(FMCDebugType)type toOutput:(FMCDebugOutput)output toGroup:(NSString *)consoleGroupName {

    // Format the message, prepend the thread id
    NSMutableString *outputString = [NSMutableString  stringWithFormat:@"[%li] %@", (long)[[NSThread currentThread] threadIndex] , info];


    ////////////////////////////////////////////////
    //
    //  Output to the various destinations
    //
    ////////////////////////////////////////////////

    //Output To DeviceConsole
    if (output & FMCDebugOutput_DeviceConsole) {
        NSLog(@"%@", outputString);
    }

    //Output To DebugToolConsoles
    if (output & FMCDebugOutput_DebugToolConsole) {
        NSSet *consoleListeners = [self getConsoleListenersForGroup:consoleGroupName];
        for (NSObject<FMCDebugToolConsole>* console in consoleListeners) {
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


#pragma mark - file handling
+ (void)enableDebugToLogFile{
    debugToLogFile = true;
    
    [FMCDebugTool logInfo:@"Log File Enabled" withType:FMCDebugType_Debug];
    
    //Delete Log File If It Exists
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"applink.log"];

    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]) {
        [FMCDebugTool logInfo:@"Log File Exisits, Deleteing" withType:FMCDebugType_Debug];
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


#pragma mark - Helper Methods
+(NSString *) stringForDebugType:(FMCDebugType) debugType{
    
    switch (debugType) {
        case FMCDebugType_Debug:
            return @"DBG";
            break;
        case FMCDebugType_Transport_iAP:
            return @"iAP";
            break;
        case FMCDebugType_Transport_TCP:
            return @"TCP";
            break;
        case FMCDebugType_Protocol:
            return @"Pro";
            break;
        case FMCDebugType_RPC:
            return @"RPC";
            break;
        case FMCDebugType_APP:
            return @"APP";
            break;

        default:
            return @"Invalid DebugType";
            break;
    }
    
}

@end
