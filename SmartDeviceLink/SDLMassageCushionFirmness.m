//  SDLMassageCushionFirmness.m
//

#import "SDLNames.h"
#import "SDLMassageCushionFirmness.h"
#import "NSMutableDictionary+Store.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLMassageCushionFirmness

- (instancetype)initWithMassageCushion:(SDLMassageCushion)cushion firmness:(UInt16)firmness {
    self = [super init];
    if (!self) {
        return nil;
    }

    self.cushion = cushion;
    self.firmness = @(firmness);

    return self;
}

- (void)setCushion:(SDLMassageCushion)cushion {
    [store sdl_setObject:cushion forName:SDLNameCushion];
}

- (SDLMassageCushion)cushion {
    return [store sdl_objectForName:SDLNameCushion];
}

- (void)setFirmness:(NSNumber<SDLInt> *)firmness {
    [store sdl_setObject:firmness forName:SDLNamefirmness];
}

- (NSNumber<SDLInt> *)firmness {
    return [store sdl_objectForName:SDLNamefirmness];
}

@end

NS_ASSUME_NONNULL_END