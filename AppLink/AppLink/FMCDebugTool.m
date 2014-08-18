//  FMCDebugTool.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCDebugTool.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCSiphonServer.h>

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

+(void) logInfo:(NSString *)info withType:(FMCDebugType)type toOutput:(FMCDebugOutput)output {

    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:5];
    
    if (type != FMCDebugType_Debug) {
        outputString = [NSMutableString  stringWithFormat:@"[%@] ", [FMCDebugTool stringForDebugType:type]];
    }
    
    [outputString appendString:info];


    //Output To DeviceConsole
    if (output == FMCDebugOutput_All || output == FMCDebugOutput_DeviceConsole) {
        NSLog(@"%@", outputString);
    }
    
    //Output To DebugToolConsoles
    if (output == FMCDebugOutput_All || output == FMCDebugOutput_DebugToolConsole) {
        for (NSObject<FMCDebugToolConsole>* console in debugToolConsoleList) {
            [console logInfo:outputString];
        }
    }
    
    //Output To LogFile
//    if (output == FMCDebugOutput_All || output == FMCDebugOutput_DeviceConsole) {
//        NSLog(@"%@", outputString);
//    }
    
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


+ (void)rawTransportData:(const void*) msgBytes msgBytesLength:(int) msgBytesLength direction:(NSString *)direction {
    
    if (!debugToLogFile || msgBytes == NULL || msgBytesLength == 0) {
        return;
    }
    
    [self writeToLogFile:msgBytes msgBytesLength:msgBytesLength prepend:direction];
}


+(void) writeToLogFile:(const void*) dataBytes msgBytesLength:(int) dataBytesLength prepend:(NSString *)prepend{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"applink.log"];
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    if (fileHandle){
//        [FMCDebugTool logInfo:@"[Debug] Append" withType:FMCDebugType_Debug];
        [fileHandle seekToEndOfFile];
        [fileHandle writeData:[prepend dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandle writeData:[NSData dataWithBytes:dataBytes length:dataBytesLength]];
        [fileHandle closeFile];
    }
    else {
//        [FMCDebugTool logInfo:@"[Debug] Debug Log Created" withType:FMCDebugType_Debug];
        NSString *savedString = @"Debug Log Created\n";
        [[savedString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:filePath atomically:NO];
        [[prepend dataUsingEncoding:NSUTF8StringEncoding] writeToFile:filePath atomically:NO];
        [[NSData dataWithBytes:dataBytes length:dataBytesLength] writeToFile:filePath atomically:NO];
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
