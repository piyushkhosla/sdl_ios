//  FMCOnVehicleData.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/FMCGPSData.h>
#import <AppLink/FMCComponentVolumeStatus.h>
#import <AppLink/FMCPRNDL.h>
#import <AppLink/FMCTireStatus.h>
#import <AppLink/FMCBeltStatus.h>
#import <AppLink/FMCBodyInformation.h>
#import <AppLink/FMCDeviceStatus.h>
#import <AppLink/FMCVehicleDataEventStatus.h>
#import <AppLink/FMCWiperStatus.h>
#import <AppLink/FMCHeadLampStatus.h>
#import <AppLink/FMCECallInfo.h>
#import <AppLink/FMCAirbagStatus.h>
#import <AppLink/FMCEmergencyEvent.h>
#import <AppLink/FMCClusterModeStatus.h>
#import <AppLink/FMCMyKey.h>

@interface FMCOnVehicleData : FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCGPSData* gps;
@property(strong) NSNumber* speed;
@property(strong) NSNumber* rpm;
@property(strong) NSNumber* fuelLevel;
@property(strong) FMCComponentVolumeStatus* fuelLevel_State;
@property(strong) NSNumber* instantFuelConsumption;
@property(strong) NSNumber* externalTemperature;
@property(strong) NSString* vin;
@property(strong) FMCPRNDL* prndl;
@property(strong) FMCTireStatus* tirePressure;
@property(strong) NSNumber* odometer;
@property(strong) FMCBeltStatus* beltStatus;
@property(strong) FMCBodyInformation* bodyInformation;
@property(strong) FMCDeviceStatus* deviceStatus;
@property(strong) FMCVehicleDataEventStatus* driverBraking;
@property(strong) FMCWiperStatus* wiperStatus;
@property(strong) FMCHeadLampStatus* headLampStatus;
@property(strong) NSNumber* engineTorque;
@property(strong) NSNumber* accPedalPosition;
@property(strong) NSNumber* steeringWheelAngle;
@property(strong) FMCECallInfo* eCallInfo;
@property(strong) FMCAirbagStatus* airbagStatus;
@property(strong) FMCEmergencyEvent* emergencyEvent;
@property(strong) FMCClusterModeStatus* clusterModeStatus;
@property(strong) FMCMyKey* myKey;

@end
