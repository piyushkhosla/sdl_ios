//
//  SDLGetInteriorVehicleDataConsent.m
//  SmartDeviceLink
//

#import "SDLGetInteriorVehicleDataConsent.h"

#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"
#import "NSMutableDictionary+Store.h"

@implementation SDLGetInteriorVehicleDataConsent

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (instancetype)init {
    if (self = [super initWithName:SDLRPCFunctionNameGetInteriorVehicleDataConsent]) {
    }
    return self;
}
#pragma clang diagnostic pop

- (instancetype)initWithModuleIds:(NSArray<NSString *> *)moduleIds moduleType:(SDLModuleType)moduleType {
    self = [self init];
    if (!self) {
        return nil;
    }

    self.moduleIds = moduleIds;
    self.moduleType = moduleType;

    return self;
}

- (void)setModuleIds:(NSArray<NSString *> *)moduleIds {
    [self.parameters sdl_setObject:moduleIds forName:SDLRPCParameterNameModuleIds];
}

-(NSArray<NSString *> *)moduleIds {
    return [self.parameters sdl_objectsForName:SDLRPCParameterNameModuleIds ofClass:NSString.class error:nil];
}

- (void)setModuleType:(SDLModuleType)moduleType {
    [self.parameters sdl_setObject:moduleType forName:SDLRPCParameterNameModuleType];
}

- (SDLModuleType)moduleType {
    return [self.parameters sdl_enumForName:SDLRPCParameterNameModuleType error:nil];
}

@end
