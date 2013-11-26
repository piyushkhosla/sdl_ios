//  FMCButtonCapabilities.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCButtonName.h>

@interface FMCButtonCapabilities : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCButtonName* name;
@property(assign) NSNumber* shortPressAvailable;
@property(assign) NSNumber* longPressAvailable;
@property(assign) NSNumber* upDownAvailable;

@end
