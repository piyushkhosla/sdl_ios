//  FMCOnVehicleData.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/FMCBeltStatus.h>
#import <AppLink/FMCBodyInformation.h>
#import <AppLink/FMCComponentVolumeStatus.h>
#import <AppLink/FMCDeviceStatus.h>
#import <AppLink/FMCGPSData.h>
#import <AppLink/FMCHeadLampStatus.h>
#import <AppLink/FMCPRNDL.h>
#import <AppLink/FMCTireStatus.h>
#import <AppLink/FMCVehicleDataEventStatus.h>
#import <AppLink/FMCWiperStatus.h>

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
@property(assign) FMCGPSData* gps;

/**
 * @abstract The vehicle speed in kilometers per hour.
 */
@property(assign) NSNumber* speed;

/**
 * @abstract The number of revolutions per minute of the engine.
 */
@property(assign) NSNumber* rpm;

/**
 * @abstract The fuel level in the tank (percentage)
 */
@property(assign) NSNumber* fuelLevel;

/**
 * @abstract A FMCComponentVolumeStatus* value. The fuel level state.
 */
@property(assign) FMCComponentVolumeStatus* fuelLevelState;

/**
 * @abstract The instantaneous fuel consumption in microlitres.
 */
@property(assign) NSNumber* instantFuelConsumption;

/**
 * @abstract The external temperature in degrees celsius.
 */
@property(assign) NSNumber* externalTemperature;

/**
 * @abstract The Vehicle Identification Number
 */
@property(assign) NSString* vin;

/**
 * @abstract See PRNDL.
 */
@property(assign) FMCPRNDL* prndl;

/**
 * @abstract A FMCTireStatus* value. See TireStatus.
 */
@property(assign) FMCTireStatus* tirePressure;

/**
 * @abstract Odometer reading in km.
 */
@property(assign) NSNumber* odometer;

/**
 * @abstract A FMCBeltStatus* value. The status of the seat belts.
 */
@property(assign) FMCBeltStatus* beltStatus;

/**
 * @abstract A FMCBodyInformation* value. The body information including power modes.
 */
@property(assign) FMCBodyInformation* bodyInformation;

/**
 * @abstract A FMCDeviceStatus* value. The device status including signal and battery strength.
 */
@property(assign) FMCDeviceStatus* deviceStatus;

/**
 * @abstract A FMCVehicleDataResult* value. The status of the brake pedal.
 */
@property(assign) FMCVehicleDataEventStatus* driverBraking;

/**
 * @abstract A FMCWiperStatus* value. The status of the wipers.
 */
@property(assign) FMCWiperStatus* wiperStatus;

/**
 * @abstract A FMCHeadLampStatus* value. Status of the head lamps.
 */
@property(assign) FMCHeadLampStatus* headLampStatus;

/**
 * @abstract Torque value for engine (in Nm) on non-diesel variants.
 */
@property(assign) NSNumber* engineTorque;

/**
 * @abstract Accelerator pedal position (percentage depressed)
 */
@property(assign) NSNumber* accPedalPosition;

/**
 * @abstract Current angle of the steering wheel (in deg)
 */
@property(assign) NSNumber* steeringWheelAngle;

@end
