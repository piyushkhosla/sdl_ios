//
//  SDLGetSystemCapability.m
//

#import "SDLGetSystemCapability.h"
#import "SDLNames.h"
#import "SDLSystemCapability.h"

@implementation SDLGetSystemCapability

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

- (instancetype)initWithsystemCapabilityType:(SDLSystemCapabilityType *)systemCapabilityType {
    self = [self init];
    if (!self) {
        return nil;
    }
    
    self.systemCapabilityType = systemCapabilityType;
    return self;

}



- (void)setSystemCapabilityType:(SDLSystemCapabilityType *)systemCapabilityType {
    if (systemCapabilityType != nil) {
        [parameters setObject:systemCapabilityType forKey:NAMES_systemCapabilityType];
    } else {
        [parameters removeObjectForKey:NAMES_systemCapabilityType];
    }
    
}

- (SDLSystemCapabilityType *)systemCapabilityType {
    return [parameters objectForKey:NAMES_systemCapabilityType];
}


@end
