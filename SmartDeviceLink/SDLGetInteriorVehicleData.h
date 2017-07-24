//
//  SDLGetInteriorVehicleData.h
//

#import "SDLRPCRequest.h"
@class SDLModuleType;

@interface SDLGetInteriorVehicleData : SDLRPCRequest

/**
 * Constructs a new SDLGetInteriorVehicleData object
 */
- (instancetype)init;
/**
 * Constructs a new SDLGetInteriorVehicleData object indicated by the dictionary parameter
 * <p>
 *
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * The type of a RC module to retrieve module data from the vehicle.
 * In the future, this should be the Identification of a module.
 *
 */
@property (strong) SDLModuleType *moduleType;

/**
 * If subscribe is true, the head unit will register onInteriorVehicleData notifications for the requested moduelType.
 * If subscribe is false, the head unit will unregister onInteriorVehicleData notifications for the requested moduelType.
 *
 * Required, Boolean, default Value = false
 */
@property (strong) NSNumber *subscribe;

@end
