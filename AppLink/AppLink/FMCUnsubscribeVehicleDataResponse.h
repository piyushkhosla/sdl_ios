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

@property(assign) FMCVehicleDataResult* gps;
@property(assign) FMCVehicleDataResult* speed;
@property(assign) FMCVehicleDataResult* rpm;
@property(assign) FMCVehicleDataResult* fuelLevel;
@property(assign) FMCVehicleDataResult* fuelLevelState;
@property(assign) FMCVehicleDataResult* instantFuelConsumption;
@property(assign) FMCVehicleDataResult* externalTemperature;
@property(assign) FMCVehicleDataResult* prndl;
@property(assign) FMCVehicleDataResult* tirePressure;
@property(assign) FMCVehicleDataResult* odometer;
@property(assign) FMCVehicleDataResult* beltStatus;
@property(assign) FMCVehicleDataResult* bodyInformation;
@property(assign) FMCVehicleDataResult* deviceStatus;
@property(assign) FMCVehicleDataResult* driverBraking;
@property(assign) FMCVehicleDataResult* wiperStatus;
@property(assign) FMCVehicleDataResult* headLampStatus;
@property(assign) FMCVehicleDataResult* engineTorque;
@property(assign) FMCVehicleDataResult* accPedalPosition;
@property(assign) FMCVehicleDataResult* steeringWheelAngle;

@end
