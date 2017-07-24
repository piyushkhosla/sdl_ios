//
//  SDLClimateControlData.m
//

#import "SDLClimateControlData.h"
#import "SDLNames.h"
#import "SDLTemperature.h"
#import "SDLVentilationMode.h"
#import "SDLDefrostZone.h"

@implementation SDLClimateControlData

- (void)setFanSpeed:(NSNumber *)fanSpeed {
    if (fanSpeed != nil) {
        [store setObject:fanSpeed forKey:NAMES_fanSpeed];
    } else {
        [store removeObjectForKey:NAMES_fanSpeed];
    }
}

- (NSNumber *)fanSpeed {
    return [store objectForKey:NAMES_fanSpeed];
}

- (void)setCurrentTemperature:(SDLTemperature *)currentTemperature {
    if (currentTemperature != nil) {
        [store setObject:currentTemperature forKey:NAMES_currentTemperature];
    } else {
        [store removeObjectForKey:NAMES_currentTemperature];
    }
}

- (SDLTemperature *)currentTemperature {
    return [store objectForKey:NAMES_currentTemperature];
}

- (void)setDesiredTemperature:(SDLTemperature *)desiredTemperature {
    if (desiredTemperature != nil) {
        [store setObject:desiredTemperature forKey:NAMES_desiredTemperature];
    } else {
        [store removeObjectForKey:NAMES_desiredTemperature];
    }
}

- (SDLTemperature *)desiredTemperature {
    return [store objectForKey:NAMES_desiredTemperature];
}

- (void)setAcEnable:(NSNumber *)acEnable {
    if (acEnable != nil) {
        [store setObject:acEnable forKey:NAMES_acEnable];
    } else {
        [store removeObjectForKey:NAMES_acEnable];
    }
}

- (NSNumber *)acEnable {
    return [store objectForKey:NAMES_acEnable];
}

- (void)setCirculateAirEnable:(NSNumber *)circulateAirEnable {
    if (circulateAirEnable != nil) {
        [store setObject:circulateAirEnable forKey:NAMES_circulateAirEnable];
    } else {
        [store removeObjectForKey:NAMES_circulateAirEnable];
    }
}

- (NSNumber *)circulateAirEnable {
    return [store objectForKey:NAMES_circulateAirEnable];
}

- (void)setAutoModeEnable:(NSNumber *)autoModeEnable {
    if (autoModeEnable != nil) {
        [store setObject:autoModeEnable forKey:NAMES_autoModeEnable];
    } else {
        [store removeObjectForKey:NAMES_autoModeEnable];
    }
}

- (NSNumber *)autoModeEnable {
    return [store objectForKey:NAMES_autoModeEnable];
}

- (void)setDefrostZone:(SDLDefrostZone *)defrostZone {
    if (defrostZone != nil) {
        [store setObject:defrostZone forKey:NAMES_defrostZone];
    } else {
        [store removeObjectForKey:NAMES_defrostZone];
    }
}

- (SDLDefrostZone *)defrostZone {
    return [store objectForKey:NAMES_defrostZone];
}

- (void)setDualModeEnable:(NSNumber *)dualModeEnable {
    if (dualModeEnable != nil) {
        [store setObject:dualModeEnable forKey:NAMES_dualModeEnable];
    } else {
        [store removeObjectForKey:NAMES_dualModeEnable];
    }
}

- (NSNumber *)dualModeEnable {
    return [store objectForKey:NAMES_dualModeEnable];
}

- (void)setAcMaxEnable:(NSNumber *)acMaxEnable {
    if (acMaxEnable != nil) {
        [store setObject:acMaxEnable forKey:NAMES_acMaxEnable];
    } else {
        [store removeObjectForKey:NAMES_acMaxEnable];
    }
}

- (NSNumber *)acMaxEnable {
    return [store objectForKey:NAMES_acMaxEnable];
}

- (void)setVentilationMode:(SDLVentilationMode *)ventilationMode {
    if (ventilationMode != nil) {
        [store setObject:ventilationMode forKey:NAMES_ventilationMode];
    } else {
        [store removeObjectForKey:NAMES_ventilationMode];
    }
}

- (SDLVentilationMode *)ventilationMode {
    return [store objectForKey:NAMES_ventilationMode];
}

@end
