//
//  SDLAudioStreamingIndicator.m
//

#import "SDLAudioStreamingIndicator.h"

SDLAudioStreamingIndicator *SDLAudioStreamingIndicator_PLAY_PAUSE = nil;
SDLAudioStreamingIndicator *SDLAudioStreamingIndicator_PLAY = nil;
SDLAudioStreamingIndicator *SDLAudioStreamingIndicator_PAUSE    = nil;

NSArray *SDLAudioStreamingIndicator_values = nil;

@implementation SDLAudioStreamingIndicator

+ (SDLAudioStreamingIndicator *)valueOf:(NSString *)value {
    for (SDLAudioStreamingIndicator *item in SDLAudioStreamingIndicator.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLAudioStreamingIndicator_values == nil) {
        SDLAudioStreamingIndicator_values = @[
                                              SDLAudioStreamingIndicator.PLAY_PAUSE,
                                              SDLAudioStreamingIndicator.PLAY,
                                              SDLAudioStreamingIndicator.PAUSE,
                                              ];
    }
    return SDLAudioStreamingIndicator_values;
}

+ (SDLAudioStreamingIndicator *)PLAY_PAUSE {
    if (SDLAudioStreamingIndicator_PLAY_PAUSE == nil) {
        SDLAudioStreamingIndicator_PLAY_PAUSE = [[SDLAudioStreamingIndicator alloc] initWithValue:@"PLAY_PAUSE"];
    }
    return SDLAudioStreamingIndicator_PLAY_PAUSE;
}


+ (SDLAudioStreamingIndicator *)PLAY {
    if (SDLAudioStreamingIndicator_PLAY == nil) {
        SDLAudioStreamingIndicator_PLAY = [[SDLAudioStreamingIndicator alloc] initWithValue:@"PLAY"];
    }
    return SDLAudioStreamingIndicator_PLAY;
}

+ (SDLAudioStreamingIndicator *)PAUSE {
    if (SDLAudioStreamingIndicator_PAUSE == nil) {
        SDLAudioStreamingIndicator_PAUSE = [[SDLAudioStreamingIndicator alloc] initWithValue:@"PAUSE"];
    }
    return SDLAudioStreamingIndicator_PAUSE;
}

@end
