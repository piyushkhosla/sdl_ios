//  FMCAirbagStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCVehicleDataEventStatus.h>

@interface FMCAirbagStatus : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCVehicleDataEventStatus* driverAirbagDeployed;
@property(strong) FMCVehicleDataEventStatus* driverSideAirbagDeployed;
@property(strong) FMCVehicleDataEventStatus* driverCurtainAirbagDeployed;
@property(strong) FMCVehicleDataEventStatus* passengerAirbagDeployed;
@property(strong) FMCVehicleDataEventStatus* passengerCurtainAirbagDeployed;
@property(strong) FMCVehicleDataEventStatus* driverKneeAirbagDeployed;
@property(strong) FMCVehicleDataEventStatus* passengerSideAirbagDeployed;
@property(strong) FMCVehicleDataEventStatus* passengerKneeAirbagDeployed;

@end
