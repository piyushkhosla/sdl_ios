//
//  SDLModuleInfo.m
//  SmartDeviceLink
//

#import "SDLModuleInfo.h"
#import "SDLGrid.h"

#import "NSMutableDictionary+Store.h"
#import "SDLRPCParameterNames.h"

@implementation SDLModuleInfo

- (instancetype)initWithModuleId:(NSString *)moduleId {
    self = [self init];
    if (!self) {
        return self;
    }

    self.moduleId = moduleId;

    return self;
}

- (instancetype)initWithModuleId:(NSString *)moduleId location:(SDLGrid *)location serviceArea:(SDLGrid *)serviceArea allowMultipleAccess:(BOOL)allowMultipleAccess {
    self = [self initWithModuleId:moduleId];
    if (!self) {
        return self;
    }

    self.location = location;
    self.serviceArea = serviceArea;
    self.allowMultipleAccess = @(allowMultipleAccess);

    return self;
}

- (NSString *)moduleId {
    return [self.store sdl_objectForName:SDLRPCParameterNameModuleId ofClass:NSString.class error:nil];
}

- (void)setModuleId:(NSString *)moduleId {
    [self.store sdl_setObject:moduleId forName:SDLRPCParameterNameModuleId];
}

- (SDLGrid *)location {
    return [self.store sdl_objectForName:SDLRPCParameterNameLocation ofClass:SDLGrid.class error:nil];
}

- (void)setLocation:(nullable SDLGrid *)location {
    [self.store sdl_setObject:location forName:SDLRPCParameterNameLocation];
}

- (nullable SDLGrid *)serviceArea {
    return [self.store sdl_objectForName:SDLRPCParameterNameServiceArea ofClass:SDLGrid.class error:nil];
}

- (void)setServiceArea:(nullable SDLGrid *)serviceArea {
    [self.store sdl_setObject:serviceArea forName:SDLRPCParameterNameServiceArea];
}

- (nullable NSNumber<SDLBool> *)allowMultipleAccess {
    return [self.store sdl_objectForName:SDLRPCParameterNameAllowMultipleAccess ofClass:NSNumber.class error:nil];
}

- (void)setAllowMultipleAccess:(nullable NSNumber<SDLBool> *)allowMultipleAccess {
    [self.store sdl_setObject:allowMultipleAccess forName:SDLRPCParameterNameAllowMultipleAccess];
}

@end
