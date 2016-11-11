//
//  SDLGetWayPoints.m
//

#import "SDLGetWayPoints.h"
#import "SDLWayPointType.h"
#import "SDLNames.h"

@implementation SDLGetWayPoints

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

- (instancetype)initWithWayPointType:(SDLWayPointType *)wayPointType {
    if (self = [self init]) {
    }
    self.wayPointType = wayPointType;
    return self;
    
}

- (void)setWayPointType:(SDLWayPointType *)wayPointType {
    if (wayPointType != nil) {
        [parameters setObject:wayPointType forKey:NAMES_waypointType];
    } else {
        [parameters removeObjectForKey:NAMES_waypointType];
    }
}

- (SDLWayPointType *)wayPointType {
    return [parameters objectForKey:NAMES_waypointType];
}

@end
