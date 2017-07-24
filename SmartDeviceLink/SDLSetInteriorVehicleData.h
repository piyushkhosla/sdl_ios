//
//  SDLSetInteriorVehicleData.h
//

#import "SDLRPCRequest.h"
@class SDLModuleData;

@interface SDLSetInteriorVehicleData : SDLRPCRequest

/**
 * Constructs a new SDLSetInteriorVehicleData object
 */
- (instancetype)init;
/**
 * Constructs a new SDLSetInteriorVehicleData object indicated by the dictionary parameter
 * <p>
 *
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * The module data to set for the requested RC module.
 *
 */
@property (strong) SDLModuleData *moduleData;

@end
