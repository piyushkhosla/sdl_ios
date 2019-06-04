//
//  SDLSeatLocation.m
//  SmartDeviceLink
//

#import "SDLSeatLocation.h"
#import "SDLGrid.h"

#import "SDLRPCParameterNames.h"
#import "NSMutableDictionary+Store.h"

@implementation SDLSeatLocation

- (instancetype)initWithGrid:(SDLGrid *)grid {
    self = [self init];
    if (!self) {
        return self;
    }

    self.grid = grid;

    return self;
}

- (void)setGrid:(SDLGrid *)grid {
    [self.store sdl_setObject:grid forName:SDLRPCParameterNameGrid];
}

- (SDLGrid *)grid {
    return [self.store sdl_objectForName:SDLRPCParameterNameGrid ofClass:SDLGrid.class error:nil];
}

@end
