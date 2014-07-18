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

@property(assign) FMCEmergencyEventType* emergencyEventType;
@property(assign) FMCFuelCutoffStatus* fuelCutoffStatus;
@property(assign) FMCVehicleDataEventStatus* rolloverEvent;
@property(assign) NSNumber* maximumChangeVelocity;
@property(assign) FMCVehicleDataEventStatus* multipleEvents;

@end
