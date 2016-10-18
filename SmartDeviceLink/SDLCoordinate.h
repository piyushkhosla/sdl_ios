//
//  SDLCoordinate.h
//

#import "SDLRPCStruct.h"

/**
 * Coordinates of location
 *
 **/
@interface SDLCoordinate : SDLRPCStruct

/**
 * Constructs a newly allocated SDLCoordinate object
 */
- (instancetype)init;

/**
 * Constructs a newly allocated SDLCoordinate object indicated by the dictionary parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * @abstract Latitude of the location
 *
 * Required, double -90 - 90
 */
@property (strong) NSNumber *latitudeDegrees;

/**
 * @abstract Longitude of the location
 *
 * Required, double -180 - 180
 */
@property (strong) NSNumber *longitudeDegrees;

@end
