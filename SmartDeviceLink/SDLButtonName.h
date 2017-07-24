//  SDLButtonName.h
//


#import "SDLEnum.h"

/**
 * Defines logical buttons which, on a given SDL unit, would correspond to
 * either physical or soft (touchscreen) buttons. These logical buttons present
 * a standard functional abstraction which the developer can rely upon,
 * independent of the SDL unit. For example, the developer can rely upon the OK
 * button having the same meaning to the user across SDL platforms.
 *
 * The preset buttons (0-9) can typically be interpreted by the application as
 * corresponding to some user-configured choices, though the application is free
 * to interpret these button presses as it sees fit.
 *
 * The application can discover which buttons a given SDL unit implements by
 * interrogating the ButtonCapabilities parameter of the
 * RegisterAppInterface response.
 *
 * @since SDL 1.0
 */
@interface SDLButtonName : SDLEnum {
}

/**
 * @abstract Convert String to SDLButtonName
 *
 * @param value String value to retrieve the object for
 *
 * @return SDLButtonName
 */
+ (SDLButtonName *)valueOf:(NSString *)value;

/**
 * @abstract Store the enumeration of all possible SDLButtonName
 *
 * @return an array that store all possible SDLButtonName
 */
+ (NSArray *)values;

/**
 * @abstract Represents the button usually labeled "OK". A typical use of this button is for the user to press it to make a selection.
 *
 * @return a SDLButtonName with the value of *OK*
 */
+ (SDLButtonName *)OK;

/**
 * @abstract Represents the seek-left button. A typical use of this button is for the user to scroll to the left through menu choices one menu item per press.
 *
 * @return a SDLButtonName with the value of *SEEKLEFT*
 */
+ (SDLButtonName *)SEEKLEFT;

/**
 * @abstract Represents the seek-right button. A typical use of this button is for the user to scroll to the right through menu choices one menu item per press.
 *
 * @return a SDLButtonName with the value of *SEEKRIGHT*
 */
+ (SDLButtonName *)SEEKRIGHT;

/**
 * @abstract Represents a turn of the tuner knob in the clockwise direction one tick.
 *
 * @return a SDLButtonName with the value of *TUNEUP*
 */
+ (SDLButtonName *)TUNEUP;

/**
 * @abstract Represents a turn of the tuner knob in the counter-clockwise direction one tick.
 *
 * @return a SDLButtonName with the value of *TUNEDOWN*
 */
+ (SDLButtonName *)TUNEDOWN;

/**
 * @abstract Represents the preset 0 button.
 *
 * @return a SDLButtonName with the value of *PRESET_0*
 */
+ (SDLButtonName *)PRESET_0;

/**
 * @abstract Represents the preset 1 button.
 *
 * @return a SDLButtonName with the value of *PRESET_1*
 */
+ (SDLButtonName *)PRESET_1;

/**
 * @abstract Represents the preset 2 button.
 *
 * @return a SDLButtonName with the value of *PRESET_2*
 */
+ (SDLButtonName *)PRESET_2;

/**
 * @abstract Represents the preset 3 button.
 *
 * @return a SDLButtonName with the value of *PRESET_3*
 */
+ (SDLButtonName *)PRESET_3;

/**
 * @abstract Represents the preset 4 button.
 *
 * @return a SDLButtonName with the value of *PRESET_4*
 */
+ (SDLButtonName *)PRESET_4;

/**
 * @abstract Represents the preset 5 button.
 *
 * @return a SDLButtonName with the value of *PRESET_5*
 */
+ (SDLButtonName *)PRESET_5;

/**
 * @abstract Represents the preset 6 button.
 *
 * @return a SDLButtonName with the value of *PRESET_6*
 */
+ (SDLButtonName *)PRESET_6;

/**
 * @abstract Represents the preset 7 button.
 *
 * @return a SDLButtonName with the value of *PRESET_7*
 */
+ (SDLButtonName *)PRESET_7;

/**
 * @abstract Represents the preset 8 button.
 *
 * @return a SDLButtonName with the value of *PRESET_8*
 */
