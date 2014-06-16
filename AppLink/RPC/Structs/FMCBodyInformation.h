//  FMCBodyInformation.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/RPC/Enums/FMCIgnitionStableStatus.h>
#import <AppLink/RPC/Enums/FMCIgnitionStatus.h>

@interface FMCBodyInformation : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSNumber* parkBrakeActive;
@property(assign) FMCIgnitionStableStatus* ignitionStableStatus;
@property(assign) FMCIgnitionStatus* ignitionStatus;
@property(assign) NSNumber* driverDoorAjar;
@property(assign) NSNumber* passengerDoorAjar;
@property(assign) NSNumber* rearLeftDoorAjar;
@property(assign) NSNumber* rearRightDoorAjar;

@end
