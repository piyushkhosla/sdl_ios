//
//  SDLGetWayPointsResponse.m
//

#import "SDLGetWayPointsResponse.h"
#import "SDLNames.h"

@implementation SDLGetWayPointsResponse

- (instancetype)init {
    if (self = [super initWithName:NAMES_GetWaypoints]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setWayPoints:(NSMutableArray *)wayPoints {
    if (wayPoints != nil) {
        [parameters setObject:wayPoints forKey:NAMES_waypoints];
    } else {
        [parameters removeObjectForKey:NAMES_waypoints];
    }
}

- (NSMutableArray *)wayPoints {
    return [parameters objectForKey:NAMES_waypoints];
}

@end

@implementation SDLGetWaypointsResponse

@end
