//  FMCEngineInfo.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCMaintenanceModeStatus.h>

/**
 * engineInfo class
 */
@interface FMCEngineInfo : FMCRPCStruct {}

/**
 * @abstract Constructs a new FMCGetVehicleDataResponse object
 */
-(id) init;

/**
 * @abstract Constructs a new FMCGetVehicleDataResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract Indicates the electric fuel consumption in terms of gasoline equivalent volume to support fuel economy equivalent calculations.
 Note:Plug-in vehicle use only!
 */
@property(assign) NSNumber* electricFuelConsumption;

/**
 * @abstract Percent state of charge for the high voltage battery.
 */
@property(assign) NSNumber* stateOfCharge;

/**
 * @abstract Current status of fuel maintenance mode (if present on hybrid vehicles).
 */
@property(assign) FMCMaintenanceModeStatus* fuelMaintenanceMode;

/**
 * @abstract Electric range (DTE) in km.  References signal "VehElRnge_L_Dsply".
 0xFFE = No Data Exists
 0xFFF = Fault
 */
@property(assign) NSNumber* distanceToEmpty;

@end
