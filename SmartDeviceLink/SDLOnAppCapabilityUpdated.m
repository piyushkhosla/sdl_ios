//
//  SDLOnAppCapabilityUpdated.m
//  SmartDeviceLink
//

#import "SDLOnAppCapabilityUpdated.h"

#import "SDLAppCapability.h"
#import "SDLRPCFunctionNames.h"
#import "SDLRPCParameterNames.h"
#import "NSMutableDictionary+Store.h"

@implementation SDLOnAppCapabilityUpdated
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (instancetype)init {
    if (self = [super initWithName:SDLRPCFunctionNameOnAppCapabilityUpdated]) {
    }
    return self;
}
#pragma clang diagnostic pop

- (instancetype)initWithAppCapability:(SDLAppCapability *)appCapability {
    self = [self init];
    if (!self) {
        return nil;
    }

    self.appCapability = appCapability;

    return self;
}


- (void)setAppCapability:(SDLAppCapability *)appCapability {
    [self.parameters sdl_setObject:appCapability forName:SDLRPCParameterNameAppCapability];
}

- (SDLAppCapability *)appCapability {
    NSError *error = nil;
    return [self.parameters sdl_objectForName:SDLRPCParameterNameAppCapability ofClass:SDLAppCapability.class error:&error];
    
}

@end
