//  FMCAlertManeuver.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>
/**
 @Since AppLink 1.0
 */
@interface FMCAlertManeuver : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSMutableArray* ttsChunks;
@property(strong) NSMutableArray* softButtons;

@end
