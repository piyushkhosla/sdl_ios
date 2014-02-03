//  FMCMaintenanceModeStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/**
 *
 * The FMCMaintenanceModeStatus class.
 */
@interface FMCMaintenanceModeStatus : FMCEnum {}

/*!
 @abstract Maintenance Mode Status
 @param value NSString
 @result return FMCMaintenanceModeStatus
 */
+(FMCMaintenanceModeStatus*) valueOf:(NSString*) value;
/*!
 @abstract declare an array that store all possible Maintenance Mode Status inside
 @result return the array
 */
+(NSMutableArray*) values;

/*!
 @abstract Maintenance Mode Status : Normal
 @result return the object with value of <font color=gray><i> NORMAL </i></font>
 */
+(FMCMaintenanceModeStatus*) NORMAL;
/*!
 @abstract Maintenance Mode Status : Near
 @result return the object with value of <font color=gray><i> NEAR </i></font>
 */
+(FMCMaintenanceModeStatus*) NEAR;
/*!
 @abstract Maintenance Mode Status : Active
 @result return the object with value of <font color=gray><i> ACTIVE </i></font>
 */
+(FMCMaintenanceModeStatus*) ACTIVE;
/*!
 @abstract Maintenance Mode Status : Feature not present
 @result return the object with value of <font color=gray><i> FEATURE_NOT_PRESENT </i></font>
 */
+(FMCMaintenanceModeStatus*) FEATURE_NOT_PRESENT;

@end


