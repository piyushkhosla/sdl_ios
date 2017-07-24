//
//  SDLGetInteriorVehicleDataResponse.m
//

#import "SDLGetInteriorVehicleDataResponse.h"
#import "SDLModuleData.h"
#import "SDLNames.h"

@implementation SDLGetInteriorVehicleDataResponse

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

- (void)setModuleData:(SDLModuleData *)moduleData {
    if (moduleData != nil) {
        [parameters setObject:moduleData forKey:NAMES_moduleData];
    } else {
        [parameters removeObjectForKey:NAMES_moduleData];
    }
}

- (SDLModuleData *)moduleData {
    return [parameters objectForKey:NAMES_moduleData];
}

- (void)setIsSubscribed:(NSNumber *)isSubscribed {
    if (isSubscribed != nil) {
        [parameters setObject:isSubscribed forKey:NAMES_isSubscribed];
    } else {
        [parameters removeObjectForKey:NAMES_isSubscribed];
    }
}

- (NSNumber *)isSubscribed {
    return [parameters objectForKey:NAMES_isSubscribed];
}

@end
