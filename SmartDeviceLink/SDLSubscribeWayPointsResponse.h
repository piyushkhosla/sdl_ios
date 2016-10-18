//
//  SDLSubscribeWayPointsResponse.h
//

#import "SDLRPCResponse.h"

/**
 * Subscribe Way Point Response is sent, when SDLSubscribeWayPoints has been called
 *
 */

@interface SDLSubscribeWayPointsResponse : SDLRPCResponse

/**
 * @abstract Constructs a new SDLSubscribeWayPointsResponse object
 */
- (instancetype)init;
/**
 * @abstract Constructs a new SDLSubscribeWayPointsResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

@end
