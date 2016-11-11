//
//  SDLOnSeekMediaClockTimer.m
//

#import "SDLOnSeekMediaClockTimer.h"
#import "SDLNames.h"
#import "SDLStartTime.h"

@implementation SDLOnSeekMediaClockTimer

- (instancetype)init {
    if (self = [super initWithName:NAMES_OnSeekMediaClockTimer]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setSeekTime:(SDLStartTime *)seekTime {
    if (seekTime != nil) {
        [parameters setObject:seekTime forKey:NAMES_seekTime];
    } else {
        [parameters removeObjectForKey:NAMES_seekTime];
    }
}

- (SDLStartTime *)seekTime {
    NSObject *obj = [parameters objectForKey:NAMES_seekTime];
    if (obj == nil || [obj isKindOfClass:SDLStartTime.class]) {
        return (SDLStartTime *)obj;
    } else {
        return [[SDLStartTime alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

@end