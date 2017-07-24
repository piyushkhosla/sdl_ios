//
//  SDLRadioControlData.h
//

#import "SDLRPCMessage.h"
@class  SDLRadioBand;
@class  SDLRadioState;
@class SDLRdsData;

@interface SDLRadioControlData : SDLRPCStruct

/**
 * @abstract The integer part of the frequency ie for 101.7 this value should be 101
 *
 * Integer
 */
@property (strong) NSNumber *frequencyInteger;

/**
 * @abstract The fractional part of the frequency for 101.7 is 7
 *
 * Integer
 */
@property (strong) NSNumber *frequencyFraction;

/**
 * @abstract Radio band value
 *
 * SDLRadioBand
 */
@property (strong) SDLRadioBand *band;

@property (strong) SDLRdsData *rdsData;

/**
 * @abstract number of HD sub-channels if available
 *
 * Integer value Min Value - 1 Max Value -3
 */
@property (strong) NSNumber *availableHDs;

/**
 * @abstract Current HD sub-channel if available
 *
 * Integer value Min Value - 1 Max Value -3
 */
@property (strong) NSNumber *hdChannel;

/**
 * @abstract Signal Strength Value
 *
 * Integer value Min Value - 0 Max Value - 100
 */
@property (strong) NSNumber *signalStrength;

/**
 * @abstract If the signal strength falls below the set value for this parameter, the radio will tune to an alternative frequency
 *
 * Integer value Min Value - 0 Max Value - 100
 */
@property (strong) NSNumber *signalChangeThreshold;

/**
 * @abstract  True if the radio is on, false is the radio is off
 *
 * Boolean value
 */
@property (strong) NSNumber *radioEnable;


@property (strong) SDLRadioState *state;


@end
