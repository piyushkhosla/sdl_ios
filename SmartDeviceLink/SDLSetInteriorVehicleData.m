//
//  SDLSetInteriorVehicleData.m
//

#import "SDLSetInteriorVehicleData.h"
#import "SDLNames.h"

@implementation SDLSetInteriorVehicleData

- (instancetype)init {
    if (self = [super initWithName:NAMES_SetInteriorVehicleData]) {
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

@end
