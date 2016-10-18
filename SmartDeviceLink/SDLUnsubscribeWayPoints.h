//
//  SDLUnsubscribeWayPoints.h
//


#import "SDLRPCRequest.h"

/**
 * This function is used to unsubscribe the notifications from the
 * subscribeWayPoints function
 *
 * s
 */
@interface SDLUnsubscribeWayPoints : SDLRPCRequest

/**
 * Constructs a new SDLUnsubscribeWayPoints object
 */
- (instancetype)init;

/**
 * Constructs a new SDLUnsubscribeWayPoints object indicated by the dictionary parameter
 *
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

@end
