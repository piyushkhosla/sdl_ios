//
//  SDLFuelRemainingRangeType.m


#import "NSMutableDictionary+Store.h"
#import "SDLFuelRemainingRangeType.h"
#import "SDLTimeStampType.h"
#import "SDLNames.h"

@implementation SDLFuelRemainingRangeType

- (void)setValue:(NSNumber *)value {
    [store sdl_setObject:value forName:SDLNameValue];
}

- (NSNumber *)value {
    return [store sdl_objectForName:SDLNameValue];
}

- (void)setTimeStamp:(SDLTimeStampType *)timeStamp {
    [store sdl_setObject:timeStamp forName:SDLNameTimestamp];
}

- (SDLTimeStampType *)timeStamp {
    return [store sdl_objectForName:SDLNameTimestamp];
}

@end

