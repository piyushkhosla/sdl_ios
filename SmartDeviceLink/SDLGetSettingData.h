//
//  SDLGetSettingData.h
//


#import "SDLRPCRequest.h"

/**
Non periodic setting data read request.
 */
@interface SDLGetSettingData : SDLRPCRequest {

}

/**
 * Constructs a new SDLGetSettingData object
 */
- (instancetype)init;

/**
 * Constructs a new SDLGetSettingData object indicated by the dictionary parameter
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
