//
//  SDLTemperatureUnit.h
//


#import "SDLEnum.h"

@interface SDLTemperatureUnit : SDLEnum

/**
 @abstract get SDLTemperatureUnit according value string
 @param value NSString
 @return SDLTemperatureUnit object
 */
+ (SDLTemperatureUnit *)valueOf:(NSString *)value;

/**
 @abstract declare an array to store all possible SDLSoftButtonType values
 @return the array
 */
+ (NSArray *)values;

/**
 @abstract Reflects the current HMI setting for temperature unit in Celsius
 @return SDLTemperatureUnit object with string value *CELSIUS*
 **/
+ (SDLTemperatureUnit *)CELSIUS;

/**
 @abstract Reflects the current HMI setting for temperature unit in Fahrenheit
 @return SDLTemperatureUnit object with string value *FAHRENHEIT*
 **/
+ (SDLTemperatureUnit *)FAHRENHEIT;

@end
