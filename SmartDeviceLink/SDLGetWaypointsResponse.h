//
//  SDLGetWayPointsResponse.h
//  SmartDeviceLink-iOS
//

#import "SDLRPCResponse.h"

@interface SDLGetWayPointsResponse : SDLRPCResponse

- (instancetype)init;
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * @abstract Array of SDLLocationDetails
 * size 1 - 10
 */
@property (strong) NSMutableArray *wayPoints;

@end