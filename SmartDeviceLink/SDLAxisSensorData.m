//  SDLAxisSensorData.m
//

#import "NSMutableDictionary+Store.h"
#import "SDLAxisSensorData.h"
#import "SDLNames.h"

@implementation SDLAxisSensorData

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


- (void)setCumulativeValue0:(NSNumber *)cumulativeValue0 {
    [store sdl_setObject:cumulativeValue0 forName:SDLNameCumulativeValue0];
}

- (NSNumber *)cumulativeValue0 {
    return [store sdl_objectForName:SDLNameCumulativeValue0];
}

- (void)setCumulativeValue1:(NSNumber *)cumulativeValue1 {
    [store sdl_setObject:cumulativeValue1 forName:SDLNameCumulativeValue1];
}

- (NSNumber *)cumulativeValue1 {
    return [store sdl_objectForName:SDLNameCumulativeValue1];
}

- (void)setCumulativeValue2:(NSNumber *)cumulativeValue2 {
    [store sdl_setObject:cumulativeValue2 forName:SDLNameCumulativeValue2];
}

- (NSNumber *)cumulativeValue2 {
    return [store sdl_objectForName:SDLNameCumulativeValue2];
}

@end
