//
//  SDLGetAppServiceData.m
//  SmartDeviceLink
//
//  Created by Nicole on 2/6/19.
//  Copyright © 2019 smartdevicelink. All rights reserved.
//

#import "SDLGetAppServiceData.h"
#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLGetAppServiceData

- (instancetype)init {
    if (self = [super initWithName:SDLNameGetAppServiceData]) {
    }
    return self;
}

- (instancetype)initWithServiceType:(SDLAppServiceType)serviceType subscribe:(BOOL)subscribe {
    self = [self init];
    if (!self) {
        return nil;
    }

    self.serviceType = serviceType;
    self.subscribe = @(subscribe);

    return self;
}

- (void)setServiceType:(__strong SDLAppServiceType)serviceType {
    [parameters sdl_setObject:serviceType forName:SDLNameServiceType];
}

- (SDLAppServiceType)serviceType {
    return [parameters sdl_objectForName:SDLNameServiceType];
}

- (void)setSubscribe:(nullable NSNumber<SDLBool> *)subscribe {
    [parameters sdl_setObject:subscribe forName:SDLNameSubscribe];
}

- (nullable NSNumber<SDLBool> *)subscribe {
    return [parameters sdl_objectForName:SDLNameSubscribe];
}

@end

NS_ASSUME_NONNULL_END
