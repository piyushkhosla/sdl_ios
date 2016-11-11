//
//  SDLSubscribeSettingData.h
//


#import "SDLRPCRequest.h"

@interface SDLSubscribeSettingData : SDLRPCRequest{
}

/**
 * Constructs a new SDLSubscribeSettingData object
 */
- (instancetype)init;

/**
 * Constructs a new SDLSubscribeSettingData object indicated by the dictionary parameter
 *
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * @abstract The display mode of HMI
 */
@property (strong) NSNumber *displayMode;


/**
 * @abstract The unit for showing distance
 */
@property (strong) NSNumber *distanceUnit;


/**
 * @abstract The unit for showing temperature
 */
@property (strong) NSNumber *temperatureUnit;

@end
