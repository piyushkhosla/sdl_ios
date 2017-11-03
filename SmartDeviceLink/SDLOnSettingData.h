//
//  SDLOnSettingData.h
//

#import "SDLRPCNotification.h"
#import "SDLDisplayMode.h"
#import "SDLDistanceUnit.h"
#import "SDLTemperatureUnit.h"

/**
 * Callback for the setting data change notification.
 *
 */
@interface SDLOnSettingData : SDLRPCNotification

/**
 *
 * @see SDLDisplayMode
 *
 */
@property (nullable, strong, nonatomic) SDLDisplayMode seekTime;

/**
 *
 * @see SDLDistanceUnit
 *
 */
@property (nullable, strong, nonatomic) SDLDistanceUnit distanceUnit;

/**
 *
 * @see SDLTemperatureUnit
 *
 */
@property (nullable, strong, nonatomic) SDLTemperatureUnit temperatureUnit;

@end
