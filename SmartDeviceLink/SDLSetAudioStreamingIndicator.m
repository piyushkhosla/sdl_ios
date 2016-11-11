//
//  SDLSetAudioStreamingIndicator.m
//

#import "SDLSetAudioStreamingIndicator.h"
#import "SDLAudioStreamingIndicator.h"
#import "SDLNames.h"

@implementation SDLSetAudioStreamingIndicator

- (instancetype)init {
    if (self = [super initWithName:NAMES_SetAudioStreamingIndicator]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (instancetype)initWithAudioStreamingIndicator:(SDLAudioStreamingIndicator*) audioStreamingIndicator  {
    self = [self init];
    if (!self) {
        return nil;
    }
    self.audioStreamingIndicator = audioStreamingIndicator;
   
    return self;
}

- (void)setAudioStreamingIndicator:(SDLAudioStreamingIndicator *)audioStreamingIndicator {
    if (audioStreamingIndicator != nil) {
        [parameters setObject:audioStreamingIndicator forKey:NAMES_audioStreamingIndicator];
    } else {
        [parameters removeObjectForKey:NAMES_audioStreamingIndicator];
    }
}

- (SDLAudioStreamingIndicator *)audioStreamingIndicator {
    return [parameters objectForKey:NAMES_audioStreamingIndicator];
}

@end
