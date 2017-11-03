//
//  SDLOnSettingData.m
//

#import "SDLOnSettingData.h"
#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"

@implementation SDLOnSettingData

- (instancetype)init {
    if (self = [super initWithName:SDLNameOnSettingData]) {
    }
    return self;
}

- (void)setSeekTime:(nullable SDLDisplayMode)seekTime {
    [parameters sdl_setObject:seekTime forName:SDLNameSeekTime];
}

- (nullable SDLDisplayMode)seekTime {
    return [parameters sdl_objectForName:SDLNameSeekTime];
}

- (void)setDistanceUnit:(nullable SDLDistanceUnit)distanceUnit {
    [parameters sdl_setObject:distanceUnit forName:SDLNameDistanceUnit];
}

- (nullable SDLDistanceUnit)distanceUnit {
    return [parameters sdl_objectForName:SDLNameDistanceUnit];
}

- (void)setTemperatureUnit:(nullable SDLTemperatureUnit)temperatureUnit {
    [parameters sdl_setObject:temperatureUnit forName:SDLNameTemperatureUnit];
}

- (nullable SDLTemperatureUnit)temperatureUnit {
    return [parameters sdl_objectForName:SDLNameTemperatureUnit];
}

@end
