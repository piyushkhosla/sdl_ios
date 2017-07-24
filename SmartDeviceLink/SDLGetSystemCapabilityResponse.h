//
//  SDLGetSystemCapabilityResponse.h
//

#import "SDLRPCResponse.h"
@class SDLSystemCapability;

@interface SDLGetSystemCapabilityResponse : SDLRPCResponse

- (instancetype)init;
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

@property (strong) SDLSystemCapability *systemCapability;


@end
