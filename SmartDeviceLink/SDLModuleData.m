//
//  SDLModuleData.m
//

#import "SDLModuleData.h"
#import "SDLNames.h"
#import "SDLModuleType.h"
#import "SDLClimateControlData.h"
#import "SDLRadioControlData.h"
@implementation SDLModuleData

- (void)setModuleType:(SDLModuleType *)moduleType {
    if (moduleType != nil) {
        [store setObject:moduleType forKey:NAMES_moduleType];
    } else {
        [store removeObjectForKey:NAMES_moduleType];
    }
}

- (SDLModuleType *)moduleType {
    return [store objectForKey:NAMES_moduleType];
}

- (void)setRadioControlData:(SDLRadioControlData *)radioControlData {
    if (radioControlData != nil) {
        [store setObject:radioControlData forKey:NAMES_radioControlData];
    } else {
        [store removeObjectForKey:NAMES_radioControlData];
    }
}

- (SDLRadioControlData *)radioControlData {
    return [store objectForKey:NAMES_radioControlData];
}

- (void)setClimateControlData:(SDLClimateControlData *)climateControlData {
    if (climateControlData != nil) {
        [store setObject:climateControlData forKey:NAMES_climateControlData];
    } else {
        [store removeObjectForKey:NAMES_climateControlData];
    }
}

- (SDLClimateControlData *)climateControlData {
    return [store objectForKey:NAMES_climateControlData];
}
@end


