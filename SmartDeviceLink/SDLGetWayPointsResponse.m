//
//  SDLGetWayPointsResponse.m
//

#import "SDLGetWayPointsResponse.h"
#import "SDLNames.h"

@implementation SDLGetWayPointsResponse

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

- (void)setWayPoints:(NSMutableArray *)wayPoints {
    if (wayPoints != nil) {
        [parameters setObject:wayPoints forKey:SDLNameWayPoints];
    } else {
        [parameters removeObjectForKey:SDLNameWayPoints];
    }
}

- (NSMutableArray *)wayPoints {
    return [parameters objectForKey:SDLNameWayPoints];
}

@end
