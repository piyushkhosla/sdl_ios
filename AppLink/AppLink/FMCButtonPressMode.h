//  FMCButtonPressMode.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Indicates whether this is a LONG or SHORT button press
 * <p>
 *
 * This enum is avaliable since <font color=red><b>AppLink 1.0</b></font>
 */
@interface FMCButtonPressMode : FMCEnum {}

/**
 * @abstract Convert String to FMCButtonPressMode
 * @param value NSString
 * @result FMCButtonPressMode
 */
+(FMCButtonPressMode*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCButtonPressMode
 @result return an array that store all possible FMCButtonPressMode
 */
+(NSMutableArray*) values;

/**
 * @abstract The button has been depressed for 2 seconds. The button may remain
 * depressed after receiving this event
 * @result return a FMCButtonPressMode with the value of <font color=gray><i>LONG</i></font>
 */
+(FMCButtonPressMode*) LONG;
/**
 * @abstract The button was released before the 2-second long-press interval had
 * elapsed
 * @result return a FMCButtonPressMode with the value of <font color=gray><i>SHORT</i></font>
 */
+(FMCButtonPressMode*) SHORT;

@end
