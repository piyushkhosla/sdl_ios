//  FMCAirbagStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCVehicleDataEventStatus.h>

@interface FMCAirbagStatus : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCVehicleDataEventStatus* driverAirbagDeployed;
@property(assign) FMCVehicleDataEventStatus* driverSideAirbagDeployed;
@property(assign) FMCVehicleDataEventStatus* driverCurtainAirbagDeployed;
@property(assign) FMCVehicleDataEventStatus* passengerAirbagDeployed;
@property(assign) FMCVehicleDataEventStatus* passengerCurtainAirbagDeployed;
@property(assign) FMCVehicleDataEventStatus* driverKneeAirbagDeployed;
@property(assign) FMCVehicleDataEventStatus* passengerSideAirbagDeployed;
@property(assign) FMCVehicleDataEventStatus* passengerKneeAirbagDeployed;

@end
