//
//  SDLTemperature.m
//

#import "SDLTemperature.h"
#import "SDLNames.h"

@implementation SDLTemperature

- (void)setUnit:(SDLTemperatureUnit *)unit {
    if (unit != nil) {
        [store setObject:unit forKey:NAMES_unit];
    } else {
        [store removeObjectForKey:NAMES_unit];
    }
}

- (SDLTemperatureUnit *)unit {
    return [store objectForKey:NAMES_unit];
}

- (void)setValue:(NSNumber *)value {
    if (value != nil) {
        [store setObject:value forKey:NAMES_value];
    } else {
        [store removeObjectForKey:NAMES_value];
    }
}

- (NSNumber *)value {
    return [store objectForKey:NAMES_value];
}

@end
