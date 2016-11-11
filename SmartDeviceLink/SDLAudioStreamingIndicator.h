//
//  SDLAudioStreamingIndicator.h
//


#import "SDLEnum.h"

@interface SDLAudioStreamingIndicator : SDLEnum

/**
 @abstract get SDLAudioStreamingIndicator according value string
 @param value NSString
 @return SDLAudioStreamingIndicator object
 */
+ (SDLAudioStreamingIndicator *)valueOf:(NSString *)value;
/**
 @abstract declare an array to store all possible SDLAudioStreamingIndicator values
 @return the array
 */
+ (NSArray *)values;

/**
 @return Indicates to use the Play/Pause icon.
 **/
+ (SDLAudioStreamingIndicator *)PLAY_PAUSE;

/**
 @return Indicates to use the Play icon.
 **/
+ (SDLAudioStreamingIndicator *)PLAY;

/**
 @return Indicates to use the Pause icon.
 **/
+ (SDLAudioStreamingIndicator *)PAUSE;


@end
