//  FMCEmergencyEvent.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/RPC/Enums/FMCEmergencyEventType.h>
#import <AppLink/RPC/Enums/FMCFuelCutoffStatus.h>
#import <AppLink/RPC/Enums/FMCVehicleDataEventStatus.h>

@interface FMCEmergencyEvent : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCEmergencyEventType* emergencyEventType;
@property(assign) FMCFuelCutoffStatus* fuelCutoffStatus;
@property(assign) FMCVehicleDataEventStatus* rolloverEvent;
@property(assign) NSNumber* maximumChangeVelocity;
@property(assign) FMCVehicleDataEventStatus* multipleEvents;

@end
