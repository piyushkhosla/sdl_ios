//
//  SDLElectronicParkBrakeStatus.h
//  SmartDeviceLink
//

#import <SmartDeviceLink/SmartDeviceLink.h>

@interface SDLElectronicParkBrakeStatus : SDLEnum

/**
 * Convert String to SDLElectronicParkBrakeStatus
 *
 * @param value The value of the string to get an object for
 *
 * @return SDLElectronicParkBrakeStatus
 */
+ (SDLElectronicParkBrakeStatus *)valueOf:(NSString *)value;

/**
 * @abstract Store the enumeration of all possible SDLElectronicParkBrakeStatus
 *
 * @return an array that store all possible SDLElectronicParkBrakeStatus
 */
+ (NSArray *)values;

/**
 * @abstract Park brake actuators have been fully applied.
 *
 * @return a SDLElectronicParkBrakeStatus with value of *CLOSED*
 */
+ (SDLElectronicParkBrakeStatus *)CLOSED;

/**
 * @abstract Park brake actuators are transitioning to either Apply/Closed or Release/Open state.
 *
 * @return a SDLElectronicParkBrakeStatus with value of *TRANSITION*
 */
+ (SDLElectronicParkBrakeStatus *)TRANSITION;

/**
 * @abstract Park brake actuators are released.
 *
 * @return a SDLElectronicParkBrakeStatus with value of *OPEN*
 */
+ (SDLElectronicParkBrakeStatus *)OPEN;

/**
 * @abstract When driver pulls the Electronic Park Brake switch while driving "at speed".
 *
 * @return a SDLElectronicParkBrakeStatus with value of *DRIVE_ACTIVE*
 */
+ (SDLElectronicParkBrakeStatus *)DRIVE_ACTIVE;

/**
 * @abstract When system has a fault or is under maintenance.
 *
 * @return a SDLElectronicParkBrakeStatus with value of *FAULT*
 */
+ (SDLElectronicParkBrakeStatus *)FAULT;

@end
