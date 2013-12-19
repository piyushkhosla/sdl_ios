//  FMCWiperStatus.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h> 
#import <AppLink/FMCEnum.h>   

/*!
 Wiper Status
 */
@interface FMCWiperStatus : FMCEnum {}

/**
 * Convert String to FMCWiperStatus
 * @param value String
 * @return FMCWiperStatus
 */
+(FMCWiperStatus*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCWiperStatus
 @result return an array that store all possible FMCWiperStatus
 */
+(NSMutableArray*) values;

/*!
 @abstract FMCWiperStatus : <font color=gray><i> OFF </i></font>
 */
+(FMCWiperStatus*) OFF;
/*!
 @abstract FMCWiperStatus : <font color=gray><i> AUTO_OFF </i></font>
 */
+(FMCWiperStatus*) AUTO_OFF;
/*!
 @abstract FMCWiperStatus : <font color=gray><i> OFF_MOVING </i></font>
 */
+(FMCWiperStatus*) OFF_MOVING;
/*!
 @abstract FMCWiperStatus : <font color=gray><i> MAN_INT_OFF </i></font>
 */
+(FMCWiperStatus*) MAN_INT_OFF;
/*!
 @abstract FMCWiperStatus : <font color=gray><i> MAN_INT_ON </i></font>
 */
+(FMCWiperStatus*) MAN_INT_ON;
/*!
 @abstract FMCWiperStatus : <font color=gray><i> MAN_LOW </i></font>
 */
+(FMCWiperStatus*) MAN_LOW;
/*!
 @abstract FMCWiperStatus : <font color=gray><i> MAN_HIGH </i></font>
 */
+(FMCWiperStatus*) MAN_HIGH;
/*!
 @abstract FMCWiperStatus : <font color=gray><i> MAN_FLICK </i></font>
 */
+(FMCWiperStatus*) MAN_FLICK;
/*!
 @abstract FMCWiperStatus : <font color=gray><i> WASH </i></font>
 */
+(FMCWiperStatus*) WASH;
/*!
 @abstract FMCWiperStatus : <font color=gray><i> AUTO_LOW </i></font>
 */
+(FMCWiperStatus*) AUTO_LOW;
/*!
 @abstract FMCWiperStatus : <font color=gray><i> AUTO_HIGH </i></font>
 */
+(FMCWiperStatus*) AUTO_HIGH;
/*!
 @abstract FMCWiperStatus : <font color=gray><i> COURTESYWIPE </i></font>
 */
+(FMCWiperStatus*) COURTESYWIPE;
/*!
 @abstract FMCWiperStatus : <font color=gray><i> AUTO_ADJUST </i></font>
 */
+(FMCWiperStatus*) AUTO_ADJUST;
/*!
 @abstract FMCWiperStatus : <font color=gray><i> STALLED </i></font>
 */
+(FMCWiperStatus*) STALLED;
/*!
 @abstract FMCWiperStatus : <font color=gray><i> NO_DATA_EXISTS </i></font>
 */
+(FMCWiperStatus*) NO_DATA_EXISTS;

@end

