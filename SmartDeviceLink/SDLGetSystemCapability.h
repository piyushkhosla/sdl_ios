//
//  SDLGetSystemCapability.h
//

#import "SDLRPCRequest.h"
@class SDLSystemCapabilityType;

@interface SDLGetSystemCapability : SDLRPCRequest

/**
 * Constructs a new SDLGetSystemCapability object
 */
- (instancetype)init;

/**
 * Constructs a new SDLGetSystemCapability object indicated by the dictionary parameter
 *
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

- (instancetype)initWithsystemCapabilityType:(SDLSystemCapabilityType *)systemCapabilityType;

/**
 * @abstract The type of system capability to get more information on
 * 
 * Required, SDLSystemCapabilityType
 */
@property (strong) SDLSystemCapabilityType *systemCapabilityType;


@end
