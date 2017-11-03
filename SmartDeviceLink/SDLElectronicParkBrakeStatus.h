//
//  SDLElectronicParkBrakeStatus.h
//  SmartDeviceLink
//

#import "SDLEnum.h"

typedef SDLEnum SDLElectronicParkBrakeStatus SDL_SWIFT_ENUM;

/**
 * @abstract Park brake actuators have been fully applied.
 *
 */
extern SDLElectronicParkBrakeStatus const SDLElectronicParkBrakeStatusClosed;

/**
 * @abstract Park brake actuators are transitioning to either Apply/Closed or Release/Open state.
 *
 */
extern SDLElectronicParkBrakeStatus const SDLElectronicParkBrakeStatusTransition;

/**
 * @abstract Park brake actuators are released.
 *
 */
extern SDLElectronicParkBrakeStatus const SDLElectronicParkBrakeStatusOpen;

/**
 * @abstract When driver pulls the Electronic Park Brake switch while driving "at speed".
 *
 */
extern SDLElectronicParkBrakeStatus const SDLElectronicParkBrakeStatusDriveActive;

/**
 * @abstract When system has a fault or is under maintenance.
 *
 */
extern SDLElectronicParkBrakeStatus const SDLElectronicParkBrakeStatusFault;

