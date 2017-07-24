//
//  SDLSystemCapability.m
//

#import "SDLSystemCapability.h"
#import "SDLNames.h"
#import "SDLNavigationCapability.h"
#import "SDLPhoneCapability.h"
#import "SDLRemoteControlCapabilities.h"

@implementation SDLSystemCapability

- (void)setSystemCapabilityType:(SDLSystemCapabilityType *)systemCapabilityType {
    if (systemCapabilityType != nil) {
        [store setObject:systemCapabilityType forKey:NAMES_systemCapabilityType];
    } else {
        [store removeObjectForKey:NAMES_systemCapabilityType];
    }
}

- (SDLSystemCapabilityType *)systemCapabilityType {
    return [store objectForKey:NAMES_systemCapabilityType];

}

- (void)setNavigationCapability:(SDLNavigationCapability *)navigationCapability {
    if (navigationCapability != nil) {
        [store setObject:navigationCapability forKey:NAMES_navigationCapability];
    } else {
        [store removeObjectForKey:NAMES_navigationCapability];
    }
}

- (SDLNavigationCapability *)navigationCapability {
    return [store objectForKey:NAMES_navigationCapability];

}

- (void)setPhoneCapability:(SDLPhoneCapability *)phoneCapability {
    if (phoneCapability != nil) {
        [store setObject:phoneCapability forKey:NAMES_phoneCapability];
    } else {
        [store removeObjectForKey:NAMES_phoneCapability];
    }
}

- (SDLPhoneCapability *)phoneCapability {
    return [store objectForKey:NAMES_phoneCapability];

}

- (void)setRemoteControlCapability:(SDLRemoteControlCapabilities *)remoteControlCapability {
    if (remoteControlCapability != nil) {
        [store setObject:remoteControlCapability forKey:NAMES_remoteControlCapability];
    } else {
        [store removeObjectForKey:NAMES_remoteControlCapability];
    }
}

- (SDLRemoteControlCapabilities *)remoteControlCapability {
    return [store objectForKey:NAMES_remoteControlCapability];

}


@end
