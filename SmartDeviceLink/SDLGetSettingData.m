//
//  SDLGetSettingData.m
//

#import "SDLGetSettingData.h"
#import "SDLNames.h"

@implementation SDLGetSettingData

- (instancetype)init {
    if (self = [super initWithName:NAMES_GetSettingData]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setDisplayMode:(NSNumber *)displayMode {
    if (displayMode != nil) {
        [parameters setObject:displayMode forKey:NAMES_displayMode];
    } else {
        [parameters removeObjectForKey:NAMES_displayMode];
    }
}

- (NSNumber *)displayMode {
    return [parameters objectForKey:NAMES_displayMode];
}

- (void)setDistanceUnit:(NSNumber *)distanceUnit {
    if (distanceUnit != nil) {
        [parameters setObject:distanceUnit forKey:NAMES_distanceUnit];
    } else {
        [parameters removeObjectForKey:NAMES_distanceUnit];
    }
}

- (NSNumber *)distanceUnit {
    return [parameters objectForKey:NAMES_distanceUnit];
}

- (void)setTemperatureUnit:(NSNumber *)temperatureUnit {
    if (temperatureUnit != nil) {
        [parameters setObject:temperatureUnit forKey:NAMES_temperatureUnit];
    } else {
        [parameters removeObjectForKey:NAMES_temperatureUnit];
    }
}

- (NSNumber *)temperatureUnit {
    return [parameters objectForKey:NAMES_temperatureUnit];
}

@end
