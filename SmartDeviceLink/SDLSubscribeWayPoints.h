//
//  SDLSubscribeWayPoints.h
//

#import "SDLRPCRequest.h"


/**

 * A SDLSubscribeWayPoints can be sent to subscribe
 * for any changes in waypoints/destinations
 *
 * also see SDLUnsubscribeWayPoints
 */
@interface SDLSubscribeWayPoints : SDLRPCRequest

/**
 * Constructs a new SDLSubscribeWayPoints object
 */
- (instancetype)init;

/**
 * Constructs a new SDLSubscribeWayPoints object indicated by the dictionary parameter
 *
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;


@end
