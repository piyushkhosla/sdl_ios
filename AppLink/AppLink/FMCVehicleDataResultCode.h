//  FMCVehicleDataResultCode.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/*!
 Vehicle Data Result Code
 */
@interface FMCVehicleDataResultCode : FMCEnum {}

/**
 * Convert String to FMCVehicleDataResultCode
 * @param value String
 * @return FMCVehicleDataResultCode
 */
+(FMCVehicleDataResultCode*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCVehicleDataResultCode
 @result return an array that store all possible FMCVehicleDataResultCode
 */
+(NSMutableArray*) values;                                 

/*!
 @abstract return FMCVehicleDataResultCode : <font color=gray><i> SUCCESS </i></font>
 */
+(FMCVehicleDataResultCode*) SUCCESS;
/*!
 @abstract return FMCVehicleDataResultCode : <font color=gray><i> DISALLOWED </i></font>
 */
+(FMCVehicleDataResultCode*) DISALLOWED;
/*!
 @abstract return FMCVehicleDataResultCode : <font color=gray><i> USER_DISALLOWED </i></font>
 */
+(FMCVehicleDataResultCode*) USER_DISALLOWED;
/*!
 @abstract return FMCVehicleDataResultCode : <font color=gray><i> INVALID_ID </i></font>
 */
+(FMCVehicleDataResultCode*) INVALID_ID;
/*!
 @abstract return FMCVehicleDataResultCode : <font color=gray><i> VEHICLE_DATA_NOT_AVAILABLE </i></font>
 */
+(FMCVehicleDataResultCode*) VEHICLE_DATA_NOT_AVAILABLE;
/*!
 @abstract return FMCVehicleDataResultCode : <font color=gray><i> DATA_ALREADY_SUBSCRIBED </i></font>
 */
+(FMCVehicleDataResultCode*) DATA_ALREADY_SUBSCRIBED;
/*!
 @abstract return FMCVehicleDataResultCode : <font color=gray><i> DATA_NOT_SUBSCRIBED </i></font>
 */
+(FMCVehicleDataResultCode*) DATA_NOT_SUBSCRIBED;
/*!
 @abstract return FMCVehicleDataResultCode : <font color=gray><i> IGNORED </i></font>
 */
+(FMCVehicleDataResultCode*) IGNORED;

@end


