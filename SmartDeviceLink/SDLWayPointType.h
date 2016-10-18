//
//  SDLWayPointType.h
//

#import "SDLEnum.h"

/**
 * Describes what kind of waypoint is requested.
 */
@interface SDLWayPointType : SDLEnum

/**
 * @abstract Convert String to SDLWayPointType
 *
 * @param value The value of the string to get an object for
 *
 * @return SDLWayPointType
 */
+ (SDLWayPointType *)valueOf:(NSString *)value;

/**
 * @abstract Store the enumeration of all possible SDLWayPointType
 *
 * @return an array that store all possible SDLWayPointType
 */
+ (NSArray *)values;

/**
 *
 * @return a SDLWayPointType with value of *PROMPT*
 */
+ (SDLWayPointType *)ALL;

/**
 *
 * @return a SDLWayPointType with value of *DESTINATION*
 */
+ (SDLWayPointType *)DESTINATION;


@end
