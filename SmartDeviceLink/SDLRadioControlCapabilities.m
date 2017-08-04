//
//  SDLRadioControlCapabilities.m
//

#import "SDLRadioControlCapabilities.h"
#import "SDLNames.h"
#import "NSMutableDictionary+Store.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLRadioControlCapabilities

- (void)setModuleName:(NSString *)moduleName {
    [store sdl_setObject:moduleName forName:SDLNameModuleName];
}

- (NSString *)moduleName {
    return [store sdl_objectForName:SDLNameModuleName];
}

- (void)setRadioEnableAvailable:(nullable NSNumber *)radioEnableAvailable {
    [store sdl_setObject:radioEnableAvailable forName:SDLNameRadioEnableAvailable];

}

- (nullable NSNumber *)radioEnableAvailable {
    return [store sdl_objectForName:SDLNameRadioEnableAvailable];
}

- (void)setRadioBandAvailable:(nullable NSNumber *)radioBandAvailable {
    [store sdl_setObject:radioBandAvailable forName:SDLNameRadioBandAvailable];

}

- (nullable NSNumber *)radioBandAvailable {
    return [store sdl_objectForName:SDLNameRadioBandAvailable];
}

- (void)setRadioFrequencyAvailable:(nullable NSNumber *)radioFrequencyAvailable {
    [store sdl_setObject:radioFrequencyAvailable forName:SDLNameRadioFrequencyAvailable];
}

- (nullable NSNumber *)radioFrequencyAvailable {
    return [store sdl_objectForName:SDLNameRadioFrequencyAvailable];
}

- (void)setHdChannelAvailable:(nullable NSNumber *)hdChannelAvailable {
    [store sdl_setObject:hdChannelAvailable forName:SDLNameHdChannelAvailable];

}

- (nullable NSNumber *)hdChannelAvailable {
    return [store sdl_objectForName:SDLNameHdChannelAvailable];
}

- (void)setRdsDataAvailable:(nullable NSNumber *)rdsDataAvailable {
    [store sdl_setObject:rdsDataAvailable forName:SDLNameRdsDataAvailable];

}

- (nullable NSNumber *)rdsDataAvailable {
    return [store sdl_objectForName:SDLNameRdsDataAvailable];
}

- (void)setAvailableHDsAvailable:(nullable NSNumber *)availableHDsAvailable {
    [store sdl_setObject:availableHDsAvailable forName:SDLNameAvailableHDsAvailable];

}

- (nullable NSNumber *)availableHDsAvailable {
    return [store sdl_objectForName:SDLNameAvailableHDsAvailable];
}

- (void)setStateAvailable:(nullable NSNumber *)stateAvailable {
    [store sdl_setObject:stateAvailable forName:SDLNameStateAvailable];

}

- (nullable NSNumber *)stateAvailable {
    return [store sdl_objectForName:SDLNameStateAvailable];
}

- (void)setSignalStrengthAvailable:(nullable NSNumber *)signalStrengthAvailable {
    [store sdl_setObject:signalStrengthAvailable forName:SDLNameSignalStrengthAvailable];

}

- (nullable NSNumber *)signalStrengthAvailable {
    return [store sdl_objectForName:SDLNameSignalStrengthAvailable];
}

- (void)setSignalChangeThresholdAvailable:(nullable NSNumber *)signalChangeThresholdAvailable {
    [store sdl_setObject:signalChangeThresholdAvailable forName:SDLNameSignalChangeThresholdAvailable];

}

- (nullable NSNumber *)signalChangeThresholdAvailable {
    return [store sdl_objectForName:SDLNameSignalChangeThresholdAvailable];
}

@end

NS_ASSUME_NONNULL_END
