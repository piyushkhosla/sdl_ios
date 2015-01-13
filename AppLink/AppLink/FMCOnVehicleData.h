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

/**
 * Request vehicle data.
 *
 * Since AppLink 2.0
 */
@interface FMCOnVehicleData : FMCRPCNotification {}


/**
 * @abstract Constructs a new FMCOnVehicleData object
 */
-(id) init;

/**
 * @abstract Constructs a new FMCOnVehicleData object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract A FMCGPSData* value. See GPSData.
 */
@property(strong) FMCGPSData* gps;

/**
 * @abstract The vehicle speed in kilometers per hour.
 */
@property(strong) NSNumber* speed;

/**
 * @abstract The number of revolutions per minute of the engine.
 */
@property(strong) NSNumber* rpm;

/**
 * @abstract The fuel level in the tank (percentage)
 */
@property(strong) NSNumber* fuelLevel;

/**
 * @abstract A FMCComponentVolumeStatus* value. The fuel level state.
 */
@property(strong) FMCComponentVolumeStatus* fuelLevel_State;

/**
 * @abstract The instantaneous fuel consumption in microlitres.
 */
@property(strong) NSNumber* instantFuelConsumption;

/**
 * @abstract The external temperature in degrees celsius.
 */
@property(strong) NSNumber* externalTemperature;

/**
 * @abstract The Vehicle Identification Number
 */
@property(strong) NSString* vin;

/**
 * @abstract See PRNDL.
 */
@property(strong) FMCPRNDL* prndl;

/**
 * @abstract A FMCTireStatus* value. See TireStatus.
 */
@property(strong) FMCTireStatus* tirePressure;

/**
 * @abstract Odometer reading in km.
 */
@property(strong) NSNumber* odometer;

/**
 * @abstract A FMCBeltStatus* value. The status of the seat belts.
 */
@property(strong) FMCBeltStatus* beltStatus;

/**
 * @abstract A FMCBodyInformation* value. The body information including power modes.
 */
@property(strong) FMCBodyInformation* bodyInformation;

/**
 * @abstract A FMCDeviceStatus* value. The device status including signal and battery strength.
 */
@property(strong) FMCDeviceStatus* deviceStatus;

/**
 * @abstract A FMCVehicleDataResult* value. The status of the brake pedal.
 */
@property(strong) FMCVehicleDataEventStatus* driverBraking;

/**
 * @abstract A FMCWiperStatus* value. The status of the wipers.
 */
@property(strong) FMCWiperStatus* wiperStatus;

/**
 * @abstract A FMCHeadLampStatus* value. Status of the head lamps.
 */
@property(strong) FMCHeadLampStatus* headLampStatus;

/**
 * @abstract Torque value for engine (in Nm) on non-diesel variants.
 */
@property(strong) NSNumber* engineTorque;

/**
 * @abstract Accelerator pedal position (percentage depressed)
 */
@property(strong) NSNumber* accPedalPosition;

/**
 * @abstract Current angle of the steering wheel (in deg)
 */
@property(strong) NSNumber* steeringWheelAngle;
@property(strong) FMCECallInfo* eCallInfo;
@property(strong) FMCAirbagStatus* airbagStatus;
@property(strong) FMCEmergencyEvent* emergencyEvent;
@property(strong) FMCClusterModeStatus* clusterModeStatus;
@property(strong) FMCMyKey* myKey;

@end
