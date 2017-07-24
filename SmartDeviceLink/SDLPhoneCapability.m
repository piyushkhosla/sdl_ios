//
//  SDLPhoneCapability.m
//

#import "SDLPhoneCapability.h"
#import "SDLNames.h"

@implementation SDLPhoneCapability

- (void)setDialNumberEnabled:(NSNumber *)dialNumberEnabled {
    if (dialNumberEnabled != nil) {
        [store setObject:dialNumberEnabled forKey:NAMES_dialNumberEnabled];
    } else {
        [store removeObjectForKey:NAMES_dialNumberEnabled];
    }
}

- (NSNumber *)dialNumberEnabled {
    return [store objectForKey:NAMES_dialNumberEnabled];
}

@end
