//
//  SDLOnInteriorVehicleData.h
//

#import "SDLRPCNotification.h"
@class SDLModuleData;

@interface SDLOnInteriorVehicleData : SDLRPCNotification

/**
 *Constructs a newly allocated SDLOnInteriorVehicleData object
 */
- (instancetype)init;

/**
 * Constructs a newly allocated SDLOnInteriorVehicleData object indicated by the dictionary parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;


@property (strong) SDLModuleData *moduleData;


@end
