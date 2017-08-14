//
//  SDLRemoteControlCapabilities.m
//

#import "SDLRemoteControlCapabilities.h"
#import "SDLClimateControlCapabilities.h"
#import "SDLRadioControlCapabilities.h"
#import "SDLButtonCapabilities.h"
#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"


NS_ASSUME_NONNULL_BEGIN


@implementation SDLRemoteControlCapabilities

- (instancetype)initWithClimateControlCapabilities:(nullable NSArray<SDLClimateControlCapabilities *> *)climateControlCapabilities {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.climateControlCapabilities = climateControlCapabilities;
    return self;
}

- (instancetype)initWithRadioControlCapabilities:(nullable NSArray<SDLRadioControlCapabilities *> *)radioControlCapabilities {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.radioControlCapabilities = radioControlCapabilities;
    return self;
}

- (instancetype)initWithButtonCapabilities:(nullable NSArray<SDLButtonCapabilities *> *)buttonCapabilities {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.buttonCapabilities = buttonCapabilities;
    return self;
}

- (void)setClimateControlCapabilities:(nullable NSArray<SDLClimateControlCapabilities *> *)climateControlCapabilities {
    [store sdl_setObject:climateControlCapabilities forName:SDLNameClimateControlCapabilities];
}

- (nullable NSArray<SDLClimateControlCapabilities *> *)climateControlCapabilities {
    return [store sdl_objectForName:SDLNameClimateControlCapabilities];
}

-(void)setRadioControlCapabilities:(nullable NSArray<SDLRadioControlCapabilities *> *)radioControlCapabilities {
    [store sdl_setObject:radioControlCapabilities forName:SDLNameRadioControlCapabilities ];
}

- (nullable NSArray<SDLRadioControlCapabilities *> *)radioControlCapabilities {
    return store[SDLNameRadioControlCapabilities];
}

- (void)setButtonCapabilities:(nullable NSArray *)buttonCapabilities {
    [store sdl_setObject:buttonCapabilities forName:SDLNameButtonCapabilities];
}

- (nullable NSArray *)buttonCapabilities {
    return [store sdl_objectForName:SDLNameButtonCapabilities];
}

@end

NS_ASSUME_NONNULL_END
