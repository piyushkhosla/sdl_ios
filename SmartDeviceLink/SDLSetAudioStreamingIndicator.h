//
//  SDLSetAudioStreamingIndicator.h
//

#import "SDLRPCRequest.h"
#import "SDLAudioStreamingIndicator.h"


@interface SDLSetAudioStreamingIndicator : SDLRPCRequest{
}

/**
 * @abstract Constructs a new SDLSetAudioStreamingIndicator object
 */
- (instancetype)init;
/**
 * @abstract Constructs a new SDLSetAudioStreamingIndicator object indicated by the dictionary parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * @abstract Constructs a new SDLSetAudioStreamingIndicator object indicated by the dictionary parameter
 * @param audioStreamingIndicator audioStreamingIdicator to be set
 */
- (instancetype)initWithAudioStreamingIndicator:(SDLAudioStreamingIndicator) audioStreamingIndicator;

@property(strong)SDLAudioStreamingIndicator audioStreamingIndicator;


@end
