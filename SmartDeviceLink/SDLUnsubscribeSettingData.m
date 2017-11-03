//
//  SDLUnsubscribeSettingData.m
//

#import "SDLUnsubscribeSettingData.h"
#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"

@implementation SDLUnsubscribeSettingData

- (instancetype)init {
    if (self = [super initWithName:SDLNameUnsubscribeSettingData]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setDisplayMode:(NSNumber *)displayMode {
    [parameters sdl_setObject:displayMode forName:SDLNameDisplayMode];
}

- (NSNumber *)displayMode {
    return [parameters sdl_objectForName:SDLNameDisplayMode];
}

- (void)setDistanceUnit:(NSNumber *)distanceUnit {
    [parameters sdl_setObject:distanceUnit forName:SDLNameDistanceUnit];
}

- (NSNumber *)distanceUnit {
    return [parameters sdl_objectForName:SDLNameDistanceUnit];
}

- (void)setTemperatureUnit:(NSNumber *)temperatureUnit {
    [parameters sdl_setObject:temperatureUnit forName:SDLNameTemperatureUnit];
}

- (NSNumber *)temperatureUnit {
    return [parameters sdl_objectForName:SDLNameTemperatureUnit];
}

@end
