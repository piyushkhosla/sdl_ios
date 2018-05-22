//  SDLAudioStreamingIndicator.h
//

#import "SDLEnum.h"

/**
 * Indicates the playback status of a media app.
 *
 */
typedef SDLEnum SDLAudioStreamingIndicator SDL_SWIFT_ENUM;

/**
 * @abstract Default playback indicator.
 */
extern SDLAudioStreamingIndicator const SDLAudioStreamingIndicatorPlayPause;

/**
 * @abstract Indicates that a button press of the Play/Pause button would start the playback.
 */
extern SDLAudioStreamingIndicator const SDLAudioStreamingIndicatorPlay;

/**
 * @abstract Indicates that a button press of the Play/Pause button would pause the current playback.
 */
extern SDLAudioStreamingIndicator const SDLAudioStreamingIndicatorPause;

/**
 * @abstract Indicates that a button press of the Play/Pause button would stop the current playback.
 */
extern SDLAudioStreamingIndicator const SDLAudioStreamingIndicatorStop;
