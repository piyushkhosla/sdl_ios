//
//  SDLRadioControlData.m
//

#import "SDLRadioControlData.h"
#import "SDLNames.h"
#import "SDLRadioBand.h"
#import "SDLRadioState.h"
#import "SDLRdsData.h"

@implementation SDLRadioControlData

- (void)setFrequencyInteger:(NSNumber *)frequencyInteger {
    if (frequencyInteger != nil) {
        [store setObject:frequencyInteger forKey:NAMES_frequencyInteger];
    } else {
        [store removeObjectForKey:NAMES_frequencyInteger];
    }
}

- (NSNumber *)frequencyInteger {
    return [store objectForKey:NAMES_frequencyInteger];
}

- (void)setFrequencyFraction:(NSNumber *)frequencyFraction {
    if (frequencyFraction != nil) {
        [store setObject:frequencyFraction forKey:NAMES_frequencyFraction];
    } else {
        [store removeObjectForKey:NAMES_frequencyFraction];
    }
}

- (NSNumber *)frequencyFraction {
    return [store objectForKey:NAMES_frequencyFraction];
}

- (void)setBand:(SDLRadioBand *)band {
    if (band != nil) {
        [store setObject:band forKey:NAMES_band];
    } else {
        [store removeObjectForKey:NAMES_band];
    }
}

- (SDLRadioBand *)band{
    return [store objectForKey:NAMES_band];
}

- (void)setRdsData:(SDLRdsData *)rdsData {
    if (rdsData != nil) {
        [store setObject:rdsData forKey:NAMES_rdsData];
    } else {
        [store removeObjectForKey:NAMES_rdsData];
    }
}

- (SDLRdsData *)rdsData {
    return [store objectForKey:NAMES_rdsData];
}

- (void)setAvailableHDs:(NSNumber *)availableHDs {
    if (availableHDs != nil) {
        [store setObject:availableHDs forKey:NAMES_availableHDs];
    } else {
        [store removeObjectForKey:NAMES_availableHDs];
    }
}

- (NSNumber *)availableHDs {
    return [store objectForKey:NAMES_availableHDs];
}

- (void)setHdChannel:(NSNumber *)hdChannel {
    if (hdChannel != nil) {
        [store setObject:hdChannel forKey:NAMES_hdChannel];
    } else {
        [store removeObjectForKey:NAMES_hdChannel];
    }
}

- (NSNumber *)hdChannel {
    return [store objectForKey:NAMES_hdChannel];
}

- (void)setSignalStrength:(NSNumber *)signalStrength {
    if (signalStrength != nil) {
        [store setObject:signalStrength forKey:NAMES_signalStrength];
    } else {
        [store removeObjectForKey:NAMES_signalStrength];
    }
}

- (NSNumber *)signalStrength {
    return [store objectForKey:NAMES_signalStrength];
}

- (void)setSignalChangeThreshold:(NSNumber *)signalChangeThreshold {
    if (signalChangeThreshold != nil) {
        [store setObject:signalChangeThreshold forKey:NAMES_signalChangeThreshold];
    } else {
        [store removeObjectForKey:NAMES_signalChangeThreshold];
    }
}

- (NSNumber *)signalChangeThreshold {
    return [store objectForKey:NAMES_signalChangeThreshold];
}

- (void)setRadioEnable:(NSNumber *)radioEnable {
    if (radioEnable != nil) {
        [store setObject:radioEnable forKey:NAMES_radioEnable];
    } else {
        [store removeObjectForKey:NAMES_radioEnable];
    }
}

- (NSNumber *)radioEnable {
    return [store objectForKey:NAMES_radioEnable];
}

- (void)setState:(SDLRadioState *)state {
    if (state != nil) {
        [store setObject:state forKey:NAMES_state];
    } else {
        [store removeObjectForKey:NAMES_state];
    }
}

- (SDLRadioState *)state {
    return [store objectForKey:NAMES_state];
}
@end
