//  FMCIgnitionStableStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Reflects the ignition switch stability.
 *
 * This enum is avaliable since <font color=red><b> AppLink 2.0 </b></font>
 */
@interface FMCIgnitionStableStatus : FMCEnum {}

/*!
 @abstract return FMCIgnitionStableStatus (IGNITION_SWITCH_NOT_STABLE / IGNITION_SWITCH_STABLE)
 @param value NSString
 @result return FMCIgnitionStableStatus
 */
+(FMCIgnitionStableStatus*) valueOf:(NSString*) value;
/*!
 @abstract store all possible FMCIgnitionStableStatus values
 @result return an array with all possible FMCIgnitionStableStatus values inside
 */
+(NSMutableArray*) values;

/**
 * @abstract The current ignition switch status is considered not to be stable.
 * @result return the Ignition Stable Status with value of <font color=gray><i> IGNITION_SWITCH_NOT_STABLE </i></font>
 */
+(FMCIgnitionStableStatus*) IGNITION_SWITCH_NOT_STABLE;
/**
 * @abstract The current ignition switch status is considered to be stable.
 * @result return the Ignition Stable Status with value of <font color=gray><i> IGNITION_SWITCH_STABLE </i></font>
 */
+(FMCIgnitionStableStatus*) IGNITION_SWITCH_STABLE;
+(FMCIgnitionStableStatus*) MISSING_FROM_TRANSMITTER;

@end
