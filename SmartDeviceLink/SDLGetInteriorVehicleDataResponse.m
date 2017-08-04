//
//  SDLGetInteriorVehicleDataResponse.m
//

#import "SDLGetInteriorVehicleDataResponse.h"
#import "SDLModuleData.h"
#import "SDLNames.h"
#import "NSMutableDictionary+Store.h"

NS_ASSUME_NONNULL_BEGIN


@implementation SDLGetInteriorVehicleDataResponse

- (instancetype)init {
    if (self = [super initWithName:SDLNameGetInteriorVehicleData]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setModuleData:(SDLModuleData *)moduleData {
    [parameters sdl_setObject:moduleData forName:SDLNameModuleData];
}

- (SDLModuleData *)moduleData {
    return [parameters sdl_objectForName:SDLNameModuleData];
}

- (void)setIsSubscribed:(nullable NSNumber *)isSubscribed {
    [parameters sdl_setObject:isSubscribed forName:SDLNameIsSubscribed];
}

- (nullable NSNumber *)isSubscribed {
    return [parameters sdl_objectForName:SDLNameIsSubscribed];
}

@end

NS_ASSUME_NONNULL_END

