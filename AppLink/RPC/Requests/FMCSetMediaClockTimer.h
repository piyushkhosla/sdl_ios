//  FMCSetMediaClockTimer.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/RPC/Structs/FMCStartTime.h>
#import <AppLink/RPC/Enums/FMCUpdateMode.h>

@interface FMCSetMediaClockTimer : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCStartTime* startTime;
@property(assign) FMCStartTime* endTime;
@property(assign) FMCUpdateMode* updateMode;

@end
