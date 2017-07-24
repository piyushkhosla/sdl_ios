//
//  SDLGetSystemCapabilityResponse.m
//

#import "SDLGetSystemCapabilityResponse.h"
#import "SDLNames.h"
#import "SDLSystemCapability.h"

@implementation SDLGetSystemCapabilityResponse

- (instancetype)init {
    if (self = [super initWithName:NAMES_GetSystemCapability]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setSystemCapability:(SDLSystemCapability *)systemCapability {
    if (systemCapability != nil) {
        [parameters setObject:systemCapability forKey:NAMES_systemCapability];
    } else {
        [parameters removeObjectForKey:NAMES_systemCapability];
    }
}

- (SDLSystemCapability *)systemCapability {
     return [parameters objectForKey:NAMES_systemCapability];
}

@end
