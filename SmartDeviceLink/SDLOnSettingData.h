//
//  SDLOnSettingData.h
//

#import "SDLRPCNotification.h"

@class SDLDisplayMode;
@class SDLDistanceUnit;
@class SDLTemperatureUnit;


/**
 * Callback for the setting data change notification.
 *
 */
@interface SDLOnSettingData : SDLRPCNotification

/**
 * Constructs a newly allocated SDLOnSettingData object
 */
- (instancetype)init;

/**
 * Constructs a newly allocated SDLOnSettingData object indicated by the dictionary parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 *
 * @see SDLDisplayMode
 *
 */
@property (strong) SDLDisplayMode *seekTime;

/**
 *
 * @see SDLDisplayMode
 *
 */
@property (strong) SDLDistanceUnit *distanceUnit;

/**
 *
 * @see SDLDisplayMode
 *
 */
@property (strong) SDLTemperatureUnit *temperatureUnit;

@end
