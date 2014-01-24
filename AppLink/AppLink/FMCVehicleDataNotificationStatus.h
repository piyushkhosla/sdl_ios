//  FMCVehicleDataNotificationStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/**
 * Reflects the status of a vehicle data notification.
 *
 * Avaliable since <font color=red><b> AppLink 2.0 </b></font>
 */
@interface FMCVehicleDataNotificationStatus : FMCEnum {}

/**
 * Convert String to FMCVehicleDataNotificationStatus
 * @param value String
 * @return FMCVehicleDataNotificationStatus
 */
+(FMCVehicleDataNotificationStatus*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCVehicleDataNotificationStatus
 @result return an array that store all possible FMCVehicleDataNotificationStatus
 */
+(NSMutableArray*) values;

/*!
 @abstract FMCVehicleDataNotificationStatus : <font color=gray><i> NOT_SUPPORTED </i></font>
 */
+(FMCVehicleDataNotificationStatus*) NOT_SUPPORTED;
/*!
 @abstract FMCVehicleDataNotificationStatus : <font color=gray><i> NORMAL </i></font>
 */
+(FMCVehicleDataNotificationStatus*) NORMAL;
/*!
 @abstract FMCVehicleDataNotificationStatus : <font color=gray><i> ACTIVE </i></font>
 */
+(FMCVehicleDataNotificationStatus*) ACTIVE;
+(FMCVehicleDataNotificationStatus*) NOT_USED;

@end


