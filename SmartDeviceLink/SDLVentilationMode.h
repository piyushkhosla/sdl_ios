//
//  SDLVentilationMode.h
//

#import "SDLEnum.h"

@interface SDLVentilationMode : SDLEnum


/**
 * @abstract Convert String to SDLVentilationMode
 * @param value The value of the string to get an object for
 * @return SDLDefrostZone
 */
+ (SDLVentilationMode *)valueOf:(NSString *)value;

/**
 * @abstract Store the enumeration of all possible SDLVentilationMode
 * @return An array that store all possible SDLVentilationMode
 */
+ (NSArray *)values;

/**
 * @return A SDLDefrostZone with the value of *UPPER*
 */
+ (SDLVentilationMode *)UPPER;

/**
 * @return A SDLDefrostZone with the value of *LOWER*
 */
+ (SDLVentilationMode *)LOWER;

/**
 * @return A SDLDefrostZone with the value of *BOTH*
 */
+ (SDLVentilationMode *)BOTH;

/**
 * @return A SDLDefrostZone with the value of *NORTH*
 */
+ (SDLVentilationMode *)NONE;

@end
