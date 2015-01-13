//  FMCUpdateMode.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Specifies what function should be performed on the media clock/counter
 *
 * Avaliable since <font color=red><b> AppLink 1.0 </b></font>
 */
@interface FMCUpdateMode : FMCEnum {}

/**
 * Convert String to FMCUpdateMode
 * @param value String
 * @return FMCUpdateMode
 */
+(FMCUpdateMode*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCUpdateMode
 @result return an array that store all possible FMCUpdateMode
 */
+(NSMutableArray*) values;

/*!
 @abstract Starts the media clock timer counting upward, in increments of 1 second.
 @result return FMCUpdateMode with value of <font color=gray><i> COUNTUP </i></font>
 */
+(FMCUpdateMode*) COUNTUP;
/*!
 @abstract Starts the media clock timer counting downward, in increments of 1 second.
 @result return FMCUpdateMode with value of <font color=gray><i> COUNTDOWN </i></font>
 */
+(FMCUpdateMode*) COUNTDOWN;
/*!
 @abstract Pauses the media clock timer.
 @result return FMCUpdateMode with value of <font color=gray><i> PAUSE </i></font>
 */
+(FMCUpdateMode*) PAUSE;
/*!
 @abstract Resumes the media clock timer. The timer resumes counting in whatever
  mode was in effect before pausing (i.e. COUNTUP or COUNTDOWN).
 @result return FMCUpdateMode with value of <font color=gray><i> RESUME </i></font>
 */
+(FMCUpdateMode*) RESUME;
/*!
 @abstract Clear the media clock timer.
 */
+(FMCUpdateMode*) CLEAR;

@end
