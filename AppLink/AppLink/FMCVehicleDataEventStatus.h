//  FMCVehicleDataEventStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/**
 * Reflects the status of a vehicle data event; e.g. a seat belt event status.
 *
 * Avaliable since <font color=red><b> AppLink 2.0 </b></font>
 */
@interface FMCVehicleDataEventStatus : FMCEnum {}

/**
 * Convert String to FMCVehicleDataEventStatus
 * @param value String
 * @return FMCVehicleDataEventStatus
 */
+(FMCVehicleDataEventStatus*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCVehicleDataEventStatus
 @result return an array that store all possible FMCVehicleDataEventStatus
 */
+(NSMutableArray*) values;

/*!
 @abstract No event avaliable
 @result return the FMCVehicleDataEventStatus instance with value of <font color=gray><i> NO_EVENT </i></font>
 */
+(FMCVehicleDataEventStatus*) NO_EVENT;
/*!
 @abstract return the FMCVehicleDataEventStatus instance with value of <font color=gray><i> NO </i></font>
 */
+(FMCVehicleDataEventStatus*) _NO;
/*!
 @abstract return the FMCVehicleDataEventStatus instance with value of <font color=gray><i> YES </i></font>
 */
+(FMCVehicleDataEventStatus*) _YES;
/*!
 @abstract Vehicle data event is not support 
 @result return the FMCVehicleDataEventStatus instance with value of <font color=gray><i> NOT_SUPPORTED </i></font>
 */
+(FMCVehicleDataEventStatus*) NOT_SUPPORTED;
/*!
 @abstract return the FMCVehicleDataEventStatus instance with value of <font color=gray><i> FAULT </i></font>
 */
+(FMCVehicleDataEventStatus*) FAULT;

@end