+ (SDLButtonName *)PRESET_8;

/**
 * @abstract Represents the preset 9 button.
 *
 * @return a SDLButtonName with the value of *PRESET_9*
 */
+ (SDLButtonName *)PRESET_9;

+ (SDLButtonName *)CUSTOM_BUTTON;

/**
 * @abstract Represents the SEARCH button.
 *
 * @return a SDLButtonName with the value of *SEARCH*
 */
+ (SDLButtonName *)SEARCH;

/**
 * @abstract Represents the play/pause button.
 *
 * @return a SDLButtonName with the value of *PLAY_PAUSE*
 */
+ (SDLButtonName *)PLAY_PAUSE;

#pragma mark - Climate Buttons

/**
 * @abstract Represents AC max button *
 * @return a SDLButtonName with the value of *AC_MAX*
 */
+ (SDLButtonName *)AC_MAX;

/**
 * @abstract Represents AC button *
 * @return a SDLButtonName with the value of *AC*
 */
+ (SDLButtonName *)AC;

/**
 * @abstract Represents a Recirculate button
 * @return a SDLButtonName with the value of *RECIRCULATE*
 */
+ (SDLButtonName *)RECIRCULATE;

/**
 * @abstract Represents a Fan up button
 * @return a SDLButtonName with the value of *FAN_UP*
 */
+ (SDLButtonName *)FAN_UP;

/**
 * @abstract Represents a fan down button
 * @return a SDLButtonName with the value of *FAN_DOWN*
 */
+ (SDLButtonName *)FAN_DOWN;

/**
 * @abstract Represents a temperature up button
 * @return a SDLButtonName with the value of *TEMP_UP*
 */
+ (SDLButtonName *)TEMP_UP;

/**
 * @abstract Represents a temperature down button
 * @return a SDLButtonName with the value of *TEMP_DOWN*
 */
+ (SDLButtonName *)TEMP_DOWN;

/**
 * @abstract Represents a Defrost max button.
 *
 * @return a SDLButtonName with the value of *DEFROST_MAX*
 */
+ (SDLButtonName *)DEFROST_MAX;

/**
 * @abstract Represents a Defrost button.
 *
 * @return a SDLButtonName with the value of *DEFROST*
 */
+ (SDLButtonName *)DEFROST;

/**
 * @abstract Represents a Defrost rear button.
 *
 * @return a SDLButtonName with the value of *DEFROST_REAR*
 */
+ (SDLButtonName *)DEFROST_REAR;

/**
 * @abstract Represents a Upper Vent button.
 *
 * @return a SDLButtonName with the value of *UPPER_VENT*
 */
+ (SDLButtonName *)UPPER_VENT;

/**
 * @abstract Represents a Lower vent button.
 *
 * @return a SDLButtonName with the value of *LOWER_VENT*
 */
+ (SDLButtonName *)LOWER_VENT;

#pragma mark - Radio Buttons
/**
 * @abstract Represents a volume down button.
 * @return a SDLButtonName with the value of *TUNEDOWN*
 */
+ (SDLButtonName *)VOLUME_UP;

/**
 * @abstract Represents a volume down button.
 *
 * @return a SDLButtonName with the value of *VOLUME_DOWN*
 */
+ (SDLButtonName *)VOLUME_DOWN;

/**
 * @abstract Represents a Eject Button.
 *
 * @return a SDLButtonName with the value of *EJECT*
 */
+ (SDLButtonName *)EJECT;

/**
 * @abstract Represents a Source button.
 *
 * @return a SDLButtonName with the value of *SOURCE*
 */
+ (SDLButtonName *)SOURCE;

/**
 * @abstract Represents a SHUFFLE button.
 *
 * @return a SDLButtonName with the value of *SHUFFLE*
 */
+ (SDLButtonName *)SHUFFLE;

/**
 * @abstract Represents a Repeat button *
 * @return a SDLButtonName with the value of *REPEAT*
 */
+ (SDLButtonName *)REPEAT;

@end
