//  FMCDiagnosticMessage.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

@interface FMCDiagnosticMessage : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSNumber* targetID;
@property(assign) NSNumber* messageLength;
@property(assign) NSMutableArray* messageData;

@end
