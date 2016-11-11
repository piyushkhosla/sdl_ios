//
//  SDLDisplayMode.h
//


#import "SDLEnum.h"

@interface SDLDisplayMode : SDLEnum

/**
 @abstract get SDLDisplayMode according value string
 @param value NSString
 @return SDLDisplayMode object
 */

+ (SDLDisplayMode *)valueOf:(NSString *)value;

/**
 @abstract declare an array to store all possible SDLDisplayMode values
 @return the array
 */

+ (NSArray *)values;

/**
 @abstract Reflects the current status of  HMI display mode.
 @return SDLDisplayMode object with string value *DAY*
 */
+ (SDLDisplayMode *)DAY;

/**
 @abstract Reflects the current status of  HMI display mode.
 @return SDLDisplayMode object with string value *NIGHT*
 */
+ (SDLDisplayMode *)NIGHT;

@end
