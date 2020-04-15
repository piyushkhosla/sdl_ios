/*
 * Copyright (c) 2020, SmartDeviceLink Consortium, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following
 * disclaimer in the documentation and/or other materials provided with the
 * distribution.
 *
 * Neither the name of the SmartDeviceLink Consortium Inc. nor the names of
 * its contributors may be used to endorse or promote products derived
 * from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#import "SDLPttbControlCapabilities.h"
#import "NSMutableDictionary+Store.h"
#import "SDLRPCParameterNames.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLPttbControlCapabilities

- (instancetype)initWithModuleName:(NSString *)moduleName {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.moduleName = moduleName;
    return self;
}

- (instancetype)initWithModuleName:(NSString *)moduleName stateAvailable:(BOOL)stateAvailable resetAvailable:(BOOL)resetAvailable faltMsgAvailable:(BOOL)faltMsgAvailable engOnMsgAvailable:(BOOL)engOnMsgAvailable loFuelMsgAvailable:(BOOL)loFuelMsgAvailable powerStatusAvailable:(BOOL)powerStatusAvailable outletAAvailable:(BOOL)outletAAvailable outletBAvailable:(BOOL)outletBAvailable pwMaxAvailable:(BOOL)pwMaxAvailable hwConfigAvailable:(BOOL)hwConfigAvailable pwConsumptionAvailable:(BOOL)pwConsumptionAvailable {
    self = [self initWithModuleName:moduleName];
    if (!self) {
        return nil;
    }
    self.stateAvailable = @(stateAvailable);
    self.resetAvailable = @(resetAvailable);
    self.faltMsgAvailable = @(faltMsgAvailable);
    self.engOnMsgAvailable = @(engOnMsgAvailable);
    self.loFuelMsgAvailable = @(loFuelMsgAvailable);
    self.powerStatusAvailable = @(powerStatusAvailable);
    self.outletAAvailable = @(outletAAvailable);
    self.outletBAvailable = @(outletBAvailable);
    self.pwMaxAvailable = @(pwMaxAvailable);
    self.hwConfigAvailable = @(hwConfigAvailable);
    self.pwConsumptionAvailable = @(pwConsumptionAvailable);
    return self;
}

- (void)setModuleName:(NSString *)moduleName {
    [self.store sdl_setObject:moduleName forName:SDLRPCParameterNameModuleName];
}

- (NSString *)moduleName {
    NSError *error = nil;
    return [self.store sdl_objectForName:SDLRPCParameterNameModuleName ofClass:NSString.class error:&error];
}

- (void)setStateAvailable:(nullable NSNumber<SDLBool> *)stateAvailable {
    [self.store sdl_setObject:stateAvailable forName:SDLRPCParameterNameStateAvailable];
}

- (nullable NSNumber<SDLBool> *)stateAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameStateAvailable ofClass:NSNumber.class error:nil];
}

- (void)setResetAvailable:(nullable NSNumber<SDLBool> *)resetAvailable {
    [self.store sdl_setObject:resetAvailable forName:SDLRPCParameterNameResetAvailable];
}

- (nullable NSNumber<SDLBool> *)resetAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameResetAvailable ofClass:NSNumber.class error:nil];
}

- (void)setFaltMsgAvailable:(nullable NSNumber<SDLBool> *)faltMsgAvailable {
    [self.store sdl_setObject:faltMsgAvailable forName:SDLRPCParameterNameFaltMsgAvailable];
}

- (nullable NSNumber<SDLBool> *)faltMsgAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameFaltMsgAvailable ofClass:NSNumber.class error:nil];
}

- (void)setEngOnMsgAvailable:(nullable NSNumber<SDLBool> *)engOnMsgAvailable {
    [self.store sdl_setObject:engOnMsgAvailable forName:SDLRPCParameterNameEngOnMsgAvailable];
}

- (nullable NSNumber<SDLBool> *)engOnMsgAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameEngOnMsgAvailable ofClass:NSNumber.class error:nil];
}

- (void)setLoFuelMsgAvailable:(nullable NSNumber<SDLBool> *)loFuelMsgAvailable {
    [self.store sdl_setObject:loFuelMsgAvailable forName:SDLRPCParameterNameLoFuelMsgAvailable];
}

- (nullable NSNumber<SDLBool> *)loFuelMsgAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameLoFuelMsgAvailable ofClass:NSNumber.class error:nil];
}

- (void)setPowerStatusAvailable:(nullable NSNumber<SDLBool> *)powerStatusAvailable {
    [self.store sdl_setObject:powerStatusAvailable forName:SDLRPCParameterNamePowerStatusAvailable];
}

- (nullable NSNumber<SDLBool> *)powerStatusAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNamePowerStatusAvailable ofClass:NSNumber.class error:nil];
}

- (void)setOutletAAvailable:(nullable NSNumber<SDLBool> *)outletAAvailable {
    [self.store sdl_setObject:outletAAvailable forName:SDLRPCParameterNameOutletAAvailable];
}

- (nullable NSNumber<SDLBool> *)outletAAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameOutletAAvailable ofClass:NSNumber.class error:nil];
}

- (void)setOutletBAvailable:(nullable NSNumber<SDLBool> *)outletBAvailable {
    [self.store sdl_setObject:outletBAvailable forName:SDLRPCParameterNameOutletBAvailable];
}

- (nullable NSNumber<SDLBool> *)outletBAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameOutletBAvailable ofClass:NSNumber.class error:nil];
}

- (void)setPwMaxAvailable:(nullable NSNumber<SDLBool> *)pwMaxAvailable {
    [self.store sdl_setObject:pwMaxAvailable forName:SDLRPCParameterNamePwMaxAvailable];
}

- (nullable NSNumber<SDLBool> *)pwMaxAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNamePwMaxAvailable ofClass:NSNumber.class error:nil];
}

- (void)setHwConfigAvailable:(nullable NSNumber<SDLBool> *)hwConfigAvailable {
    [self.store sdl_setObject:hwConfigAvailable forName:SDLRPCParameterNameHwConfigAvailable];
}

- (nullable NSNumber<SDLBool> *)hwConfigAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameHwConfigAvailable ofClass:NSNumber.class error:nil];
}

- (void)setPwConsumptionAvailable:(nullable NSNumber<SDLBool> *)pwConsumptionAvailable {
    [self.store sdl_setObject:pwConsumptionAvailable forName:SDLRPCParameterNamePwConsumptionAvailable];
}

- (nullable NSNumber<SDLBool> *)pwConsumptionAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNamePwConsumptionAvailable ofClass:NSNumber.class error:nil];
}

@end

NS_ASSUME_NONNULL_END