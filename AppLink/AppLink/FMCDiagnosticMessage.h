//  FMCDiagnosticMessage.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>
/** Non periodic vehicle diagnostic request
 *
 * @Since AppLink 3.0
 *
 */

@interface FMCDiagnosticMessage : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSNumber* targetID;
@property(strong) NSNumber* messageLength;
@property(strong) NSMutableArray* messageData;

@end
