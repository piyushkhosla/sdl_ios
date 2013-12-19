//  FMCIgnitionStatus.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/**
 * Reflects the status of ignition..
 *
 * This enum is avaliable since <font color=red><b> AppLink 2.0 </b></font>
 */
@interface FMCIgnitionStatus : FMCEnum {}

/*!
 @abstract return FMCIgnitionStatus ( UNKNOWN / OFF / ACCESSORY / RUN / START / INVALID )
 @param value NSString
 @result return FMCIgnitionStatus
 */
+(FMCIgnitionStatus*) valueOf:(NSString*) value;
/*!
 @abstract store all possible FMCIgnitionStatus values
 @result return an array with all possible FMCIgnitionStatus values inside
 */
+(NSMutableArray*) values;

/**
 * @abstract Ignition status currently unknown
 * @result return Ignition Status with value of <font color=gray><i> UNKNOWN </i></font>
 */
+(FMCIgnitionStatus*) UNKNOWN;
/**
 * @abstract Ignition is off
 * @result return Ignition Status with value of <font color=gray><i> OFF </i></font>
 */
+(FMCIgnitionStatus*) OFF;
/**
 * @abstract Ignition is in mode accessory
 * @result return Ignition Status with value of <font color=gray><i> ACCESSORY </i></font>
 */
+(FMCIgnitionStatus*) ACCESSORY;
/**
 * @abstract Ignition is in mode run
 * @result return Ignition Status with value of <font color=gray><i> RUN </i></font>
 */
+(FMCIgnitionStatus*) RUN;
/**
 * @abstract Ignition is in mode run
 * @result return Ignition Status with value of <font color=gray><i> START </i></font>
 */
+(FMCIgnitionStatus*) START;
/**
 * @abstract Signal is invalid
 * @result return Ignition Status with value of <font color=gray><i> INVALID </i></font>
 */
+(FMCIgnitionStatus*) INVALID;

@end


