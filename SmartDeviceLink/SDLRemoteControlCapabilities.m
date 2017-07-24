//
//  SDLRemoteControlCapabilities.m
//

#import "SDLRemoteControlCapabilities.h"
#import "SDLClimateControlCapabilities.h"
#import "SDLRadioControlCapabilities.h"
#import "SDLButtonCapabilities.h"

#import "SDLNames.h"

@implementation SDLRemoteControlCapabilities

- (void)setClimateControlCapabilities:(NSArray<SDLClimateControlCapabilities *> *)climateControlCapabilities {
    if (climateControlCapabilities != nil) {
        store[NAMES_climateControlCapabilities] = climateControlCapabilities;
    } else {
        [store removeObjectForKey:NAMES_climateControlCapabilities];
    }
}

- (NSArray<SDLClimateControlCapabilities *> *)climateControlCapabilities {
    return store[NAMES_climateControlCapabilities];
}

-(void)setRadioControlCapabilities:(NSArray<SDLRadioControlCapabilities *> *)radioControlCapabilities {
    if (radioControlCapabilities != nil) {
        store[NAMES_radioControlCapabilities] = radioControlCapabilities;
    } else {
        [store removeObjectForKey:NAMES_radioControlCapabilities];
    }
}

- (NSArray<SDLRadioControlCapabilities *> *)radioControlCapabilities {
    return store[NAMES_radioControlCapabilities];
}

- (void)setButtonCapabilities:(NSArray *)buttonCapabilities {
    if (buttonCapabilities != nil) {
        store[NAMES_buttonCapabilities] = buttonCapabilities;
    } else {
        [store removeObjectForKey:NAMES_buttonCapabilities];
    }

}

- (NSArray *)buttonCapabilities {
    return store[NAMES_buttonCapabilities];
}

@end
