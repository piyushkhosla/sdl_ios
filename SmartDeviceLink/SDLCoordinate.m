//
//  SDLCoordinate.m
//

#import "SDLCoordinate.h"
#import "SDLNames.h"

@implementation SDLCoordinate

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
    if (longitudeDegrees != nil) {
        [store setObject:longitudeDegrees forKey:SDLNameLongitudeDegrees];
    } else {
        [store removeObjectForKey:SDLNameLongitudeDegrees];
    }
}

- (NSNumber *)longitudeDegrees {
    return [store objectForKey:SDLNameLongitudeDegrees];
}

- (void)setLatitudeDegrees:(NSNumber *)latitudeDegrees {
    if (latitudeDegrees != nil) {
        [store setObject:latitudeDegrees forKey:SDLNameLatitudeDegrees];
    } else {
        [store removeObjectForKey:SDLNameLatitudeDegrees];
    }
}

- (NSNumber *)latitudeDegrees {
    return [store objectForKey:SDLNameLatitudeDegrees];
}

@end
