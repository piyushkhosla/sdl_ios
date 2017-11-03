//  SDLFuelRange.h
//  

#import "SDLRPCMessage.h"
#import "SDLFuelType.h"

@interface SDLFuelRange : SDLRPCStruct {
}

/**
 * Constructs a newly allocated SDLFuelRange object
 */
- (instancetype)init;

/**
 * Constructs a newly allocated SDLFuelRange object indicated by the dictionary parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * @abstract Describes Kind of Fuel Type used
 *
 * Optional, FuelType
 */
@property (strong) SDLFuelType type;

/**
 * @abstract Describes The estimate range in KM 
 * the vehicle can travel based on fuel level and consumption.
 *
 * Optional, Float 0 - 10000
 */
@property (strong) NSNumber *range;


@end
