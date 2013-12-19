//  FMCButtonName.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
* <p>
* Defines logical buttons which, on a given SYNC unit, would correspond to
* either physical or soft (touchscreen) buttons. These logical buttons present
* a standard functional abstraction which the developer can rely upon,
* independent of the SYNC unit. For example, the developer can rely upon the OK
* button having the same meaning to the user across SYNC platforms.
* </p>
* <p>
* The preset buttons (0-9) can typically be interpreted by the application as
* corresponding to some user-configured choices, though the application is free
* to interpret these button presses as it sees fit.
* </p>
* <p>
* The application can discover which buttons a given SYNC unit implements by
* interrogating the ButtonCapabilities parameter of the
* RegisterAppInterface response.
* </p>
*
* This enum is avaliable since <font color=red><b>AppLink 1.0</b></font>
*/
@interface FMCButtonName : FMCEnum {}

/**
 * @abstract Convert String to FMCButtonName
 * @param value NSString
 * @result FMCButtonName 
 */
+(FMCButtonName*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCButtonName
 @result return an array that store all possible FMCButtonName
 */
+(NSMutableArray*) values;

/**
 * @abstract Represents the button usually labeled "OK". A typical use of this button
 * is for the user to press it to make a selection.
 * @result return a FMCButtonName with the value of <font color=gray><i>OK</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) OK;
/**
 * @abstract Represents the seek-left button. A typical use of this button is for the
 * user to scroll to the left through menu choices one menu item per press.
 * @result return a FMCButtonName with the value of <font color=gray><i>SEEKLEFT</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) SEEKLEFT;
/**
 * @abstract Represents the seek-right button. A typical use of this button is for the
 * user to scroll to the right through menu choices one menu item per press.
 * @result return a FMCButtonName with the value of <font color=gray><i>SEEKRIGHT</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) SEEKRIGHT;
/**
 * @abstract Represents a turn of the tuner knob in the clockwise direction one tick.
 * @result return a FMCButtonName with the value of <font color=gray><i>TUNEUP</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) TUNEUP;
/**
 * @abstract Represents a turn of the tuner knob in the counter-clockwise direction
 * one tick.
 * @result return a FMCButtonName with the value of <font color=gray><i>TUNEDOWN</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) TUNEDOWN;
/**
 * @abstract Represents the preset 0 button.
 * @result return a FMCButtonName with the value of <font color=gray><i>PRESET_0</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) PRESET_0;
/**
 * @abstract Represents the preset 1 button.
 * @result return a FMCButtonName with the value of <font color=gray><i>PRESET_1</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) PRESET_1;
/**
 * @abstract Represents the preset 2 button.
 * @result return a FMCButtonName with the value of <font color=gray><i>PRESET_2</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) PRESET_2;
/**
 * @abstract Represents the preset 3 button.
 * @result return a FMCButtonName with the value of <font color=gray><i>PRESET_3</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) PRESET_3;
/**
 * @abstract Represents the preset 4 button.
 * @result return a FMCButtonName with the value of <font color=gray><i>PRESET_4</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) PRESET_4;
/**
 * @abstract Represents the preset 5 button.
 * @result return a FMCButtonName with the value of <font color=gray><i>PRESET_5</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) PRESET_5;
/**
 * @abstract Represents the preset 6 button.
 * @result return a FMCButtonName with the value of <font color=gray><i>PRESET_6</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) PRESET_6;
/**
 * @abstract Represents the preset 7 button.
 * @result return a FMCButtonName with the value of <font color=gray><i>PRESET_7</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) PRESET_7;
/**
 * @abstract Represents the preset 8 button.
 * @result return a FMCButtonName with the value of <font color=gray><i>PRESET_8</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) PRESET_8;
/**
 * @abstract Represents the preset 9 button.
 * @result return a FMCButtonName with the value of <font color=gray><i>PRESET_9</i></font>
 * @since <font color=red><b>AppLink 1.0</b></font>
 */
+(FMCButtonName*) PRESET_9;
+(FMCButtonName*) CUSTOM_BUTTON;

@end
