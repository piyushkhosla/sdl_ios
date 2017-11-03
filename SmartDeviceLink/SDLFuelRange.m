//  SDLFuelRange.m
//

#import "SDLFuelRange.h"
#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"

@implementation SDLFuelRange

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setFuelType:(SDLFuelType)fuelType {
    [store sdl_setObject:fuelType forName:SDLNameFuelType];
}

- (SDLFuelType)fuelType {
    return [store sdl_objectForName:SDLNameFuelType];
}

- (void)setRange:(NSNumber *)range {
    [store sdl_setObject:range forName:SDLNameFuelRange];
}

- (NSNumber *)range {
    return [store sdl_objectForName:SDLNameFuelRange];
}


@end
