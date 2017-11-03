//
//  SDLSetAudioStreamingIndicator.m
//

#import "SDLSetAudioStreamingIndicator.h"
#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"

@implementation SDLSetAudioStreamingIndicator

- (instancetype)init {
    if (self = [super initWithName:SDLNameSetAudioStreamingIndicator]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (instancetype)initWithAudioStreamingIndicator:(SDLAudioStreamingIndicator) audioStreamingIndicator  {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.audioStreamingIndicator = audioStreamingIndicator;
   
    return self;
}

- (void)setAudioStreamingIndicator:(SDLAudioStreamingIndicator )audioStreamingIndicator {
    [parameters sdl_setObject:audioStreamingIndicator forName:SDLNameAudioStreamingIndicator];
}

- (SDLAudioStreamingIndicator )audioStreamingIndicator {
    return [parameters sdl_objectForName:SDLNameAudioStreamingIndicator];
}

@end
