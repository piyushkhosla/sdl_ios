//
//  SDLOnWayPointChange.h
//

#import "SDLRPCNotification.h"

@class SDLLocationDetails;

/**
 * 	This notification provides the entire LocationDetails
 *  when there is a change to any waypoints or destination.
 */
@interface SDLOnWayPointChange : SDLRPCNotification {
}


/**
 * Constructs a newly allocated SDLOnWayPointChange object
 */
- (instancetype)init;

/**
 * Constructs a newly allocated SDLOnWayPointChange object indicated by the dictionary parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * @abstract See SDLLocationDeatils
 *
 * Required, Array of SDLLocationDetails, Array size 0 - 10
 *
 * @see SDLPermissionItem
 */
@property (strong) NSMutableArray *wayPoints;


@end
