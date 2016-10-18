//
//  SDLWayPointType.m
//

#import "SDLWayPointType.h"
SDLWayPointType *SDLWayPointType_ALL = nil;
SDLWayPointType *SDLWayPointType_DESTINATION = nil;


NSArray *SDLWayPointType_values = nil;

@implementation SDLWayPointType

+ (SDLWayPointType *)valueOf:(NSString *)value {
    for (SDLWayPointType *item in SDLWayPointType.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLWayPointType_values == nil) {
        SDLWayPointType_values = @[
                                   SDLWayPointType.ALL,
                                   SDLWayPointType.DESTINATION,
                                   ];
    }
    return SDLWayPointType_values;
}

+ (SDLWayPointType *)ALL {
    if (SDLWayPointType_ALL == nil) {
        SDLWayPointType_ALL = [[SDLWayPointType alloc] initWithValue:@"ALL"];
    }
    return SDLWayPointType_ALL;
}

+ (SDLWayPointType *)DESTINATION {
    if (SDLWayPointType_DESTINATION == nil) {
        SDLWayPointType_DESTINATION = [[SDLWayPointType alloc] initWithValue:@"DESTINATION"];
    }
    return SDLWayPointType_DESTINATION;
}

@end
