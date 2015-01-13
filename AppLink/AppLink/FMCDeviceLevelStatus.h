//  FMCDeviceLevelStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Reflects the reported battery status of the connected device, if reported.
 *
 * This enum is avaliable since <font color=red><b>AppLink 2.0</b></font>
 */
@interface FMCDeviceLevelStatus : FMCEnum {}

/**
 * Convert String to DeviceLevelStatus
 * @param value String
 * @return DeviceLevelStatus
 */
+(FMCDeviceLevelStatus*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCDeviceLevelStatus
 @result return an array that store all possible FMCDeviceLevelStatus
 */
+(NSMutableArray*) values;

/**
 * @abstract Device Level Status is : <font color=green>Zero level bars</font>
 * @result return a FMCDeviceLevelStatus with value of <font color=gray><i>ZERO_LEVEL_BARS</i></font>
 */
+(FMCDeviceLevelStatus*) ZERO_LEVEL_BARS;
/**
 * @abstract Device Level Status is : <font color=green>One level bars</font>
 * @result return a FMCDeviceLevelStatus with value of <font color=gray><i>ZERO_LEVEL_BARS</i></font>
 */
+(FMCDeviceLevelStatus*) ONE_LEVEL_BARS;
/**
 * @abstract Device Level Status is : <font color=green>Two level bars</font>
 * @result return a FMCDeviceLevelStatus with value of <font color=gray><i>ZERO_LEVEL_BARS</i></font>
 */
+(FMCDeviceLevelStatus*) TWO_LEVEL_BARS;
/**
 * @abstract Device Level Status is : <font color=green>Three level bars</font>
 * @result return a FMCDeviceLevelStatus with value of <font color=gray><i>ZERO_LEVEL_BARS</i></font>
 */
+(FMCDeviceLevelStatus*) THREE_LEVEL_BARS;
/**
 * @abstract Device Level Status is : <font color=green>Four level bars</font>
 * @result return a FMCDeviceLevelStatus with value of <font color=gray><i>ZERO_LEVEL_BARS</i></font>
 */
+(FMCDeviceLevelStatus*) FOUR_LEVEL_BARS;
/**
 * @abstract Device Level Status is :<font color=green>Not provided</font>
 * @result return a FMCDeviceLevelStatus with value of <font color=gray><i>ZERO_LEVEL_BARS</i></font>
 */
+(FMCDeviceLevelStatus*) NOT_PROVIDED;

@end
