//
//  SDLTurnSignal.h
//  SmartDeviceLink-iOS//


/**
 
 */
#import "SDLEnum.h"


/**
 * Specifies  type of SDLTurnSignal, which gives signal about next turn.
 *
 */
typedef SDLEnum SDLTurnSignal SDL_SWIFT_ENUM;

/**
 * @abstract SDLTurnSignal : OFF
 */
extern SDLTurnSignal const SDLTurnSignalOff;

/**
 * @abstract SDLTurnSignal : LEFT
 */
extern SDLTurnSignal const SDLTurnSignalLeft;

/**
 * @abstract SDLTurnSignal : RIGHT
 */
extern SDLTurnSignal const SDLTurnSignalRight;

/**
 * @abstract SDLTurnSignal : UNUSED
 */
extern SDLTurnSignal const SDLTurnSignalUnused;
