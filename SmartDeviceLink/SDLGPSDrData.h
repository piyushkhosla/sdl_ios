//  SDLGPSDrData.h
//


#import <Foundation/Foundation.h>
#import "SDLRPCMessage.h"


/**
 * Describes the GPS DR data.
 *
 */

@interface SDLGPSDrData : SDLRPCStruct

/**
 * @abstract Constructs a new SDLGPSDrData object
 */
- (instancetype)init;

/**
 * @abstract Constructs a new SDLGPSDrData object indicated by the NSMutableDictionary
 * parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * @abstract The value of longitude in Degrees.
 * Float -180 - 180
 */
@property (strong, nonatomic) NSNumber *longitudeDegrees;

/**
 * @abstract The value of latitude in Degrees.
 * Float -90 - 90
 */
@property (strong, nonatomic) NSNumber *latitudeDegrees;

/**
 * @abstract The value of Altitude in meters.
 * Float -10000 - 10000
 */
@property (strong, nonatomic) NSNumber *altitude;

/**
 * @abstract The heading. North is 0. Resolution is 0.01.
 * Float 0 - 359.99
 */
@property (strong, nonatomic) NSNumber *heading;

/**
 * @abstract The speed in KPH.
 * Float 0 - 500
 */
@property (strong, nonatomic) NSNumber *speed;

@end


