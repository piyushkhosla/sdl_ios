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

#import "SDLPttbControlData.h"
#import "NSMutableDictionary+Store.h"
#import "SDLPttbPowerStatus.h"
#import "SDLPttbFaltMsg.h"
#import "SDLPttbHwConfig.h"
#import "SDLPttbEngOnMsg.h"
#import "SDLPttbPowerState.h"
#import "SDLRPCParameterNames.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLPttbControlData

- (instancetype)initWithState:(nullable SDLPttbPowerState)state reset:(BOOL)reset faltMsg:(nullable SDLPttbFaltMsg)faltMsg engOnMsg :(nullable SDLPttbEngOnMsg)engOnMsg  loFuelMsg :(nullable NSNumber<SDLUInt> *)loFuelMsg  powerStatus:(nullable SDLPttbPowerStatus)powerStatus outletA:(nullable NSNumber<SDLUInt> *)outletA outletB:(nullable NSNumber<SDLUInt> *)outletB pwMax:(nullable NSNumber<SDLUInt> *)pwMax hwConfig:(nullable SDLPttbHwConfig)hwConfig pwConsumption:(nullable NSNumber<SDLUInt> *)pwConsumption {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.state = state;
    self.reset = @(reset);
    self.faltMsg = faltMsg;
    self.engOnMsg  = engOnMsg ;
    self.loFuelMsg  = loFuelMsg ;
    self.powerStatus = powerStatus;
    self.outletA = outletA;
    self.outletB = outletB;
    self.pwMax = pwMax;
    self.hwConfig = hwConfig;
    self.pwConsumption = pwConsumption;
    return self;
}

- (void)setState:(nullable SDLPttbPowerState)state {
    [self.store sdl_setObject:state forName:SDLRPCParameterNameState];
}

- (nullable SDLPttbPowerState)state {
    return [self.store sdl_enumForName:SDLRPCParameterNameState error:nil];
}

- (void)setReset:(nullable NSNumber<SDLBool> *)reset {
    [self.store sdl_setObject:reset forName:SDLRPCParameterNameReset];
}

- (nullable NSNumber<SDLBool> *)reset {
    return [self.store sdl_objectForName:SDLRPCParameterNameReset ofClass:NSNumber.class error:nil];
}

- (void)setFaltMsg:(nullable SDLPttbFaltMsg)faltMsg {
    [self.store sdl_setObject:faltMsg forName:SDLRPCParameterNameFaltMsg];
}

- (nullable SDLPttbFaltMsg)faltMsg {
    return [self.store sdl_enumForName:SDLRPCParameterNameFaltMsg error:nil];
}

- (void)setEngOnMsg :(nullable SDLPttbEngOnMsg)engOnMsg  {
    [self.store sdl_setObject:engOnMsg  forName:SDLRPCParameterNameEngOnMsg ];
}

- (nullable SDLPttbEngOnMsg)engOnMsg  {
    return [self.store sdl_enumForName:SDLRPCParameterNameEngOnMsg  error:nil];
}

- (void)setLoFuelMsg :(nullable NSNumber<SDLUInt> *)loFuelMsg  {
    [self.store sdl_setObject:loFuelMsg  forName:SDLRPCParameterNameLoFuelMsg ];
}

- (nullable NSNumber<SDLUInt> *)loFuelMsg  {
    return [self.store sdl_objectForName:SDLRPCParameterNameLoFuelMsg  ofClass:NSNumber.class error:nil];
}

- (void)setPowerStatus:(nullable SDLPttbPowerStatus)powerStatus {
    [self.store sdl_setObject:powerStatus forName:SDLRPCParameterNamePowerStatus];
}

- (nullable SDLPttbPowerStatus)powerStatus {
    return [self.store sdl_enumForName:SDLRPCParameterNamePowerStatus error:nil];
}

- (void)setOutletA:(nullable NSNumber<SDLUInt> *)outletA {
    [self.store sdl_setObject:outletA forName:SDLRPCParameterNameOutletA];
}

- (nullable NSNumber<SDLUInt> *)outletA {
    return [self.store sdl_objectForName:SDLRPCParameterNameOutletA ofClass:NSNumber.class error:nil];
}

- (void)setOutletB:(nullable NSNumber<SDLUInt> *)outletB {
    [self.store sdl_setObject:outletB forName:SDLRPCParameterNameOutletB];
}

- (nullable NSNumber<SDLUInt> *)outletB {
    return [self.store sdl_objectForName:SDLRPCParameterNameOutletB ofClass:NSNumber.class error:nil];
}

- (void)setPwMax:(nullable NSNumber<SDLUInt> *)pwMax {
    [self.store sdl_setObject:pwMax forName:SDLRPCParameterNamePwMax];
}

- (nullable NSNumber<SDLUInt> *)pwMax {
    return [self.store sdl_objectForName:SDLRPCParameterNamePwMax ofClass:NSNumber.class error:nil];
}

- (void)setHwConfig:(nullable SDLPttbHwConfig)hwConfig {
    [self.store sdl_setObject:hwConfig forName:SDLRPCParameterNameHwConfig];
}

- (nullable SDLPttbHwConfig)hwConfig {
    return [self.store sdl_enumForName:SDLRPCParameterNameHwConfig error:nil];
}

- (void)setPwConsumption:(nullable NSNumber<SDLUInt> *)pwConsumption {
    [self.store sdl_setObject:pwConsumption forName:SDLRPCParameterNamePwConsumption];
}

- (nullable NSNumber<SDLUInt> *)pwConsumption {
    return [self.store sdl_objectForName:SDLRPCParameterNamePwConsumption ofClass:NSNumber.class error:nil];
}

@end

NS_ASSUME_NONNULL_END