//  FMCGetVehicleData.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCVehicleDataType.h>

/**
 * Requests surrent values of specific published vehicle data items.
 * <p>
 * Function Group: Location, VehicleInfo and DrivingChara
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUND</b>
 * </p>
 *
 * Since AppLink 2.0<br/>
 * See FMCSubscribeVehicleData FMCUnsubscribeVehicleData
 */
@interface FMCGetVehicleData : FMCRPCRequest {}

/**
 * @abstract Constructs a new FMCGetVehicleData object
 */
-(id) init;

/**
 * @abstract Constructs a new FMCGetVehicleData object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract A boolean value. If true, requests Gps data
 */
@property(assign) NSNumber* gps;

/**
 * @abstract A boolean value. If true, requests speed data
 */
@property(assign) NSNumber* speed;

/**
 * @abstract A boolean value. If true, requests rpm data
 */
@property(assign) NSNumber* rpm;

/**
 * @abstract A boolean value. If true, requests FuelLevel data
 */
@property(assign) NSNumber* fuelLevel;

/**
 * @abstract A boolean value. If true, requests fuelLevel_State data
 */
@property(assign) NSNumber* fuelLevelState;

/**
 * @abstract A boolean value. If true, requests instantFuelConsumption data
 */
@property(assign) NSNumber* instantFuelConsumption;

/**
 * @abstract A boolean value. If true, requests externalTemperature data
 */
@property(assign) NSNumber* externalTemperature;

/**
 * @abstract A boolean value. If true, requests Vehicle Identification Number
 */
@property(assign) NSNumber* vin;

/**
 * @abstract A boolean value. If true, requests Currently selected gear data
 */
@property(assign) NSNumber* prndl;

/**
 * @abstract A boolean value. If true, requests tire pressure status data
 */
@property(assign) NSNumber* tirePressure;

/**
 * @abstract A boolean value. If true, requests odometer data
 */
@property(assign) NSNumber* odometer;

/**
 * @abstract A boolean value. If true, requests belt Status data
 */
@property(assign) NSNumber* beltStatus;

/**
 * @abstract A boolean value. If true, requests body Information data
 */
@property(assign) NSNumber* bodyInformation;

/**
 * @abstract A boolean value. If true, requests device Status data
 */
@property(assign) NSNumber* deviceStatus;

/**
 * @abstract A boolean value. If true, requests driver Braking data
 */
@property(assign) NSNumber* driverBraking;

/**
 * @abstract A boolean value. If true, requests wiper Status data
 */
@property(assign) NSNumber* wiperStatus;

/**
 * @abstract A boolean value. If true, requests Head Lamp Status data
 */
@property(assign) NSNumber* headLampStatus;

/**
 * @abstract A boolean value. If true, requests Engine Torque data
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
