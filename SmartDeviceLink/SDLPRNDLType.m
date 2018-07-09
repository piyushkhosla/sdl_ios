//  SDLPRNDLType.m
//

#import "NSMutableDictionary+Store.h"
#import "SDLPRNDLType.h"
#import "SDLTimeStampType.h"
#import "SDLNames.h"

@implementation SDLPRNDLType

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

- (void)setValue:(SDLPRNDL)value {
    [store sdl_setObject:value forName:SDLNameValue];
}
- (SDLPRNDL)value {
    return [store sdl_objectForName:SDLNameValue];
}

- (void)setTimeStamp:(SDLTimeStampType *)timeStamp {
    [store sdl_setObject:timeStamp forName:SDLNameTimestamp];
}

- (SDLTimeStampType *)timeStamp {
    return [store sdl_objectForName:SDLNameTimestamp];
}

@end

