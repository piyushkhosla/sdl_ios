//
//  SDLSubscribeSettingDataResponse.m
//

#import "SDLSubscribeSettingDataResponse.h"
#import "SDLNames.h"

@implementation SDLSubscribeSettingDataResponse

- (instancetype)init {
    if (self = [super initWithName:NAMES_SubscribeSettingData]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setDisplayMode:(NSNumber *)displayMode {
    if (displayMode != nil) {
        [parameters setObject:displayMode forKey:NAMES_displayMode];
    } else {
        [parameters removeObjectForKey:NAMES_displayMode];
    }
}

- (NSNumber *)displayMode {
    return [parameters objectForKey:NAMES_displayMode];
}

- (void)setDistanceUnit:(NSNumber *)distanceUnit {
    if (distanceUnit != nil) {
        [parameters setObject:distanceUnit forKey:NAMES_distanceUnit];
    } else {
        [parameters removeObjectForKey:NAMES_distanceUnit];
    }
}

- (NSNumber *)distanceUnit {
    return [parameters objectForKey:NAMES_distanceUnit];
}

@end
