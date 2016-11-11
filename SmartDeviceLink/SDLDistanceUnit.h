//
//  SDLDistanceUnit.h
//


#import "SDLEnum.h"

@interface SDLDistanceUnit : SDLEnum

/**
 @abstract get SDLDistanceUnit according value string
 @param value NSString
 @return SDLDistanceUnit object
 */

+ (SDLDistanceUnit *)valueOf:(NSString *)value;

/**
 @abstract declare an array to store all possible SDLDistanceUnit values
 @return the array
 */

+ (NSArray *)values;

/**
 @abstract Reflects the current HMI setting for distance unit.
 @return SDLDistanceUnit object with string value *METRIC*
 */

+ (SDLDistanceUnit *)METRIC;

/**
 @abstract Reflects the current HMI setting for distance unit.
 @return SDLDistanceUnit object with string value *IMPERIAL*
 */

+ (SDLDistanceUnit *)IMPERIAL;
@end
