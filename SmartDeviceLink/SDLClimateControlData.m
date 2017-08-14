//
//  SDLClimateControlData.m
//

#import "SDLClimateControlData.h"
#import "SDLNames.h"
#import "SDLTemperature.h"
#import "NSMutableDictionary+Store.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLClimateControlData

- (instancetype)initWithFanSpeed:(nullable NSNumber<SDLInt> *)fanSpeed {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.fanSpeed = fanSpeed;
    return self;
}

- (instancetype)initWithCurrentTemperature:(SDLTemperature *)currentTemperature {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.currentTemperature = currentTemperature;
    return self;
}

- (instancetype)initWithDesiredTemperature:(SDLTemperature *)desiredTemperature {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.desiredTemperature = desiredTemperature;
    return self;
}

- (instancetype)initWithAcEnable:(nullable NSNumber<SDLBool> *)acEnable {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.acEnable = acEnable;
    return self;
}

- (instancetype)initWithCirculateAirEnable:(nullable NSNumber<SDLBool> *)circulateAirEnable {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.circulateAirEnable = circulateAirEnable;
    return self;
}

- (instancetype)initWithAutoModeEnable:(nullable NSNumber<SDLBool> *)autoModeEnable {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.autoModeEnable = autoModeEnable;
    return self;
}

- (instancetype)initWithDefrostZoneAvailable:(SDLDefrostZone)defrostZone {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.defrostZone = defrostZone;
    return self;
}

- (instancetype)initWithDualModeEnable:(nullable NSNumber<SDLBool> *)dualModeEnable {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.dualModeEnable = dualModeEnable;
    return self;
}

- (instancetype)initWithAcMaxEnable:(nullable NSNumber<SDLBool> *)acMaxEnable {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.acMaxEnable = acMaxEnable;
    return self;
}

- (instancetype)initWithVentilationMode:(SDLVentilationMode)ventilationMode {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.ventilationMode = ventilationMode;
    return self;
}

- (void)setFanSpeed:(nullable NSNumber<SDLInt> *)fanSpeed {
    [store sdl_setObject:fanSpeed forName:SDLNameFanSpeed];
}

- (nullable NSNumber<SDLInt> *)fanSpeed {
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

- (void)setAcEnable:(nullable NSNumber<SDLBool> *)acEnable {
    [store sdl_setObject:acEnable forName:SDLNameAcEnable];
}

- (nullable NSNumber<SDLBool> *)acEnable {
    return [store sdl_objectForName:SDLNameAcEnable];
}

- (void)setCirculateAirEnable:(nullable NSNumber<SDLBool> *)circulateAirEnable {
    [store sdl_setObject:circulateAirEnable forName:SDLNameCirculateAirEnable];
}

- (nullable NSNumber<SDLBool> *)circulateAirEnable {
    return [store sdl_objectForName:SDLNameCirculateAirEnable];
}

- (void)setAutoModeEnable:(nullable NSNumber<SDLBool> *)autoModeEnable {
    [store sdl_setObject:autoModeEnable forName:SDLNameAutoModeEnable];
}

- (nullable NSNumber<SDLBool> *)autoModeEnable {
    return [store sdl_objectForName:SDLNameAutoModeEnable];
}

- (void)setDefrostZone:(nullable SDLDefrostZone)defrostZone {
    [store sdl_setObject:defrostZone forName:SDLNameDefrostZone];
}

- (nullable SDLDefrostZone)defrostZone {
    return [store sdl_objectForName:SDLNameDefrostZone];
}

- (void)setDualModeEnable:(nullable NSNumber<SDLBool> *)dualModeEnable {
    [store sdl_setObject:dualModeEnable forName:SDLNameDualModeEnable];
}

- (nullable NSNumber<SDLBool> *)dualModeEnable {
    return [store sdl_objectForName:SDLNameDualModeEnable];
}

- (void)setAcMaxEnable:(nullable NSNumber<SDLBool> *)acMaxEnable {
    [store sdl_setObject:acMaxEnable forName:SDLNameAcMaxEnable];
}

- (nullable NSNumber<SDLBool> *)acMaxEnable {
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
