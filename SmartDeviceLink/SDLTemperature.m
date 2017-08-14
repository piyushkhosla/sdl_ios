//
//  SDLTemperature.m
//

#import "SDLTemperature.h"
#import "SDLNames.h"
#import "NSMutableDictionary+Store.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLTemperature

- (instancetype)initWithTemperature:(SDLTemperatureUnit)unit value:(nonnull NSNumber<SDLFloat> *)value {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.unit = unit;
    self.value = value;
    return self;
}

- (void)setUnit:(SDLTemperatureUnit)unit {
    [store sdl_setObject:unit forName:SDLNameUnit];
}

- (SDLTemperatureUnit)unit {
    return [store sdl_objectForName:SDLNameUnit];
}

- (void)setValue:(NSNumber<SDLFloat> *)value {
    [store sdl_setObject:value forName:SDLNameValue];
}

- (NSNumber<SDLFloat> *)value {
    return [store sdl_objectForName:SDLNameValue];
}

@end

NS_ASSUME_NONNULL_END
