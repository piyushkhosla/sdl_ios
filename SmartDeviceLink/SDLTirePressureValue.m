//
//  SDLTirePressureValue.m
//  SmartDeviceLink-iOS
//

#import "SDLTirePressureValue.h"
#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"

@implementation SDLTirePressureValue

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

- (void)setLeftFront:(NSNumber *)leftFront {
    [store sdl_setObject:leftFront forName:SDLNameLeftFront];

}

- (NSNumber *)leftFront {
    return [store sdl_objectForName:SDLNameLeftFront];
}

- (void)setRightFront:(NSNumber *)rightFront {
    [store sdl_setObject:rightFront forName:SDLNameRightFront];
}

- (NSNumber *)rightFront {
    return [store sdl_objectForName:SDLNameRightFront];
}

- (void)setLeftRear:(NSNumber *)leftRear {
    [store sdl_setObject:leftRear forName:SDLNameLeftRear];
}

- (NSNumber *)leftRear {
    return [store sdl_objectForName:SDLNameLeftRear];
}

- (void)setRightRear:(NSNumber *)rightRear {
    [store sdl_setObject:rightRear forName:SDLNameRightRear];
}

-(NSNumber *)rightRear {
    return [store sdl_objectForName:SDLNameRightRear];
}

- (void)setInnerLeftRear:(NSNumber *)innerLeftRear {
    [store sdl_setObject:innerLeftRear forName:SDLNameInnerLeftRear];
}

- (NSNumber *)innerLeftRear {
    return [store sdl_objectForName:SDLNameInnerLeftRear];
}

- (void)setInnerRightRear:(NSNumber *)innerRightRear {
    [store sdl_setObject:innerRightRear forName:SDLNameInnerRightRear];
}

- (NSNumber *)innerRightRear {
    return [store sdl_objectForName:SDLNameInnerRightRear];
}

- (void)setFrontRecommended:(NSNumber *)frontRecommended {
    [store sdl_setObject:frontRecommended forName:SDLNameFrontRecommended];
}

- (NSNumber *)frontRecommended {
    return [store sdl_objectForName:SDLNameFrontRecommended];
}

- (void)setRearRecommended:(NSNumber *)rearRecommended {
    [store sdl_setObject:rearRecommended forName:SDLNameRearRecommended];
}

- (NSNumber *)rearRecommended {
    return [store sdl_objectForName:SDLNameRearRecommended];
}

@end
