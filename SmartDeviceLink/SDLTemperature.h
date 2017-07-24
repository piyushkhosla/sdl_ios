//
//  SDLTemperature.h
//

#import "SDLRPCMessage.h"
@class  SDLTemperatureUnit;

@interface SDLTemperature : SDLRPCStruct

/**
 * @abstract Temperature Unit
 *
 */
@property (strong) SDLTemperatureUnit *unit;

/**
 * @abstract Temperature Value in TemperatureUnit specified unit. Range depends on OEM and is not checked by SDL
 *
 * FLoat value
 */
@property (strong) NSNumber *value;


@end
