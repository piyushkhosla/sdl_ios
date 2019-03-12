//
//  SDLWeatherServiceManifest.m
//  SmartDeviceLink
//
//  Created by Nicole on 2/8/19.
//  Copyright © 2019 smartdevicelink. All rights reserved.
//

#import "SDLWeatherServiceManifest.h"

#import "NSMutableDictionary+Store.h"
#import "SDLRPCParameterNames.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLWeatherServiceManifest

- (instancetype)initWithCurrentForecastSupported:(BOOL)currentForecastSupported maxMultidayForecastAmount:(UInt32)maxMultidayForecastAmount maxHourlyForecastAmount:(UInt32)maxHourlyForecastAmount maxMinutelyForecastAmount:(UInt32)maxMinutelyForecastAmount weatherForLocationSupported:(BOOL)weatherForLocationSupported {
    self = [self init];
    if (!self) {
        return nil;
    }

    self.currentForecastSupported = @(currentForecastSupported);
    self.maxMultidayForecastAmount = @(maxMultidayForecastAmount);
    self.maxHourlyForecastAmount = @(maxHourlyForecastAmount);
    self.maxMinutelyForecastAmount = @(maxMinutelyForecastAmount);
    self.weatherForLocationSupported = @(weatherForLocationSupported);

    return self;
}

- (void)setCurrentForecastSupported:(nullable NSNumber<SDLBool> *)currentForecastSupported {
    [store sdl_setObject:currentForecastSupported forName:SDLRPCParameterNameCurrentForecastSupported];
}

- (nullable NSNumber<SDLBool> *)currentForecastSupported {
    return [store sdl_objectForName:SDLRPCParameterNameCurrentForecastSupported];
}

- (void)setMaxMultidayForecastAmount:(nullable NSNumber<SDLInt> *)maxMultidayForecastAmount {
    [store sdl_setObject:maxMultidayForecastAmount forName:SDLRPCParameterNameMaxMultidayForecastAmount];
}

- (nullable NSNumber<SDLInt> *)maxMultidayForecastAmount {
    return [store sdl_objectForName:SDLRPCParameterNameMaxMultidayForecastAmount];
}

- (void)setMaxHourlyForecastAmount:(nullable NSNumber<SDLInt> *)maxHourlyForecastAmount {
    [store sdl_setObject:maxHourlyForecastAmount forName:SDLRPCParameterNameMaxHourlyForecastAmount];
}

- (nullable NSNumber<SDLInt> *)maxHourlyForecastAmount {
    return [store sdl_objectForName:SDLRPCParameterNameMaxHourlyForecastAmount];
}

- (void)setMaxMinutelyForecastAmount:(nullable NSNumber<SDLInt> *)maxMinutelyForecastAmount {
    [store sdl_setObject:maxMinutelyForecastAmount forName:SDLRPCParameterNameMaxMinutelyForecastAmount];
}

- (nullable NSNumber<SDLInt> *)maxMinutelyForecastAmount {
    return [store sdl_objectForName:SDLRPCParameterNameMaxMinutelyForecastAmount];
}

- (void)setWeatherForLocationSupported:(nullable NSNumber<SDLBool> *)weatherForLocationSupported {
    [store sdl_setObject:weatherForLocationSupported forName:SDLRPCParameterNameWeatherForLocationSupported];
}

- (nullable NSNumber<SDLBool> *)weatherForLocationSupported {
    return [store sdl_objectForName:SDLRPCParameterNameWeatherForLocationSupported];
}

@end

NS_ASSUME_NONNULL_END