//
//  SDLDefrostZone.m
//

#import "SDLDefrostZone.h"

SDLDefrostZone *SDLDefrostZone_FRONT = nil;
SDLDefrostZone *SDLDefrostZone_REAR = nil;
SDLDefrostZone *SDLDefrostZone_ALL = nil;
SDLDefrostZone *SDLDefrostZone_NONE = nil;

NSArray *SDLDefrostZone_values = nil;


@implementation SDLDefrostZone

+ (SDLDefrostZone *)valueOf:(NSString *)value {
    for (SDLDefrostZone *item in SDLDefrostZone.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLDefrostZone_values == nil) {
        SDLDefrostZone_values = @[
                                      SDLDefrostZone.FRONT,
                                      SDLDefrostZone.REAR,
                                      SDLDefrostZone.ALL,
                                      SDLDefrostZone.NONE,
                                      ];
    }
    return SDLDefrostZone_values;
}

+ (SDLDefrostZone *)FRONT {
    if (SDLDefrostZone_FRONT == nil) {
        SDLDefrostZone_FRONT = [[SDLDefrostZone alloc] initWithValue:@"FRONT"];
    }
    return SDLDefrostZone_FRONT;
}

+ (SDLDefrostZone *)REAR {
    if (SDLDefrostZone_REAR == nil) {
        SDLDefrostZone_REAR = [[SDLDefrostZone alloc] initWithValue:@"REAR"];
    }
    return SDLDefrostZone_REAR;
}

+ (SDLDefrostZone *)ALL {
    if (SDLDefrostZone_ALL == nil) {
        SDLDefrostZone_ALL = [[SDLDefrostZone alloc] initWithValue:@"ALL"];
    }
    return SDLDefrostZone_ALL;
}

+ (SDLDefrostZone *)NONE {
    if (SDLDefrostZone_NONE == nil) {
        SDLDefrostZone_NONE = [[SDLDefrostZone alloc] initWithValue:@"NONE"];
    }
    return SDLDefrostZone_NONE;
}

@end
