//  FMCEmergencyEvent.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCEmergencyEventType.h>
#import <AppLink/FMCFuelCutoffStatus.h>
#import <AppLink/FMCVehicleDataEventStatus.h>

@interface FMCEmergencyEvent : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCEmergencyEventType* emergencyEventType;
@property(strong) FMCFuelCutoffStatus* fuelCutoffStatus;
@property(strong) FMCVehicleDataEventStatus* rolloverEvent;
@property(strong) NSNumber* maximumChangeVelocity;
@property(strong) FMCVehicleDataEventStatus* multipleEvents;

@end
