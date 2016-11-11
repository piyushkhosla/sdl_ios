//
//  SDLUnsubscribeWayPointsResponse.h
//

#import "SDLRPCResponse.h"

/**
 * Unsubscribe Way pont Response is sent, when SDLUnsubscribeWayPointsResponse has been called
 *
 */
@interface SDLUnsubscribeWayPointsResponse : SDLRPCResponse

/**
 * @abstract Constructs a new SDLUnsubscribeWayPointsResponse object
 */
- (instancetype)init;
/**
 * @abstract Constructs a new SDLUnsubscribeWayPointsResponse object indicated by the 
 * NSMutableDictionary
 * 
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;


@end
