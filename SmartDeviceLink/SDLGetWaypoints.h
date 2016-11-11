//
//  SDLGetWayPoints.h
//

#import "SDLRPCRequest.h"
@class SDLWayPointType;

/**
 * This RPC allows to for getting waypoint/destination data
 */
@interface SDLGetWayPoints : SDLRPCRequest
/**
 * Constructs a new SDLGetWayPoints object
 */
- (instancetype)init;
/**
 * Constructs a new SDLGetWayPoints object indicated by the dictionary parameter
 * <p>
 *
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * Constructs a new SDLGetWayPoints object indicated by the dictionary parameter
 * <p>
 *
 * @param wayPointType wayPointType to be set
 */
- (instancetype)initWithWayPointType:(SDLWayPointType *)wayPointType;
/**
 * To request for either the destination 
 * only or for all waypoints including destination
 *
 * Required
 * default value: ALL
 */
@property (strong) SDLWayPointType *wayPointType;

@end
