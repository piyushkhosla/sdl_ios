//  FMCVehicleDataType.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/**
 * Defines the vehicle data types that can be published and subscribed to
 *
 */
@interface FMCVehicleDataType : FMCEnum {}

/**
 * Convert String to FMCVehicleDataType
 * @param value String
 * @return FMCVehicleDataType
 */
+(FMCVehicleDataType*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCVehicleDataType
 @result return an array that store all possible FMCVehicleDataType
 */
+(NSMutableArray*) values;                                 

/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_GPS </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_GPS;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_SPEED </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_SPEED;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_RPM </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_RPM;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_FUELLEVEL </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_FUELLEVEL;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_FUELLEVEL_STATE </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_FUELLEVEL_STATE;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_FUELCONSUMPTION </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_FUELCONSUMPTION;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_EXTERNTEMP </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_EXTERNTEMP;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_VIN </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_VIN;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_PRNDL </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_PRNDL;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_TIREPRESSURE </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_TIREPRESSURE;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_ODOMETER </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_ODOMETER;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_BELTSTATUS </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_BELTSTATUS;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_BODYINFO </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_BODYINFO;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_DEVICESTATUS </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_DEVICESTATUS;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_BRAKING </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_BRAKING;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_WIPERSTATUS </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_WIPERSTATUS;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_HEADLAMPSTATUS </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_HEADLAMPSTATUS;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_BATTVOLTAGE </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_BATTVOLTAGE;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_ENGINETORQUE </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_ENGINETORQUE;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_ACCPEDAL </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_ACCPEDAL;
/*!
 @abstract FMCVehicleDataType : <font color=gray><i> VEHICLEDATA_STEERINGWHEEL </i></font>
 */
+(FMCVehicleDataType*) VEHICLEDATA_STEERINGWHEEL;

@end


