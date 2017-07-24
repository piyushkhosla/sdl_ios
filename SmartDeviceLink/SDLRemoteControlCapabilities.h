//
//  SDLRemoteControlCapabilities.h
//

#import "SDLRPCMessage.h"
@class  SDLClimateControlCapabilities;
@class  SDLRadioControlCapabilities;
@class  SDLButtonCapabilities;

@interface SDLRemoteControlCapabilities : SDLRPCStruct

/**
 * @abstract If included, the platform supports RC climate controls.
 * For this baseline version, maxsize=1. i.e. only one climate control module is supported.
 *
 * Optional, Array of SDLClimateControlCapabilities, Array length 1 - 100
 */
@property (copy, nonatomic) NSArray<SDLClimateControlCapabilities *> *climateControlCapabilities;

/**
 * @abstract If included, the platform supports RC radio controls.
 * For this baseline version, maxsize=1. i.e. only one radio control module is supported.
 *
 * Optional, Array of SDLClimateControlCapabilities, Array length 1 - 100
 */
@property (copy, nonatomic) NSArray<SDLRadioControlCapabilities *> *radioControlCapabilities;

/**
 * @abstract If included, the platform supports RC button controls with the included button names.
 *
 * Optional, Array of SDLClimateControlCapabilities, Array length 1 - 100
 */
@property (copy, nonatomic) NSArray<SDLButtonCapabilities *> *buttonCapabilities;






@end
