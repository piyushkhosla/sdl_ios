//  SDLGPSDrData.m
//

#import "SDLGPSDrData.h"
#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"

@implementation SDLGPSDrData

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

- (void)setLongitudeDegrees:(NSNumber *)longitudeDegrees {
    [store sdl_setObject:longitudeDegrees forName:SDLNameLongitudeDegrees];
}

- (NSNumber *)longitudeDegrees {
    return [store sdl_objectForName:SDLNameLongitudeDegrees];
}

- (void)setLatitudeDegrees:(NSNumber *)latitudeDegrees {
    [store sdl_setObject:latitudeDegrees forName:SDLNameLatitudeDegrees];
}

- (NSNumber *)latitudeDegrees {
    return [store sdl_objectForName:SDLNameLatitudeDegrees];
}

- (void)setAltitude:(NSNumber *)altitude {
    [store sdl_setObject:altitude forName:SDLNameAltitude];
}

- (NSNumber *)altitude {
    return [store sdl_objectForName:SDLNameAltitude];
}

- (void)setSpeed:(NSNumber *)speed {
    [store sdl_setObject:speed forName:SDLNameSpeed];
}

- (NSNumber *)speed {
    return [store sdl_objectForName:SDLNameSpeed];
}

- (void)setHeading:(NSNumber *)heading {
    [store sdl_setObject:heading forName:SDLNameHeading];
}

- (NSNumber *)heading {
    return [store sdl_objectForName:SDLNameHeading];
}

@end

