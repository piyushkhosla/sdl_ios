//
//  SDLClimateControlCapabilities.m
//

#import "SDLClimateControlCapabilities.h"
#import "SDLNames.h"
#import "NSMutableDictionary+Store.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLClimateControlCapabilities

- (void)setModuleName:(NSString *)moduleName {
    [store sdl_setObject:moduleName forName:SDLNameModuleName];
}

- (NSString *)moduleName {
    return [store sdl_objectForName:SDLNameModuleName];
}

- (void)setFanSpeedAvailable:(nullable NSNumber *)fanSpeedAvailable {
    [store sdl_setObject:fanSpeedAvailable forName:SDLNameFanSpeedAvailable];
}

- (nullable NSNumber *)fanSpeedAvailable {
    return [store sdl_objectForName:SDLNameFanSpeedAvailable];

}

- (void)setDesiredTemperatureAvailable:(nullable NSNumber *)desiredTemperatureAvailable {
    [store sdl_setObject:desiredTemperatureAvailable forName:SDLNameDesiredTemperatureAvailable];
}

- (nullable NSNumber *)desiredTemperatureAvailable {
    return [store sdl_objectForName:SDLNameDesiredTemperatureAvailable];

}

- (void)setAcEnableAvailable:(nullable NSNumber *)acEnableAvailable {
    [store sdl_setObject:acEnableAvailable forName:SDLNameAcEnableAvailable];
}

- (nullable NSNumber *)acEnableAvailable {
    return [store sdl_objectForName:SDLNameAcEnableAvailable];

}

- (void)setAcMaxEnableAvailable:(nullable NSNumber *)acMaxEnableAvailable {
    [store sdl_setObject:acMaxEnableAvailable forName:SDLNameAcMaxEnableAvailable];
}

- (nullable NSNumber *)acMaxEnableAvailable {
    return [store sdl_objectForName:SDLNameAcMaxEnableAvailable];

}

- (void)setCirculateAirEnableAvailable:(nullable NSNumber *)circulateAirEnableAvailable {
    [store sdl_setObject:circulateAirEnableAvailable forName:SDLNameCirculateAirEnableAvailable];
}

- (nullable NSNumber *)circulateAirEnableAvailable {
    return [store sdl_objectForName:SDLNameCirculateAirEnableAvailable];

}

- (void)setAutoModeEnableAvailable:(nullable NSNumber *)autoModeEnableAvailable {
    [store sdl_setObject:autoModeEnableAvailable forName:SDLNameAutoModeEnableAvailable];
}

- (nullable NSNumber *)autoModeEnableAvailable {
    return [store sdl_objectForName:SDLNameAutoModeEnableAvailable];

}

- (void)setDualModeEnableAvailable:(nullable NSNumber *)dualModeEnableAvailable {
    [store sdl_setObject:dualModeEnableAvailable forName:SDLNameDualModeEnableAvailable];
}

- (nullable NSNumber *)dualModeEnableAvailable {
    return [store sdl_objectForName:SDLNameDualModeEnableAvailable];

}

- (void)setDefrostZoneAvailable:(nullable NSNumber *)defrostZoneAvailable {
    [store sdl_setObject:defrostZoneAvailable forName:SDLNameDefrostZoneAvailable];
}

- (nullable NSNumber *)defrostZoneAvailable {
    return [store sdl_objectForName:SDLNameDefrostZoneAvailable];

}

- (void)setDefrostZone:(nullable NSArray <SDLDefrostZone>*)defrostZone {
    [store sdl_setObject:SDLNameDefrostZone forName:SDLNameDefrostZone];
}

- (nullable NSArray<SDLDefrostZone> *)defrostZone {
    return [store sdl_objectForName:SDLNameDefrostZone];

}

- (void)setVentilationModeAvailable:(nullable NSNumber *)ventilationModeAvailable {
        [store sdl_setObject:ventilationModeAvailable forName:SDLNameVentilationModeAvailable];
}

- (nullable NSNumber *)ventilationModeAvailable {
    return [store sdl_objectForName:SDLNameVentilationModeAvailable];
}

- (void)setVentilationMode:(nullable NSArray<SDLVentilationMode> *)ventilationMode {
        [store sdl_setObject:ventilationMode forName:SDLNameVentilationMode];
}

- (nullable NSArray<SDLVentilationMode> *)ventilationMode {
    return [store sdl_objectForName:SDLNameVentilationMode];
}


@end

NS_ASSUME_NONNULL_END
