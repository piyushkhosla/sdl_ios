//
//  SDLGetInteriorVehicleData.m
//

#import "SDLGetInteriorVehicleData.h"
#import "SDLNames.h"
#import "SDLModuleType.h"

@implementation SDLGetInteriorVehicleData

- (instancetype)init {
    if (self = [super initWithName:NAMES_GetInteriorVehicleData]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setModuleType:(SDLModuleType *)moduleType {
    if (moduleType != nil) {
        [parameters setObject:moduleType forKey:NAMES_moduleType];
    } else {
        [parameters removeObjectForKey:NAMES_moduleType];
    }
}

- (SDLModuleType *)moduleType {
    return [parameters objectForKey:NAMES_moduleType];
}


- (void)setSubscribe:(NSNumber *)subscribe {
    if (subscribe != nil) {
        [parameters setObject:subscribe forKey:NAMES_subscribe];
    } else {
        [parameters removeObjectForKey:NAMES_subscribe];
    }
}

- (NSNumber *)subscribe {
    return [parameters objectForKey:NAMES_subscribe];
}


@end
