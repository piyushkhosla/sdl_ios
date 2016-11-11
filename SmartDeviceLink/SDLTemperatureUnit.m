//
//  SDLTemperatureUnit.m
//

#import "SDLTemperatureUnit.h"

SDLTemperatureUnit *SDLTemperatureUnit_CELSIUS = nil;
SDLTemperatureUnit *SDLTemperatureUnit_FAHRENHEIT = nil;

NSArray *SDLTemperatureUnit_values = nil;

@implementation SDLTemperatureUnit

+ (SDLTemperatureUnit *)valueOf:(NSString *)value {
    for (SDLTemperatureUnit *item in SDLTemperatureUnit.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLTemperatureUnit_values == nil) {
        SDLTemperatureUnit_values = @[
                                      SDLTemperatureUnit.CELSIUS,
                                      SDLTemperatureUnit.FAHRENHEIT,
                                      ];
    }
    return SDLTemperatureUnit_values;
}

+ (SDLTemperatureUnit *)CELSIUS {
    if (SDLTemperatureUnit_CELSIUS == nil) {
        SDLTemperatureUnit_CELSIUS = [[SDLTemperatureUnit alloc] initWithValue:@"CELSIUS"];
    }
    return SDLTemperatureUnit_CELSIUS;
}

+ (SDLTemperatureUnit *)FAHRENHEIT {
    if (SDLTemperatureUnit_FAHRENHEIT == nil) {
        SDLTemperatureUnit_FAHRENHEIT = [[SDLTemperatureUnit alloc] initWithValue:@"FAHRENHEIT"];
    }
    return SDLTemperatureUnit_FAHRENHEIT;
}

@end
