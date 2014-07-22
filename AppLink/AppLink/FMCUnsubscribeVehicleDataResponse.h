//  FMCUnsubscribeVehicleDataResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

#import <AppLink/FMCVehicleDataResult.h>

@interface FMCUnsubscribeVehicleDataResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCVehicleDataResult* gps;
@property(strong) FMCVehicleDataResult* speed;
@property(strong) FMCVehicleDataResult* rpm;
@property(strong) FMCVehicleDataResult* fuelLevel;
@property(strong) FMCVehicleDataResult* fuelLevel_State;
@property(strong) FMCVehicleDataResult* instantFuelConsumption;
@property(strong) FMCVehicleDataResult* externalTemperature;
@property(strong) FMCVehicleDataResult* prndl;
@property(strong) FMCVehicleDataResult* tirePressure;
@property(strong) FMCVehicleDataResult* odometer;
@property(strong) FMCVehicleDataResult* beltStatus;
@property(strong) FMCVehicleDataResult* bodyInformation;
@property(strong) FMCVehicleDataResult* deviceStatus;
@property(strong) FMCVehicleDataResult* driverBraking;
@property(strong) FMCVehicleDataResult* wiperStatus;
@property(strong) FMCVehicleDataResult* headLampStatus;
@property(strong) FMCVehicleDataResult* engineTorque;
@property(strong) FMCVehicleDataResult* accPedalPosition;
@property(strong) FMCVehicleDataResult* steeringWheelAngle;
@property(strong) FMCVehicleDataResult* eCallInfo;
@property(strong) FMCVehicleDataResult* airbagStatus;
@property(strong) FMCVehicleDataResult* emergencyEvent;
@property(strong) FMCVehicleDataResult* clusterModes;
@property(strong) FMCVehicleDataResult* myKey;

@end
