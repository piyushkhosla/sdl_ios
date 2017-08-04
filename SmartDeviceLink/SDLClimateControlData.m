//
//  SDLClimateControlData.m
//

#import "SDLClimateControlData.h"
#import "SDLNames.h"
#import "SDLTemperature.h"
#import "NSMutableDictionary+Store.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLClimateControlData

- (void)setFanSpeed:(nullable NSNumber *)fanSpeed {
    [store sdl_setObject:fanSpeed forName:SDLNameFanSpeed];
}

- (nullable NSNumber *)fanSpeed {
    return [store sdl_objectForName:SDLNameFanSpeed];
}

- (void)setCurrentTemperature:(nullable SDLTemperature *)currentTemperature {
    [store sdl_setObject:currentTemperature forName:SDLNameCurrentTemperature];
}

- (nullable SDLTemperature *)currentTemperature {
    return [store sdl_objectForName:SDLNameCurrentTemperature];
}

- (void)setDesiredTemperature:(nullable SDLTemperature *)desiredTemperature {
    [store sdl_setObject:desiredTemperature forName:SDLNameDesiredTemperature];
}

- (nullable SDLTemperature *)desiredTemperature {
    return [store sdl_objectForName:SDLNameDesiredTemperature];
}

- (void)setAcEnable:(nullable NSNumber *)acEnable {
    [store sdl_setObject:acEnable forName:SDLNameAcEnable];
}

- (nullable NSNumber *)acEnable {
    return [store sdl_objectForName:SDLNameAcEnable];
}

- (void)setCirculateAirEnable:(nullable NSNumber *)circulateAirEnable {
    [store sdl_setObject:circulateAirEnable forName:SDLNameCirculateAirEnable];
}

- (nullable NSNumber *)circulateAirEnable {
    return [store sdl_objectForName:SDLNameCirculateAirEnable];
}

- (void)setAutoModeEnable:(nullable NSNumber *)autoModeEnable {
    [store sdl_setObject:autoModeEnable forName:SDLNameAutoModeEnable];
}

- (nullable NSNumber *)autoModeEnable {
    return [store sdl_objectForName:SDLNameAutoModeEnable];
}

- (void)setDefrostZone:(nullable SDLDefrostZone)defrostZone {
    [store sdl_setObject:defrostZone forName:SDLNameDefrostZone];
}

- (nullable SDLDefrostZone)defrostZone {
    return [store sdl_objectForName:SDLNameDefrostZone];
}

- (void)setDualModeEnable:(nullable NSNumber *)dualModeEnable {
    [store sdl_setObject:dualModeEnable forName:SDLNameDualModeEnable];
}

- (nullable NSNumber *)dualModeEnable {
    return [store sdl_objectForName:SDLNameDualModeEnable];
}

- (void)setAcMaxEnable:(nullable NSNumber *)acMaxEnable {
    [store sdl_setObject:acMaxEnable forName:SDLNameAcMaxEnable];
}

- (nullable NSNumber *)acMaxEnable {
    return [store sdl_objectForName:SDLNameAcMaxEnable];
}

- (void)setVentilationMode:(nullable SDLVentilationMode)ventilationMode {
    [store sdl_setObject:ventilationMode forName:SDLNameVentilationMode];
}

- (nullable SDLVentilationMode)ventilationMode {
    return [store sdl_objectForName:SDLNameVentilationMode];
}

@end

NS_ASSUME_NONNULL_END
