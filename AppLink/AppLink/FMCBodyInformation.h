//  FMCBodyInformation.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCIgnitionStableStatus.h>
#import <AppLink/FMCIgnitionStatus.h>

@interface FMCBodyInformation : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSNumber* parkBrakeActive;
@property(strong) FMCIgnitionStableStatus* ignitionStableStatus;
@property(strong) FMCIgnitionStatus* ignitionStatus;
@property(strong) NSNumber* driverDoorAjar;
@property(strong) NSNumber* passengerDoorAjar;
@property(strong) NSNumber* rearLeftDoorAjar;
@property(strong) NSNumber* rearRightDoorAjar;

@end
