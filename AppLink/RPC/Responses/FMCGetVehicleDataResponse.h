//  FMCGetVehicleDataResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

#import <AppLink/RPC/Structs/FMCGPSData.h>
#import <AppLink/RPC/Enums/FMCComponentVolumeStatus.h>
#import <AppLink/RPC/Enums/FMCPRNDL.h>
#import <AppLink/RPC/Structs/FMCTireStatus.h>
#import <AppLink/RPC/Structs/FMCBeltStatus.h>
#import <AppLink/RPC/Structs/FMCBodyInformation.h>
#import <AppLink/RPC/Structs/FMCDeviceStatus.h>
#import <AppLink/RPC/Enums/FMCVehicleDataEventStatus.h>
#import <AppLink/RPC/Enums/FMCWiperStatus.h>
#import <AppLink/RPC/Structs/FMCHeadLampStatus.h>
#import <AppLink/RPC/Structs/FMCECallInfo.h>
#import <AppLink/RPC/Structs/FMCAirbagStatus.h>
#import <AppLink/RPC/Structs/FMCEmergencyEvent.h>
#import <AppLink/RPC/Structs/FMCClusterModeStatus.h>
#import <AppLink/RPC/Structs/FMCMyKey.h>

@interface FMCGetVehicleDataResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCGPSData* gps;
@property(assign) NSNumber* speed;
@property(assign) NSNumber* rpm;
@property(assign) NSNumber* fuelLevel;
@property(assign) FMCComponentVolumeStatus* fuelLevel_State;
@property(assign) NSNumber* instantFuelConsumption;
@property(assign) NSNumber* externalTemperature;
@property(assign) NSString* vin;
@property(assign) FMCPRNDL* prndl;
@property(assign) FMCTireStatus* tirePressure;
@property(assign) NSNumber* odometer;
@property(assign) FMCBeltStatus* beltStatus;
@property(assign) FMCBodyInformation* bodyInformation;
@property(assign) FMCDeviceStatus* deviceStatus;
@property(assign) FMCVehicleDataEventStatus* driverBraking;
@property(assign) FMCWiperStatus* wiperStatus;
@property(assign) FMCHeadLampStatus* headLampStatus;
@property(assign) NSNumber* engineTorque;
@property(assign) NSNumber* accPedalPosition;
@property(assign) NSNumber* steeringWheelAngle;
@property(assign) FMCECallInfo* eCallInfo;
@property(assign) FMCAirbagStatus* airbagStatus;
@property(assign) FMCEmergencyEvent* emergencyEvent;
@property(assign) FMCClusterModeStatus* clusterModeStatus;
@property(assign) FMCMyKey* myKey;

@end
