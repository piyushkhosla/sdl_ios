//
//  SDLNavigationCapability.m
//

#import "SDLNavigationCapability.h"
#import "SDLNames.h"

@implementation SDLNavigationCapability

- (void)setSendLocationEnabled:(NSNumber *)sendLocationEnabled {
    if (sendLocationEnabled != nil) {
        [store setObject:sendLocationEnabled forKey:NAMES_sendLocationEnabled];
    } else {
        [store removeObjectForKey:NAMES_sendLocationEnabled];
    }
}

- (NSNumber *)sendLocationEnabled {
    return [store objectForKey:NAMES_sendLocationEnabled];
}

- (void)setGetWayPointsEnabled:(NSNumber *)getWayPointsEnabled {
    if (getWayPointsEnabled != nil) {
        [store setObject:getWayPointsEnabled forKey:NAMES_getWayPointsEnabled];
    } else {
        [store removeObjectForKey:NAMES_getWayPointsEnabled];
    }
}

- (NSNumber *)getWayPointsEnabled {
    return [store objectForKey:NAMES_getWayPointsEnabled];
}

@end
