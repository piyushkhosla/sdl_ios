//
//  SDLDistanceUnit.m
//

#import "SDLDistanceUnit.h"

SDLDistanceUnit *SDLDistanceUnit_METRIC = nil;
SDLDistanceUnit *SDLDistanceUnit_IMPERIAL = nil;

NSArray *SDLDistanceUnit_values = nil;


@implementation SDLDistanceUnit

+ (SDLDistanceUnit *)valueOf:(NSString *)value {
    for (SDLDistanceUnit *item in SDLDistanceUnit.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLDistanceUnit_values == nil) {
        SDLDistanceUnit_values = @[
                                   SDLDistanceUnit.METRIC,
                                   SDLDistanceUnit.METRIC
                                   ];
    }
    return SDLDistanceUnit_values;
}

+ (SDLDistanceUnit *)METRIC {
    if (SDLDistanceUnit_METRIC == nil) {
        SDLDistanceUnit_METRIC = [[SDLDistanceUnit alloc] initWithValue:@"METRIC"];
    }
    return SDLDistanceUnit_METRIC;
}

+ (SDLDistanceUnit *)IMPERIAL {
    if (SDLDistanceUnit_IMPERIAL == nil) {
        SDLDistanceUnit_IMPERIAL = [[SDLDistanceUnit alloc] initWithValue:@"IMPERIAL"];
    }
    return SDLDistanceUnit_IMPERIAL;
}

@end
