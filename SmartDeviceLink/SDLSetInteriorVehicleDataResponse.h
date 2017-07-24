//
//  SDLSetInteriorVehicleDataResponse.h
//

#import "SDLRPCResponse.h"
@class SDLModuleData;

/**
 * Used to set the values of one remote control module
 *
 */
@interface SDLSetInteriorVehicleDataResponse : SDLRPCResponse

- (instancetype)init;
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

@property (strong) SDLModuleData *moduleData;

@end
