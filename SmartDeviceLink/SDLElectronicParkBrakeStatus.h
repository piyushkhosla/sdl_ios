//  SDLElectronicParkBrakeStatus.h
//

#import "SDLEnum.h"

/**
 * Enumeration that describes possible states of Electronic Park Brake.
 *
 * @since SDL 1.0
 */
typedef SDLEnum SDLElectronicParkBrakeStatus SDL_SWIFT_ENUM;

/**
 * @abstract  Park brake actuators have been fully applied.
 */
extern SDLElectronicParkBrakeStatus const SDLElectronicParkBrakeClosed;

/**
 * @abstract Park brake actuators are released.
 */
extern SDLElectronicParkBrakeStatus const SDLElectronicParkBrakeStateOpen;

/**
 * @abstract  Park brake actuators are transitioning to either Apply/Closed or Release/Open state.
 */
extern SDLElectronicParkBrakeStatus const SDLElectronicParkBrakeStateTransition;

/**
 * @abstract When driver pulls the Electronic Park Brake switch while driving "at speed".
 */
extern SDLElectronicParkBrakeStatus const SDLElectronicParkBrakeStateDriveActive;

/**
 * @abstract  When system has a fault or is under maintenance..
 */
extern SDLElectronicParkBrakeStatus const SDLElectronicParkBrakeStateFault;
