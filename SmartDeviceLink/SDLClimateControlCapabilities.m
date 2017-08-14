//
//  SDLClimateControlCapabilities.m
//

#import "SDLClimateControlCapabilities.h"
#import "SDLNames.h"
#import "NSMutableDictionary+Store.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLClimateControlCapabilities

- (instancetype)initWithModuleName:(NSString *)moduleName {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.moduleName = moduleName;
    return self;
}

- (instancetype)initWithFanSpeedAvailable:(nullable NSNumber<SDLBool> *)fanSpeedAvailable {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.fanSpeedAvailable = fanSpeedAvailable;
    return self;
}

- (instancetype)initWithDesiredTemperatureAvailable:(nullable NSNumber<SDLBool> *)desiredTemperatureAvailable {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.desiredTemperatureAvailable = desiredTemperatureAvailable;
    return self;
}

- (instancetype)initWithAcEnableAvailable:(nullable NSNumber<SDLBool> *)acEnableAvailable {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.acEnableAvailable = acEnableAvailable;
    return self;
}

- (instancetype)initWithAcMaxEnableAvailable:(nullable NSNumber<SDLBool> *)acMaxEnableAvailable {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.acMaxEnableAvailable = acMaxEnableAvailable;
    return self;
}

- (instancetype)initWithCirculateAirEnableAvailable:(nullable NSNumber<SDLBool> *)circulateAirEnableAvailable {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.circulateAirEnableAvailable = circulateAirEnableAvailable;
    return self;
}

- (instancetype)initWithAutoModeEnableAvailable:(nullable NSNumber<SDLBool> *)autoModeEnableAvailable {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.autoModeEnableAvailable = autoModeEnableAvailable;
    return self;
}

- (instancetype)initWithDualModeEnableAvailable:(nullable NSNumber<SDLBool> *)dualModeEnableAvailable {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.dualModeEnableAvailable = dualModeEnableAvailable;
    return self;
}

- (instancetype)initWithDefrostZoneAvailableAvailable:(nullable NSNumber<SDLBool> *)defrostZoneAvailable {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.defrostZoneAvailable = defrostZoneAvailable;
    return self;
}

- (instancetype)initWithDefrostZone:(nullable NSArray<SDLDefrostZone> *)defrostZone {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.defrostZone = defrostZone;
    return self;
}

- (instancetype)initWithVentilationModeAvailable:(nullable NSNumber<SDLBool> *)ventilationModeAvailable {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.ventilationModeAvailable = ventilationModeAvailable;
    return self;
}

- (instancetype)initWithVentilationMode:(nullable NSArray<SDLVentilationMode> *)ventilationMode {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.ventilationMode = ventilationMode;
    return self;
}

- (void)setModuleName:(NSString *)moduleName {
    [store sdl_setObject:moduleName forName:SDLNameModuleName];
}

- (NSString *)moduleName {
    return [store sdl_objectForName:SDLNameModuleName];
}

- (void)setFanSpeedAvailable:(nullable NSNumber<SDLBool> *)fanSpeedAvailable {
    [store sdl_setObject:fanSpeedAvailable forName:SDLNameFanSpeedAvailable];
}

- (nullable NSNumber<SDLBool> *)fanSpeedAvailable {
    return [store sdl_objectForName:SDLNameFanSpeedAvailable];
    
}

- (void)setDesiredTemperatureAvailable:(nullable NSNumber<SDLBool> *)desiredTemperatureAvailable {
    [store sdl_setObject:desiredTemperatureAvailable forName:SDLNameDesiredTemperatureAvailable];
}

- (nullable NSNumber<SDLBool> *)desiredTemperatureAvailable {
    return [store sdl_objectForName:SDLNameDesiredTemperatureAvailable];
    
}

- (void)setAcEnableAvailable:(nullable NSNumber<SDLBool> *)acEnableAvailable {
    [store sdl_setObject:acEnableAvailable forName:SDLNameAcEnableAvailable];
}

- (nullable NSNumber<SDLBool> *)acEnableAvailable {
    return [store sdl_objectForName:SDLNameAcEnableAvailable];
    
}

- (void)setAcMaxEnableAvailable:(nullable NSNumber<SDLBool> *)acMaxEnableAvailable {
    [store sdl_setObject:acMaxEnableAvailable forName:SDLNameAcMaxEnableAvailable];
}

- (nullable NSNumber<SDLBool> *)acMaxEnableAvailable {
    return [store sdl_objectForName:SDLNameAcMaxEnableAvailable];
    
}

- (void)setCirculateAirEnableAvailable:(nullable NSNumber<SDLBool> *)circulateAirEnableAvailable {
    [store sdl_setObject:circulateAirEnableAvailable forName:SDLNameCirculateAirEnableAvailable];
}

- (nullable NSNumber<SDLBool> *)circulateAirEnableAvailable {
    return [store sdl_objectForName:SDLNameCirculateAirEnableAvailable];
    
}

- (void)setAutoModeEnableAvailable:(nullable NSNumber<SDLBool> *)autoModeEnableAvailable {
    [store sdl_setObject:autoModeEnableAvailable forName:SDLNameAutoModeEnableAvailable];
}

- (nullable NSNumber<SDLBool> *)autoModeEnableAvailable {
    return [store sdl_objectForName:SDLNameAutoModeEnableAvailable];
    
}

- (void)setDualModeEnableAvailable:(nullable NSNumber<SDLBool> *)dualModeEnableAvailable {
    [store sdl_setObject:dualModeEnableAvailable forName:SDLNameDualModeEnableAvailable];
}

- (nullable NSNumber<SDLBool> *)dualModeEnableAvailable {
    return [store sdl_objectForName:SDLNameDualModeEnableAvailable];
    
}

- (void)setDefrostZoneAvailable:(nullable NSNumber<SDLBool> *)defrostZoneAvailable {
    [store sdl_setObject:defrostZoneAvailable forName:SDLNameDefrostZoneAvailable];
}

- (nullable NSNumber<SDLBool> *)defrostZoneAvailable {
    return [store sdl_objectForName:SDLNameDefrostZoneAvailable];
    
}

- (void)setDefrostZone:(nullable NSArray <SDLDefrostZone>*)defrostZone {
    [store sdl_setObject:defrostZone forName:SDLNameDefrostZone];
}

- (nullable NSArray<SDLDefrostZone> *)defrostZone {
    return [store sdl_objectForName:SDLNameDefrostZone];
    
}

- (void)setVentilationModeAvailable:(nullable NSNumber<SDLBool> *)ventilationModeAvailable {
    [store sdl_setObject:ventilationModeAvailable forName:SDLNameVentilationModeAvailable];
}

- (nullable NSNumber<SDLBool> *)ventilationModeAvailable {
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
