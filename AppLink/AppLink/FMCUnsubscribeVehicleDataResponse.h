//  FMCUnsubscribeVehicleDataResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

#import <AppLink/FMCVehicleDataResult.h>

/**
 * Unsubscribe Vehicle Data Response is sent, when UnsubscribeVehicleData has been called
 *
 * Since AppLink 2.0
 */
@interface FMCUnsubscribeVehicleDataResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCUnsubscribeVehicleDataResponse object
 */
-(id) init;

/**
 * @abstract Constructs a new FMCUnsubscribeVehicleDataResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract A FMCVehicleDataResult* value. See GPSData.
 */
@property(strong) FMCVehicleDataResult* gps;

/**
 * @abstract A FMCVehicleDataResult* value. The vehicle speed in kilometers per hour.
 */
@property(strong) FMCVehicleDataResult* speed;

/**
 * @abstract A FMCVehicleDataResult* value. The number of revolutions per minute of the engine.
 */
@property(strong) FMCVehicleDataResult* rpm;

/**
 * @abstract A FMCVehicleDataResult* value. The fuel level in the tank (percentage)
 */
@property(strong) FMCVehicleDataResult* fuelLevel;

/**
 * @abstract A FMCVehicleDataResult* value. The fuel level state.
 */
@property(strong) FMCVehicleDataResult* fuelLevel_State;

/**
 * @abstract A FMCVehicleDataResult* value. The instantaneous fuel consumption in microlitres.
 */
@property(strong) FMCVehicleDataResult* instantFuelConsumption;

/**
 * @abstract A FMCVehicleDataResult* value. The external temperature in degrees celsius.
 */
@property(strong) FMCVehicleDataResult* externalTemperature;

/**
 * @abstract A FMCVehicleDataResult* value. See PRNDL.
 */
@property(strong) FMCVehicleDataResult* prndl;

/**
 * @abstract A FMCVehicleDataResult* value. See TireStatus.
 */
@property(strong) FMCVehicleDataResult* tirePressure;

/**
 * @abstract A FMCVehicleDataResult* value. Odometer in km.
 */
@property(strong) FMCVehicleDataResult* odometer;

/**
 * @abstract A FMCVehicleDataResult* value. The status of the seat belts.
 */
@property(strong) FMCVehicleDataResult* beltStatus;

/**
 * @abstract A FMCVehicleDataResult* value. The body information including power modes.
 */
@property(strong) FMCVehicleDataResult* bodyInformation;

/**
 * @abstract A FMCVehicleDataResult* value. The device status including signal and battery strength.
 */
@property(strong) FMCVehicleDataResult* deviceStatus;

/**
 * @abstract A FMCVehicleDataResult* value. The status of the brake pedal.
 */
@property(strong) FMCVehicleDataResult* driverBraking;

/**
 * @abstract A FMCVehicleDataResult* value. The status of the wipers.
 */
@property(strong) FMCVehicleDataResult* wiperStatus;

/**
 * @abstract A FMCVehicleDataResult* value. Status of the head lamps.
 */
@property(strong) FMCVehicleDataResult* headLampStatus;

/**
 * @abstract A FMCVehicleDataResult* value. Torque value for engine (in Nm) on non-diesel variants.
 */
@property(strong) FMCVehicleDataResult* engineTorque;

/**
 * @abstract A FMCVehicleDataResult* value. Accelerator pedal position (percentage depressed)
 */
@property(strong) FMCVehicleDataResult* accPedalPosition;

/**
 * @abstract A FMCVehicleDataResult* value. Current angle of the steering wheel (in deg)
 */
@property(strong) FMCVehicleDataResult* steeringWheelAngle;
@property(strong) FMCVehicleDataResult* eCallInfo;
@property(strong) FMCVehicleDataResult* airbagStatus;
@property(strong) FMCVehicleDataResult* emergencyEvent;
@property(strong) FMCVehicleDataResult* clusterModes;
@property(strong) FMCVehicleDataResult* myKey;

@end
