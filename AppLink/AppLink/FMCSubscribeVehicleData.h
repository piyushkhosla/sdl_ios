//  FMCSubscribeVehicleData.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCVehicleDataType.h>

/**
 * Subscribes for specific published vehicle data items. The data will be only
 * sent, if it has changed. The application will be notified by the
 * onVehicleData notification whenever new data is available. The update rate is
 * very much dependent on sensors, vehicle architecture and vehicle type. Be
 * also prepared for the situation that a signal is not available on a vehicle
 * <p>
 * Function Group: Location, VehicleInfo and DrivingChara
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUND</b>
 * </p>
 *
 * Since AppLink 2.0<br/>
 * See FMCUnsubscribeVehicleData FMCGetVehicleData
 */
@interface FMCSubscribeVehicleData : FMCRPCRequest {}

/**
 * @abstract Constructs a new FMCSubscribeVehicleData object
 */
-(id) init;

/**
 * @abstract Constructs a new FMCSubscribeVehicleData object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract A boolean value. If true, subscribes Gps data
 */
@property(assign) NSNumber* gps;

/**
 * @abstract A boolean value. If true, subscribes speed data
 */
@property(assign) NSNumber* speed;

/**
 * @abstract A boolean value. If true, subscribes rpm data
 */
@property(assign) NSNumber* rpm;

/**
 * @abstract A boolean value. If true, subscribes FuelLevel data
 */
@property(assign) NSNumber* fuelLevel;

/**
 * @abstract A boolean value. If true, subscribes fuelLevel_State data
 */
@property(assign) NSNumber* fuelLevelState;

/**
 * @abstract A boolean value. If true, subscribes instantFuelConsumption data
 */
@property(assign) NSNumber* instantFuelConsumption;

/**
 * @abstract A boolean value. If true, subscribes externalTemperature data
 */
@property(assign) NSNumber* externalTemperature;

/**
 * @abstract A boolean value. If true, subscribes Currently selected gear data
 */
@property(assign) NSNumber* prndl;

/**
 * @abstract A boolean value. If true, subscribes tire pressure status data
 */
@property(assign) NSNumber* tirePressure;

/**
 * @abstract A boolean value. If true, subscribes odometer data
 */
@property(assign) NSNumber* odometer;

/**
 * @abstract A boolean value. If true, subscribes belt Status data
 */
@property(assign) NSNumber* beltStatus;

/**
 * @abstract A boolean value. If true, subscribes body Information data
 */
@property(assign) NSNumber* bodyInformation;

/**
 * @abstract A boolean value. If true, subscribes device Status data
 */
@property(assign) NSNumber* deviceStatus;

/**
 * @abstract A boolean value. If true, subscribes driver Braking data
 */
@property(assign) NSNumber* driverBraking;

/**
 * @abstract A boolean value. If true, subscribes wiper Status data
 */
@property(assign) NSNumber* wiperStatus;

/**
 * @abstract A boolean value. If true, subscribes Head Lamp Status data
 */
@property(assign) NSNumber* headLampStatus;

/**
 * @abstract A boolean value. If true, subscribes Engine Torque data
 */
@property(assign) NSNumber* engineTorque;

/**
 * @abstract A boolean value. If true, means the accPedalPosition data has been
 * subscribed.
 */
@property(assign) NSNumber* accPedalPosition;

/**
 * @abstract A boolean value. If true, means the steeringWheelAngle data has been
 * subscribed.
 */
@property(assign) NSNumber* steeringWheelAngle;

@end
