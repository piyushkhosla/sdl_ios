//
//  SDLReleaseInteriorVehicleDataModule.m
//  SmartDeviceLink
//

#import "SDLReleaseInteriorVehicleDataModule.h"

#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"
#import "NSMutableDictionary+Store.h"

@implementation SDLReleaseInteriorVehicleDataModule

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (instancetype)init {
    if (self = [super initWithName:SDLRPCFunctionNameReleaseInteriorVehicleDataModule]) {
    }
    return self;
}
#pragma clang diagnostic pop

- (instancetype)initWithModuleType:(id)moduleType {
    self = [self init];
    if (!self) {
        return nil;
    }

    self.moduleType = moduleType;

    return self;
}

- (instancetype)initWithModuleType:(id)moduleType ModuleId:(NSString *)moduleID {
    self = [self initWithModuleType:moduleType];
    if (!self) {
        return nil;
    }

    self.moduleId = moduleID;

    return self;
}

- (void)setModuleId:(nullable NSString *)moduleId {
    [self.parameters sdl_setObject:moduleId forName:SDLRPCParameterNameModuleId];
}

- (nullable NSString *)moduleId {
    return [self.parameters sdl_objectForName:SDLRPCParameterNameModuleId ofClass:NSString.class error:nil];
}

- (void)setModuleType:(SDLModuleType)moduleType {
    [self.parameters sdl_setObject:moduleType forName:SDLRPCParameterNameModuleType];
}

- (SDLModuleType)moduleType {
    return [self.parameters sdl_enumForName:SDLRPCParameterNameModuleType error:nil];
}

@end
