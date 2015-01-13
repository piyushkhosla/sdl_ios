//  FMCWarningLightStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Reflects the status of a cluster instrument warning light.
 *
 * Avaliable since <font color=red><b> AppLink 2.0 </b></font>
 */
@interface FMCWarningLightStatus : FMCEnum {}

/**
 * Convert String to FMCWarningLightStatus
 * @param value String
 * @return FMCWarningLightStatus
 */
+(FMCWarningLightStatus*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCWarningLightStatus
 @result return an array that store all possible FMCWarningLightStatus
 */
+(NSMutableArray*) values;

/*!
 @abstract Warninglight Off
 @result return FMCWarningLightStatus instance with value of <font color=gray><i> OFF </i></font>
 */
+(FMCWarningLightStatus*) OFF;
/*!
 @abstract Warninglight On
 @result return FMCWarningLightStatus instance with value of <font color=gray><i> ON </i></font>
 */
+(FMCWarningLightStatus*) ON;
/*!
 @abstract Warninglight is flashing
 @result return FMCWarningLightStatus instance with value of <font color=gray><i> FLASH </i></font>
 */
+(FMCWarningLightStatus*) FLASH;
/*!
 @abstract Not used
 @result return FMCWarningLightStatus instance with value of <font color=gray><i> NOT_USED </i></font>
 */
+(FMCWarningLightStatus*) NOT_USED;

@end
