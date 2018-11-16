//
//  SDLOnSeekMediaClockTimer.m
//

#import "SDLOnSeekMediaClockTimer.h"
#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"
#import "SDLStartTime.h"

@implementation SDLOnSeekMediaClockTimer

- (instancetype)init {
    if (self = [super initWithName:SDLNameOnSeekMediaClockTimer]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setSeekTime:(SDLStartTime *)seekTime {
    [parameters sdl_setObject:seekTime forName:SDLNameSeekTime];
}

- (SDLStartTime *)seekTime {
    return [parameters sdl_objectForName:SDLNameSeekTime];
}

@end
