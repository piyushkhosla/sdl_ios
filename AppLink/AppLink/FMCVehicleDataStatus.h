//  FMCVehicleDataStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/**
 * Reflects the status of a binary vehicle data item.
 *
 * Avaliable since <font color=red><b> AppLink 2.0 </b></font>
 */
@interface FMCVehicleDataStatus : FMCEnum {}

/**
 * Convert String to FMCVehicleDataStatus
 * @param value String
 * @return FMCVehicleDataStatus
 */
+(FMCVehicleDataStatus*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCVehicleDataStatus
 @result return an array that store all possible FMCVehicleDataStatus
 */
+(NSMutableArray*) values;

/*!
 @abstract No data avaliable
 @result return FMCVehicleDataStatus : <font color=gray><i> NO_DATA_EXISTS </i></font>
 */
+(FMCVehicleDataStatus*) NO_DATA_EXISTS;
/*!
 @abstract return FMCVehicleDataStatus : <font color=gray><i> OFF </i></font>
 */
+(FMCVehicleDataStatus*) OFF;
/*!
 @abstract return FMCVehicleDataStatus : <font color=gray><i> ON </i></font>
 */
+(FMCVehicleDataStatus*) ON;

@end