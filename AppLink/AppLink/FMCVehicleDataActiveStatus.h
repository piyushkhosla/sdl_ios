//  FMCVehicleDataActiveStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/*!
 Vehicle Data Activity Status
 */
@interface FMCVehicleDataActiveStatus : FMCEnum {}

/*!
 @abstract get FMCVehicleDataActiveStatus instance according to string value
 */
+(FMCVehicleDataActiveStatus*) valueOf:(NSString*) value;
/*!
 @abstract return the array that store all possible FMCVehicleDataActiveStatus values
 */
+(NSMutableArray*) values;

/*!
 @abstract FMCVehicleDataActiveStatus : Inactive not confirmed
 */
+(FMCVehicleDataActiveStatus*) INACTIVE_NOT_CONFIRMED;
/*!
 @abstract FMCVehicleDataActiveStatus : Inactive confirmed
 */
+(FMCVehicleDataActiveStatus*) INACTIVE_CONFIRMED;
/*!
 @abstract FMCVehicleDataActiveStatus : Active not confirmed
 */
+(FMCVehicleDataActiveStatus*) ACTIVE_NOT_CONFIRMED;
/*!
 @abstract FMCVehicleDataActiveStatus : Active confirmed
 */
+(FMCVehicleDataActiveStatus*) ACTIVE_CONFIRMED;
/*!
 @abstract FMCVehicleDataActiveStatus : Fault
 */
+(FMCVehicleDataActiveStatus*) FAULT;

@end


