//
//  SDLOnSettingData.m
//

#import "SDLOnSettingData.h"
#import "SDLDisplayMode.h"
#import "SDLDistanceUnit.h"
#import "SDLTemperatureUnit.h"
#import "SDLNames.h"

@implementation SDLOnSettingData

- (instancetype)init {
    if (self = [super initWithName:NAMES_OnSettingData]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setSeekTime:(SDLDisplayMode *)seekTime {
    if (seekTime != nil) {
        [parameters setObject:seekTime forKey:NAMES_seekTime];
    } else {
        [parameters removeObjectForKey:NAMES_seekTime];
    }
}

- (SDLDisplayMode *)seekTime {
    NSObject *obj = [parameters objectForKey:NAMES_seekTime];
    if (obj == nil || [obj isKindOfClass:SDLDisplayMode.class]) {
        return (SDLDisplayMode *)obj;
    } else {
        return [SDLDisplayMode valueOf:(NSString *)obj];
    }
}

- (void)setDistanceUnit:(SDLDistanceUnit *)distanceUnit {
    if (distanceUnit != nil) {
        [parameters setObject:distanceUnit forKey:NAMES_distanceUnit];
    } else {
        [parameters removeObjectForKey:NAMES_distanceUnit];
    }
}

- (SDLDistanceUnit *)distanceUnit {
    NSObject *obj = [parameters objectForKey:NAMES_distanceUnit];
    if (obj == nil || [obj isKindOfClass:SDLDistanceUnit.class]) {
        return (SDLDistanceUnit *)obj;
    } else {
        return [SDLDistanceUnit valueOf:(NSString *)obj];
    }
}

- (void)setTemperatureUnit:(SDLTemperatureUnit *)temperatureUnit {
    if (temperatureUnit != nil) {
        [parameters setObject:temperatureUnit forKey:NAMES_temperatureUnit];
    } else {
        [parameters removeObjectForKey:NAMES_temperatureUnit];
    }
}

- (SDLTemperatureUnit *)temperatureUnit {
    NSObject *obj = [parameters objectForKey:NAMES_temperatureUnit];
    if (obj == nil || [obj isKindOfClass:SDLTemperatureUnit.class]) {
        return (SDLTemperatureUnit *)obj;
    } else {
        return [SDLTemperatureUnit valueOf:(NSString *)obj];
    }
}

@end