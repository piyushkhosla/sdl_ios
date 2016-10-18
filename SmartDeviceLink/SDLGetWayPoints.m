//
//  SDLGetWayPoints.m
//

#import "SDLGetWayPoints.h"
#import "SDLWayPointType.h"
#import "SDLNames.h"

@implementation SDLGetWayPoints

- (instancetype)init {
    if (self = [super initWithName:SDLNameGetWayPoints]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setWayPointType:(SDLWayPointType *)wayPointType {
    if (wayPointType != nil) {
        [parameters setObject:wayPointType forKey:SDLNameWayPointType];
    } else {
        [parameters removeObjectForKey:SDLNameWayPointType];
    }
}

- (SDLWayPointType *)wayPointType {
    return [parameters objectForKey:SDLNameWayPointType];
}

@end
