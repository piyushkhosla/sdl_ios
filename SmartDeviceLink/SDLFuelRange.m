//  SDLFuelRange.m
//


#import "SDLFuelRange.h"
#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"


NS_ASSUME_NONNULL_BEGIN

@implementation SDLFuelRange

- (instancetype)initWithType:(SDLFuelType)type range:(double)range {
    if (self = [super init]) {
        self.type = type;
        self.range = @(range);
    }
    return self;
}

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (void)setType:(nullable SDLFuelType)type {
    [store sdl_setObject:type forName:SDLNameFuelType];
}

- (nullable SDLFuelType)type {
    return [store sdl_objectForName:SDLNameFuelType];
}

- (void)setRange:(nullable NSNumber<SDLFloat> *)range {
    [store sdl_setObject:range forName:SDLNameFuelRange];
}

- (nullable NSNumber<SDLFloat> *)range {
    return [store sdl_objectForName:SDLNameFuelRange];
}


@end
NS_ASSUME_NONNULL_END
