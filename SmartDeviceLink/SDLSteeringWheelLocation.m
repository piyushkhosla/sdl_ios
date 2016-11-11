//
//  SDLSteeringWheelLocation.m
//

#import "SDLSteeringWheelLocation.h"

SDLSteeringWheelLocation *SDLSteeringWheelLocation_LEFT = nil;
SDLSteeringWheelLocation *SDLSteeringWheelLocation_RIGHT = nil;
SDLSteeringWheelLocation *SDLSteeringWheelLocation_CENTER = nil;

NSArray *SDLSteeringWheelLocation_values = nil;

@implementation SDLSteeringWheelLocation

+ (SDLSteeringWheelLocation *)valueOf:(NSString *)value {
    for (SDLSteeringWheelLocation *item in SDLSteeringWheelLocation.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLSteeringWheelLocation_values == nil) {
        SDLSteeringWheelLocation_values = @[
                                            SDLSteeringWheelLocation.LEFT,
                                            SDLSteeringWheelLocation.RIGHT,
                                            SDLSteeringWheelLocation.CENTER,
                                            ];
    }
    return SDLSteeringWheelLocation_values;
}

+ (SDLSteeringWheelLocation *)LEFT {
    if (SDLSteeringWheelLocation_LEFT == nil) {
        SDLSteeringWheelLocation_LEFT = [[SDLSteeringWheelLocation alloc] initWithValue:@"LEFT"];
    }
    return SDLSteeringWheelLocation_LEFT;
}

+ (SDLSteeringWheelLocation *)RIGHT {
    if (SDLSteeringWheelLocation_RIGHT == nil) {
        SDLSteeringWheelLocation_RIGHT = [[SDLSteeringWheelLocation alloc] initWithValue:@"RIGHT"];
    }
    return SDLSteeringWheelLocation_RIGHT;
}

+ (SDLSteeringWheelLocation *)CENTER {
    if (SDLSteeringWheelLocation_CENTER == nil) {
        SDLSteeringWheelLocation_CENTER = [[SDLSteeringWheelLocation alloc] initWithValue:@"CENTER"];
    }
    return SDLSteeringWheelLocation_CENTER;
}

@end
