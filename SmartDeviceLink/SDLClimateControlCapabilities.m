//
//  SDLClimateControlCapabilities.m
//

#import "SDLClimateControlCapabilities.h"
#import "SDLDefrostZone.h"
#import "SDLVentilationMode.h"
#import "SDLNames.h"

@implementation SDLClimateControlCapabilities


- (void)setModuleName:(NSString *)moduleName {
    if (moduleName != nil) {
        [store setObject:moduleName forKey:NAMES_moduleName];
    } else {
        [store removeObjectForKey:NAMES_moduleName];
    }
}

- (NSString *)moduleName {
    return [store objectForKey:NAMES_moduleName];
}

- (void)setFanSpeedAvailable:(NSNumber *)fanSpeedAvailable {
    if (fanSpeedAvailable != nil) {
        [store setObject:fanSpeedAvailable forKey:NAMES_fanSpeedAvailable];
    } else {
        [store removeObjectForKey:NAMES_fanSpeedAvailable];
    }
}

- (NSNumber *)fanSpeedAvailable {
    return [store objectForKey:NAMES_fanSpeedAvailable];

}

- (void)setDesiredTemperatureAvailable:(NSNumber *)desiredTemperatureAvailable {
    if (desiredTemperatureAvailable != nil) {
        [store setObject:desiredTemperatureAvailable forKey:NAMES_desiredTemperatureAvailable];
    } else {
        [store removeObjectForKey:NAMES_desiredTemperatureAvailable];
    }
}

- (NSNumber *)desiredTemperatureAvailable {
    return [store objectForKey:NAMES_desiredTemperatureAvailable];

}

- (void)setAcEnableAvailable:(NSNumber *)acEnableAvailable {
    if (acEnableAvailable != nil) {
        [store setObject:acEnableAvailable forKey:NAMES_acEnableAvailable];
    } else {
        [store removeObjectForKey:NAMES_acEnableAvailable];
    }
}

- (NSNumber *)acEnableAvailable {
    return [store objectForKey:NAMES_acEnableAvailable];

}

- (void)setAcMaxEnableAvailable:(NSNumber *)acMaxEnableAvailable {
    if (acMaxEnableAvailable != nil) {
        [store setObject:acMaxEnableAvailable forKey:NAMES_acMaxEnableAvailable];
    } else {
        [store removeObjectForKey:NAMES_acMaxEnableAvailable];
    }
}

- (NSNumber *)acMaxEnableAvailable {
    return [store objectForKey:NAMES_acMaxEnableAvailable];

}

- (void)setCirculateAirEnableAvailable:(NSNumber *)circulateAirEnableAvailable {
    if (circulateAirEnableAvailable != nil) {
        [store setObject:circulateAirEnableAvailable forKey:NAMES_circulateAirEnableAvailable];
    } else {
        [store removeObjectForKey:NAMES_circulateAirEnableAvailable];
    }
}

- (NSNumber *)circulateAirEnableAvailable {
    return [store objectForKey:NAMES_circulateAirEnableAvailable];

}

- (void)setAutoModeEnableAvailable:(NSNumber *)autoModeEnableAvailable {
    if (autoModeEnableAvailable != nil) {
        [store setObject:autoModeEnableAvailable forKey:NAMES_autoModeEnableAvailable];
    } else {
        [store removeObjectForKey:NAMES_autoModeEnableAvailable];
    }
}

- (NSNumber *)autoModeEnableAvailable {
    return [store objectForKey:NAMES_autoModeEnableAvailable];

}

- (void)setDualModeEnableAvailable:(NSNumber *)dualModeEnableAvailable {
    if (dualModeEnableAvailable != nil) {
        [store setObject:dualModeEnableAvailable forKey:NAMES_dualModeEnableAvailable];
    } else {
        [store removeObjectForKey:NAMES_dualModeEnableAvailable];
    }
}

- (NSNumber *)dualModeEnableAvailable {
    return [store objectForKey:NAMES_dualModeEnableAvailable];

}

- (void)setDefrostZoneAvailable:(NSNumber *)defrostZoneAvailable {
    if (defrostZoneAvailable != nil) {
        [store setObject:defrostZoneAvailable forKey:NAMES_defrostZoneAvailable];
    } else {
        [store removeObjectForKey:NAMES_defrostZoneAvailable];
    }
}

- (NSNumber *)defrostZoneAvailable {
    return [store objectForKey:NAMES_defrostZoneAvailable];

}

- (void)setDefrostZone:(NSArray <SDLDefrostZone *>*)defrostZone {
    if (defrostZone != nil) {
        [store setObject:defrostZone forKey:NAMES_defrostZone];
    } else {
        [store removeObjectForKey:NAMES_defrostZone];
    }
}

- (NSArray<SDLDefrostZone *> *)defrostZone {
    return [store objectForKey:NAMES_defrostZone];

}

- (void)setVentilationModeAvailable:(NSNumber *)ventilationModeAvailable {
    if (ventilationModeAvailable != nil) {
        [store setObject:ventilationModeAvailable forKey:NAMES_ventilationModeAvailable];
    } else {
        [store removeObjectForKey:NAMES_ventilationModeAvailable];
    }
}

- (NSNumber *)ventilationModeAvailable {
    return [store objectForKey:NAMES_ventilationModeAvailable];
}

- (void)setVentilationMode:(NSArray<SDLVentilationMode *> *)ventilationMode {
    if (ventilationMode != nil) {
        [store setObject:ventilationMode forKey:NAMES_ventilationMode];
    } else {
        [store removeObjectForKey:NAMES_ventilationMode];
    }
}

- (NSArray<SDLVentilationMode *> *)ventilationMode {
    return [store objectForKey:NAMES_ventilationMode];
}


@end
