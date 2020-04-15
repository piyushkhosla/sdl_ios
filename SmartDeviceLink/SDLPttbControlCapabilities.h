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

#import "SDLRPCStruct.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Contains information about a pttb control module's capabilities.
 *
 * @since SDL 5.0.0
 */
@interface SDLPttbControlCapabilities : SDLRPCStruct

/**
 * @param moduleName - moduleName
 * @return A SDLPttbControlCapabilities object
 */
- (instancetype)initWithModuleName:(NSString *)moduleName;

/**
 * @param moduleName - moduleName
 * @param stateAvailable - @(stateAvailable)
 * @param resetAvailable - @(resetAvailable)
 * @param faltMsgAvailable - @(faltMsgAvailable)
 * @param engOnMsgAvailable - @(engOnMsgAvailable)
 * @param loFuelMsgAvailable - @(loFuelMsgAvailable)
 * @param powerStatusAvailable - @(powerStatusAvailable)
 * @param outletAAvailable - @(outletAAvailable)
 * @param outletBAvailable - @(outletBAvailable)
 * @param pwMaxAvailable - @(pwMaxAvailable)
 * @param hwConfigAvailable - @(hwConfigAvailable)
 * @param pwConsumptionAvailable - @(pwConsumptionAvailable)
 * @return A SDLPttbControlCapabilities object
 */
- (instancetype)initWithModuleName:(NSString *)moduleName stateAvailable:(BOOL)stateAvailable resetAvailable:(BOOL)resetAvailable faltMsgAvailable:(BOOL)faltMsgAvailable engOnMsgAvailable:(BOOL)engOnMsgAvailable loFuelMsgAvailable:(BOOL)loFuelMsgAvailable powerStatusAvailable:(BOOL)powerStatusAvailable outletAAvailable:(BOOL)outletAAvailable outletBAvailable:(BOOL)outletBAvailable pwMaxAvailable:(BOOL)pwMaxAvailable hwConfigAvailable:(BOOL)hwConfigAvailable pwConsumptionAvailable:(BOOL)pwConsumptionAvailable;

/**
 * {"default_value": null, "max_length": 100, "min_length": 1}
 */
@property (strong, nonatomic) NSString *moduleName;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *stateAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *resetAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *faltMsgAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *engOnMsgAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *loFuelMsgAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *powerStatusAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *outletAAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *outletBAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *pwMaxAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *hwConfigAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *pwConsumptionAvailable;

@end

NS_ASSUME_NONNULL_END