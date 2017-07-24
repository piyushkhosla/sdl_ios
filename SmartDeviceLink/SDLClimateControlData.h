//
//  SDLClimateControlData.h
//

#import "SDLRPCMessage.h"
@class SDLTemperature;
@class SDLDefrostZone;
@class SDLVentilationMode;


@interface SDLClimateControlData : SDLRPCStruct

/**
 * @abstract Speed of Fan in integer
 *
 * Optional, MinValue- 0 MaxValue= 100
 */
@property (strong) NSNumber *fanSpeed;

/**
 * @abstractThe Current Temperature in SDLTemperature
 *
 * Optional
 */
@property (strong) SDLTemperature *currentTemperature;

/**
 * @abstract Desired Temperature in SDLTemperature
 *
 * Optional
 */
@property (strong) SDLTemperature *desiredTemperature;

/**
 * @abstract Represents if AC is enabled.
 *
 * Optional, Boolean
 */
@property (strong) NSNumber *acEnable;

/**
 * @abstract Represents if circulation of air is enabled.
 *
 * Optional, Boolean
 */
@property (strong) NSNumber *circulateAirEnable;

/**
 * @abstract Represents if auto mode is enabled.
 *
 * Optional, Boolean
 */
@property (strong) NSNumber *autoModeEnable;

/**
 * @abstract Represents the kind of defrost zone
 *
 * Optional, SDLDefrostZone
 */
@property (strong) SDLDefrostZone *defrostZone;

/**
 * @abstract Represents if dual mode is enabled.
 *
 * Optional, Boolean
 */
@property (strong) NSNumber *dualModeEnable;

/**
 * @abstract Represents if ac max is enabled.
 *
 * Optional, Boolean
 */
@property (strong) NSNumber *acMaxEnable;

/**
 * @abstract Represents the kind of Ventilation zone
 *
 * Optional, SDLDefrostZone
 */
@property (strong) SDLVentilationMode *ventilationMode;

@end
