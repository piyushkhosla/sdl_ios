//  FMCUnsubscribeVehicleData.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCVehicleDataType.h>

/**
 * This function is used to unsubscribe the notifications from the
 * subscribeVehicleData function
 * <p>
 * Function Group: Location, VehicleInfo and DrivingChara
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUND</b>
 * </p>
 *
 * Since AppLink 2.0<br/>
 * See FMCSubscribeVehicleData FMCGetVehicleData
 */
@interface FMCUnsubscribeVehicleData : FMCRPCRequest {}

/**
 * @abstract Constructs a new FMCUnsubscribeVehicleData object
 */
-(id) init;

/**
 * @abstract Constructs a new FMCUnsubscribeVehicleData object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract A boolean value. If true, unsubscribes Gps data
 */
@property(assign) NSNumber* gps;

/**
 * @abstract A boolean value. If true, unsubscribes speed data
 */
@property(assign) NSNumber* speed;

/**
 * @abstract A boolean value. If true, unsubscribe data
 */
@property(assign) NSNumber* rpm;

/**
 * @abstract A boolean value. If true, unsubscribes FuelLevel data
 */
@property(assign) NSNumber* fuelLevel;

/**
 * @abstract A boolean value. If true, unsubscribes fuelLevel_State data
 */
@property(assign) NSNumber* fuelLevelState;

/**
 * @abstract A boolean value. If true, unsubscribes instantFuelConsumption data
 */
@property(assign) NSNumber* instantFuelConsumption;

/**
 * @abstract A boolean value. If true, unsubscribes externalTemperature data
 */
@property(assign) NSNumber* externalTemperature;

/**
 * @abstract A boolean value. If true, unsubscribes Currently selected gear data
 */
@property(assign) NSNumber* prndl;

/**
 * @abstract A boolean value. If true, unsubscribes tire pressure status data
 */
@property(assign) NSNumber* tirePressure;

/**
 * @abstract A boolean value. If true, unsubscribes odometer data
 */
@property(assign) NSNumber* odometer;

/**
 * @abstract A boolean value. If true, unsubscribes belt Status data
 */
@property(assign) NSNumber* beltStatus;

/**
 * @abstract A boolean value. If true, unsubscribes body Information data
 */
@property(assign) NSNumber* bodyInformation;

/**
 * @abstract A boolean value. If true, unsubscribes device Status data
 */
@property(assign) NSNumber* deviceStatus;

/**
 * @abstract A boolean value. If true, unsubscribes driver Braking data
 */
@property(assign) NSNumber* driverBraking;

/**
 * @abstract A boolean value. If true, unsubscribes wiper Status data
 */
@property(assign) NSNumber* wiperStatus;

/**
 * @abstract A boolean value. If true, unsubscribes Head Lamp Status data
 */
@property(assign) NSNumber* headLampStatus;

/**
 * @abstract A boolean value. If true, unsubscribes Engine Torque data
 */
@property(assign) NSNumber* engineTorque;

/**
 * @abstract A boolean value. If true, unsubscribes accPedalPosition data
 */
@property(assign) NSNumber* accPedalPosition;
@property(assign) NSNumber* steeringWheelAngle;

@end
