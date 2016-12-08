//
//  SDLOnWayPointChange.m
//  SmartDeviceLink-iOS
//

#import "SDLOnWayPointChange.h"
#import "SDLNames.h"
#import "SDLLocationDetails.h"

@implementation SDLOnWayPointChange

- (instancetype)init {
    if (self = [super initWithName:NAMES_OnWaypointChange]) {
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
        [parameters setObject:wayPoints forKey:NAMES_OnWaypointChange];
    } else {
        [parameters removeObjectForKey:NAMES_OnWaypointChange];
    }
}

- (NSMutableArray *)wayPoints {
    NSMutableArray *array = [parameters objectForKey:NAMES_waypoints];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:SDLLocationDetails.class]) {
        return array;
    } else {
        NSMutableArray *newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary *dict in array) {
            [newList addObject:[[SDLLocationDetails alloc] initWithDictionary:(NSMutableDictionary *)dict]];
        }
        return newList;
    }
}

@end

@implementation SDLOnWaypointChange

@end
