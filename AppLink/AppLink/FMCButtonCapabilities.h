//  FMCButtonCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCButtonName.h>

@interface FMCButtonCapabilities : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCButtonName* name;
@property(strong) NSNumber* shortPressAvailable;
@property(strong) NSNumber* longPressAvailable;
@property(strong) NSNumber* upDownAvailable;

@end
