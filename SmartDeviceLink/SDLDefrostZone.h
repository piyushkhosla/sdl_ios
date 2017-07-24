//
//  SDLDefrostZone.h
//

#import "SDLEnum.h"

@interface SDLDefrostZone : SDLEnum

/**
 * @abstract Convert String to SDLDefrostZone
 * @param value The value of the string to get an object for
 * @return SDLDefrostZone
 */
+ (SDLDefrostZone *)valueOf:(NSString *)value;

/**
 * @abstract Store the enumeration of all possible SDLDefrostZone
 * @return An array that store all possible SDLDefrostZone
 */
+ (NSArray *)values;

/**
 * @return A SDLDefrostZone with the value of *FRONT*
 */
+ (SDLDefrostZone *)FRONT;

/**
 * @return A SDLDefrostZone with the value of *FRONT*
 */
+ (SDLDefrostZone *)REAR;

/**
 * @return A SDLDefrostZone with the value of *FRONT*
 */
+ (SDLDefrostZone *)ALL;

/**
 * @return A SDLDefrostZone with the value of *FRONT*
 */
+ (SDLDefrostZone *)NONE;

@end
