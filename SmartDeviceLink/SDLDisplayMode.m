//
//  SDLDisplayMode.m
//

#import "SDLDisplayMode.h"

SDLDisplayMode *SDLDisplayMode_DAY = nil;
SDLDisplayMode *SDLDisplayMode_NIGHT = nil;

NSArray *SDLDisplayMode_values = nil;

@implementation SDLDisplayMode

+ (SDLDisplayMode *)valueOf:(NSString *)value {
    for (SDLDisplayMode *item in SDLDisplayMode.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLDisplayMode_values == nil) {
        SDLDisplayMode_values = @[
                                  SDLDisplayMode.DAY,
                                  SDLDisplayMode.NIGHT
                                  ];
    }
    return SDLDisplayMode_values;
}

+ (SDLDisplayMode *)DAY {
    if (SDLDisplayMode_DAY == nil) {
        SDLDisplayMode_DAY = [[SDLDisplayMode alloc] initWithValue:@"DAY"];
    }
    return SDLDisplayMode_DAY;
}

+ (SDLDisplayMode *)NIGHT {
    if (SDLDisplayMode_NIGHT == nil) {
        SDLDisplayMode_NIGHT = [[SDLDisplayMode alloc] initWithValue:@"NIGHT"];
    }
    return SDLDisplayMode_NIGHT;
}

@end
