//  FMCHmiZoneCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Specifies HMI Zones in the vehicle.
 *
 */
@interface FMCHMIZoneCapabilities : FMCEnum {}
@interface FMCHmiZoneCapabilities : FMCEnum {}

/*!
 @abstract return FMCHMIZoneCapabilities (FRONT / BACK)
 @param value NSString
 @result return FMCHMIZoneCapabilities
 */
+(FMCHmiZoneCapabilities*) valueOf:(NSString*) value;
/*!
 @abstract store all possible FMCHMIZoneCapabilities values
 @result return an array with all possible FMCHMIZoneCapabilities values inside
 */
+(NSMutableArray*) values;

/**
 * @abstract Indicates HMI available for front seat passengers.
 * @result return a FMCHMIZoneCapabilities with value of <font color=gray><i> FRONT </i></font>
 * @since <font color=red><b> AppLink 1.0 </b></font>
 */
+(FMCHmiZoneCapabilities*) FRONT;
/**
 * @abstract Indicates HMI available for rear seat passengers.
 * @result return a FMCHMIZoneCapabilities with value of <font color=gray><i> BACK </i></font>
 * @since <font color=red><b> AppLink 1.0 </b></font>
 */
+(FMCHmiZoneCapabilities*) BACK;

@end
