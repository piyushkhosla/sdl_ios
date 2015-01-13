//  FMCButtonEventMode.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Indicates whether the button was depressed or released. A BUTTONUP event will
 * always be preceded by a BUTTONDOWN event.
 *
 * This enum is avaliable since <font color=red><b>AppLink 1.0</b></font>
 */
@interface FMCButtonEventMode : FMCEnum {}

/**
 * @abstract Convert String to FMCButtonEventMode
 * @param value NSString
 * @result FMCButtonEventMode (BUTTONUP / BUTTONDOWN)
 */
+(FMCButtonEventMode*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCButtonEventMode
 @result return an array that store all possible FMCButtonEventMode
 */
+(NSMutableArray*) values;

/*!
 @abstract The button was released
 @result return a FMCButtonEventMode with value of <font color=gray><i>BUTTONUP</i></font>
 */
+(FMCButtonEventMode*) BUTTONUP;
/*!
 @abstract The button was depressed
 @result return a FMCButtonEventMode with value of <font color=gray><i>BUTTONDOWN</i></font>
 */
+(FMCButtonEventMode*) BUTTONDOWN;

@end
