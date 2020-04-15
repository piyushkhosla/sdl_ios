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

#import "SDLPttbPowerStatus.h"
#import "SDLPttbFaltMsg.h"
#import "SDLPttbHwConfig.h"
#import "SDLPttbEngOnMsg.h"
#import "SDLRPCStruct.h"
#import "SDLPttbPowerState.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @since SDL 5.0.0
 */
@interface SDLPttbControlData : SDLRPCStruct

/**
 * @param state - state
 * @param reset - @(reset)
 * @param faltMsg - faltMsg
 * @param engOnMsg  - engOnMsg 
 * @param loFuelMsg  - loFuelMsg 
 * @param powerStatus - powerStatus
 * @param outletA - outletA
 * @param outletB - outletB
 * @param pwMax - pwMax
 * @param hwConfig - hwConfig
 * @param pwConsumption - pwConsumption
 * @return A SDLPttbControlData object
 */
- (instancetype)initWithState:(nullable SDLPttbPowerState)state reset:(BOOL)reset faltMsg:(nullable SDLPttbFaltMsg)faltMsg engOnMsg :(nullable SDLPttbEngOnMsg)engOnMsg  loFuelMsg :(nullable NSNumber<SDLUInt> *)loFuelMsg  powerStatus:(nullable SDLPttbPowerStatus)powerStatus outletA:(nullable NSNumber<SDLUInt> *)outletA outletB:(nullable NSNumber<SDLUInt> *)outletB pwMax:(nullable NSNumber<SDLUInt> *)pwMax hwConfig:(nullable SDLPttbHwConfig)hwConfig pwConsumption:(nullable NSNumber<SDLUInt> *)pwConsumption;

@property (nullable, strong, nonatomic) SDLPttbPowerState state;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *reset;

@property (nullable, strong, nonatomic) SDLPttbFaltMsg faltMsg;

@property (nullable, strong, nonatomic) SDLPttbEngOnMsg engOnMsg ;

/**
 * {"default_value": null, "max_value": 30, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *loFuelMsg ;

@property (nullable, strong, nonatomic) SDLPttbPowerStatus powerStatus;

/**
 * {"default_value": null, "max_value": 8191, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *outletA;

/**
 * {"default_value": null, "max_value": 8191, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *outletB;

/**
 * {"default_value": null, "max_value": 1023, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *pwMax;

@property (nullable, strong, nonatomic) SDLPttbHwConfig hwConfig;

/**
 * {"default_value": null, "max_value": 65535, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *pwConsumption;

@end

NS_ASSUME_NONNULL_END