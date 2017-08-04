//
//  SDLRadioControlData.m
//

#import "SDLRadioControlData.h"
#import "SDLNames.h"
#import "SDLRdsData.h"
#import "NSMutableDictionary+Store.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLRadioControlData

- (void)setFrequencyInteger:(nullable NSNumber *)frequencyInteger {
    [store sdl_setObject:frequencyInteger forName:SDLNameFrequencyInteger];
}

- (nullable NSNumber *)frequencyInteger {
    return [store sdl_objectForName:SDLNameFrequencyInteger];
}

- (void)setFrequencyFraction:(nullable NSNumber *)frequencyFraction {
    [store sdl_setObject:frequencyFraction forName:SDLNameFrequencyFraction];
}

- (nullable NSNumber *)frequencyFraction {
    return [store sdl_objectForName:SDLNameFrequencyFraction];
}

- (void)setBand:(nullable SDLRadioBand)band {
    [store sdl_setObject:band forName:SDLNameBand];
}

- (nullable SDLRadioBand)band{
    return [store sdl_objectForName:SDLNameBand];
}

- (void)setRdsData:(nullable SDLRdsData *)rdsData {
    [store sdl_setObject:rdsData forName:SDLNameRdsData];
}

- (nullable SDLRdsData *)rdsData {
    return [store sdl_objectForName:SDLNameRdsData];
}

- (void)setAvailableHDs:(nullable NSNumber *)availableHDs {
    [store sdl_setObject:availableHDs forName:SDLNameAvailableHDs];
}

- (nullable NSNumber *)availableHDs {
    return [store sdl_objectForName:SDLNameAvailableHDs];
}

- (void)setHdChannel:(nullable NSNumber *)hdChannel {
    [store sdl_setObject:hdChannel forName:SDLNameHdChannel];
}

- (nullable NSNumber *)hdChannel {
    return [store sdl_objectForName:SDLNameHdChannel];
}

- (void)setSignalStrength:(nullable NSNumber *)signalStrength {
    [store sdl_setObject:signalStrength forName:SDLNameSignalStrength];
}

- (nullable NSNumber *)signalStrength {
    return [store sdl_objectForName:SDLNameSignalStrength];
}

- (void)setSignalChangeThreshold:(nullable NSNumber *)signalChangeThreshold {
    [store sdl_setObject:signalChangeThreshold forName:SDLNameSignalChangeThreshold];
}

- (nullable NSNumber *)signalChangeThreshold {
    return [store sdl_objectForName:SDLNameSignalChangeThreshold];
}

- (void)setRadioEnable:(nullable NSNumber *)radioEnable {
    [store sdl_setObject:radioEnable forName:SDLNameRadioEnable];
}

- (nullable NSNumber *)radioEnable {
    return [store sdl_objectForName:SDLNameRadioEnable];
}

- (void)setState:(nullable SDLRadioState)state {
    [store sdl_setObject:state forName:SDLNameState];
}

- (nullable SDLRadioState)state {
    return [store sdl_objectForName:SDLNameState];
}

@end

NS_ASSUME_NONNULL_END
