//
//  SDLGetInteriorVehicleDataConsentResponse.m
//  SmartDeviceLink
//

#import "SDLGetInteriorVehicleDataConsentResponse.h"

#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"
#import "NSMutableDictionary+Store.h"

@implementation SDLGetInteriorVehicleDataConsentResponse

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (instancetype)init {
    if (self = [super initWithName:SDLRPCFunctionNameGetInteriorVehicleDataConsent]) {
    }
    return self;
}
#pragma clang diagnostic pop

- (void)setAllowed:(NSArray<NSNumber<SDLBool> *> *)allowed {
    [self.parameters sdl_setObject:allowed forName:SDLRPCParameterNameAllowed];
}

- (NSArray<NSNumber<SDLBool> *> *)allowed {
    return [self.parameters sdl_objectsForName:SDLRPCParameterNameAllowed ofClass:NSNumber.class error:nil];
}

@end
