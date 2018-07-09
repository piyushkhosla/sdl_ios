//  SDLTimeStampType.m
//

#import "SDLTimeStampType.h"
#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"

@implementation SDLTimeStampType

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

- (void)setSecond:(NSNumber *)second {
    [store sdl_setObject:second forName:SDLNameSecond];}

- (NSNumber *)second {
    return [store sdl_objectForName:SDLNameSecond];
}

- (void)setMicroSecond:(NSNumber *)microSecond {
    [store sdl_setObject:microSecond forName:SDLNameMicroSecond];
}

- (NSNumber *)microSecond {
    return [store sdl_objectForName:SDLNameMicroSecond];
}

@end


