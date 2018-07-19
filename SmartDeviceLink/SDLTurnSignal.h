//  SDLTurnSignal.h
//


#import "SDLEnum.h"

/**
 * The list of possible status of the turn light indicator.
 *
 * @since SDL 1.0
 */
typedef SDLEnum SDLTurnSignal SDL_SWIFT_ENUM;

/**
 * @abstract Turn signal is OFF.
 */
extern SDLTurnSignal const SDLTurnSignalOff;

/**
 * @abstract Left turn signal is on.
 */
extern SDLTurnSignal const SDLTurnSignalLeft;

/**
 * @abstract Right turn signal is on.
 */
extern SDLTurnSignal const SDLTurnSignalRight;

/**
 * @abstract Both signals (left and right) are on..
 */
extern SDLTurnSignal const SDLTurnSignalBoth;
