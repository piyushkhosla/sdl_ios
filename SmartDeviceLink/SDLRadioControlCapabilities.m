//
//  SDLRadioControlCapabilities.m
//

#import "SDLRadioControlCapabilities.h"
#import "SDLNames.h"

@implementation SDLRadioControlCapabilities

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

- (void)setRadioEnableAvailable:(NSNumber *)radioEnableAvailable {
    if (radioEnableAvailable != nil) {
        [store setObject:radioEnableAvailable forKey:NAMES_radioEnableAvailable];
    } else {
        [store removeObjectForKey:NAMES_radioEnableAvailable];
    }
}

- (NSNumber *)radioEnableAvailable {
    return [store objectForKey:NAMES_radioEnableAvailable];
}

- (void)setRadioBandAvailable:(NSNumber *)radioBandAvailable {
    if (radioBandAvailable != nil) {
        [store setObject:radioBandAvailable forKey:NAMES_radioBandAvailable];
    } else {
        [store removeObjectForKey:NAMES_radioBandAvailable];
    }
}

- (NSNumber *)radioBandAvailable {
    return [store objectForKey:NAMES_radioBandAvailable];
}

- (void)setRadioFrequencyAvailable:(NSNumber *)radioFrequencyAvailable {
    if (radioFrequencyAvailable != nil) {
        [store setObject:radioFrequencyAvailable forKey:NAMES_radioFrequencyAvailable];
    } else {
        [store removeObjectForKey:NAMES_radioFrequencyAvailable];
    }
}

- (NSNumber *)radioFrequencyAvailable {
    return [store objectForKey:NAMES_radioFrequencyAvailable];
}

- (void)setHdChannelAvailable:(NSNumber *)hdChannelAvailable {
    if (hdChannelAvailable != nil) {
        [store setObject:hdChannelAvailable forKey:NAMES_hdChannelAvailable];
    } else {
        [store removeObjectForKey:NAMES_hdChannelAvailable];
    }
}

- (NSNumber *)hdChannelAvailable {
    return [store objectForKey:NAMES_hdChannelAvailable];
}

- (void)setRdsDataAvailable:(NSNumber *)rdsDataAvailable {
    if (rdsDataAvailable != nil) {
        [store setObject:rdsDataAvailable forKey:NAMES_rdsDataAvailable];
    } else {
        [store removeObjectForKey:NAMES_rdsDataAvailable];
    }
}

- (NSNumber *)rdsDataAvailable {
    return [store objectForKey:NAMES_rdsDataAvailable];
}

- (void)setAvailableHDsAvailable:(NSNumber *)availableHDsAvailable {
    if (availableHDsAvailable != nil) {
        [store setObject:availableHDsAvailable forKey:NAMES_availableHDsAvailable];
    } else {
        [store removeObjectForKey:NAMES_availableHDsAvailable];
    }
}

- (NSNumber *)availableHDsAvailable {
    return [store objectForKey:NAMES_availableHDsAvailable];
}

- (void)setStateAvailable:(NSNumber *)stateAvailable {
    if (stateAvailable != nil) {
        [store setObject:stateAvailable forKey:NAMES_stateAvailable];
    } else {
        [store removeObjectForKey:NAMES_stateAvailable];
    }
}

- (NSNumber *)stateAvailable {
    return [store objectForKey:NAMES_stateAvailable];
}

- (void)setSignalStrengthAvailable:(NSNumber *)signalStrengthAvailable {
    if (signalStrengthAvailable != nil) {
        [store setObject:signalStrengthAvailable forKey:NAMES_signalStrengthAvailable];
    } else {
        [store removeObjectForKey:NAMES_signalStrengthAvailable];
    }
}

- (NSNumber *)signalStrengthAvailable {
    return [store objectForKey:NAMES_signalStrengthAvailable];
}

- (void)setSignalChangeThresholdAvailable:(NSNumber *)signalChangeThresholdAvailable {
    if (signalChangeThresholdAvailable != nil) {
        [store setObject:signalChangeThresholdAvailable forKey:NAMES_signalChangeThresholdAvailable];
    } else {
        [store removeObjectForKey:NAMES_signalChangeThresholdAvailable];
    }
}

- (NSNumber *)signalChangeThresholdAvailable {
    return [store objectForKey:NAMES_signalChangeThresholdAvailable];
}

@end
