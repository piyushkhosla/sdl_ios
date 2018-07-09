//
//  SDLBrakePedalPositionType.m

#import "NSMutableDictionary+Store.h"
#import "SDLBrakePedalPositionType.h"
#import "SDLTimeStampType.h"
#import "SDLNames.h"

@implementation SDLBrakePedalPositionType


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

