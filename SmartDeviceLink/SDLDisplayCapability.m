//
//  SDLDisplayCapability.m
//

#import "SDLDisplayCapability.h"
#import "SDLWindowTypeCapabilities.h"
#import "SDLWindowCapability.h"

#import "NSMutableDictionary+Store.h"
#import "SDLRPCParameterNames.h"

@implementation SDLDisplayCapability

- (instancetype)initWithDisplayName:(nullable NSString *)displayName windowTypeSupported:(nullable NSArray<SDLWindowTypeCapabilities *> *)windowTypeSupported windowCapabilities:(nullable NSArray<SDLWindowCapability *> *)windowCapabilities {
    self = [self init];
    if (!self) {
        return nil;
    }
    
    self.displayName = displayName;
    self.windowTypeSupported = windowTypeSupported;
    self.windowCapabilities = windowCapabilities;
    return self;
}

- (void)setDisplayName:(NSString *)displayName {
    [self.store sdl_setObject:displayName forName:SDLRPCParameterNameDisplayName];
}

- (NSString *)displayName {
    NSError *error = nil;
    return [self.store sdl_objectForName:SDLRPCParameterNameDisplayName ofClass:NSString.class error:&error];
}

- (NSArray<SDLWindowTypeCapabilities *> *)windowTypeSupported {
    NSError *error = nil;
    return [self.store sdl_objectsForName:SDLRPCParameterNameWindowTypeSupported ofClass:SDLWindowTypeCapabilities.class error:&error];
}

- (void)setWindowTypeSupported:(NSArray<SDLWindowTypeCapabilities *> *)windowTypeSupported {
    [self.store sdl_setObject:windowTypeSupported forName:SDLRPCParameterNameWindowTypeSupported];
}

- (NSArray<SDLWindowCapability *> *)windowCapabilities {
    NSError *error = nil;
    return [self.store sdl_objectsForName:SDLRPCParameterNameWindowCapabilities ofClass:SDLWindowCapability.class error:&error];
}

- (void)setWindowCapabilities:(NSArray<SDLWindowCapability *> *)windowCapabilities {
    [self.store sdl_setObject:windowCapabilities forName:SDLRPCParameterNameWindowCapabilities];
}


@end
