//  FMCDiagnosticMessageResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>
/** FMCDiagnosticMessageResponse is sent, when FMCDiagnosticMessage has been called.
 * Since<b>AppLink 3.0</b>
 */
@interface FMCDiagnosticMessageResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSMutableArray* messageDataResult;

@end
