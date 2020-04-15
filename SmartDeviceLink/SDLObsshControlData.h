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
#import "SDLTareStatus.h"
#import "SDLFrontAxleLoadRestoration.h"
#import "SDLFrontAxleLoadRestorationStatus.h"
#import "SDLTailLightMode.h"
#import "SDLScreenMode.h"
#import "SDLObsshDisplayUnit.h"
#import "SDLScreenModeStatus.h"
#import "SDLTailLightModeStatus.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @since SDL 6.5.0
 */
@interface SDLObsshControlData : SDLRPCStruct

/**
 * @param checkGear - @(checkGear)
 * @param checkSteeringWheel - @(checkSteeringWheel)
 * @param checkFlatSurface - @(checkFlatSurface)
 * @param checkTirePressure - @(checkTirePressure)
 * @param payload - payload
 * @param payloadPercent - payloadPercent
 * @param taredPayload - taredPayload
 * @param trailerTongueLoad - trailerTongueLoad
 * @param trailerTongueLoadPercent - trailerTongueLoadPercent
 * @param frontAxleLoadRestorationPercent - frontAxleLoadRestorationPercent
 * @param factoryCurbWeight - factoryCurbWeight
 * @param grossVehicleWeightRating - grossVehicleWeightRating
 * @param grossCombinedWeightRating - grossCombinedWeightRating
 * @param frontGrossAxleWeightRating - frontGrossAxleWeightRating
 * @param rearGrossAxleWeightRating - rearGrossAxleWeightRating
 * @param maxHitchTrailerWeight - maxHitchTrailerWeight
 * @param maxBedTrailerWeight - maxBedTrailerWeight
 * @param screenModeStatus - screenModeStatus
 * @param tareStatus - tareStatus
 * @param tailLightModeStatus - tailLightModeStatus
 * @param trailerWeightStatus - trailerWeightStatus
 * @param frontAxleLoadRestorationStatus - frontAxleLoadRestorationStatus
 * @param screenMode - screenMode
 * @param tare - @(tare)
 * @param tailLightMode - tailLightMode
 * @param trailerWeight - trailerWeight
 * @param frontAxleLoadRestoration - frontAxleLoadRestoration
 * @param displayUnit - displayUnit
 * @param passengerWeight - passengerWeight
 * @param screenStep - screenStep
 * @return A SDLObsshControlData object
 */
- (instancetype)initWithCheckGear:(BOOL)checkGear checkSteeringWheel:(BOOL)checkSteeringWheel checkFlatSurface:(BOOL)checkFlatSurface checkTirePressure:(BOOL)checkTirePressure payload:(nullable NSNumber<SDLUInt> *)payload payloadPercent:(nullable NSNumber<SDLUInt> *)payloadPercent taredPayload:(nullable NSNumber<SDLUInt> *)taredPayload trailerTongueLoad:(nullable NSNumber<SDLUInt> *)trailerTongueLoad trailerTongueLoadPercent:(nullable NSNumber<SDLUInt> *)trailerTongueLoadPercent frontAxleLoadRestorationPercent:(nullable NSNumber<SDLUInt> *)frontAxleLoadRestorationPercent factoryCurbWeight:(nullable NSNumber<SDLUInt> *)factoryCurbWeight grossVehicleWeightRating:(nullable NSNumber<SDLUInt> *)grossVehicleWeightRating grossCombinedWeightRating:(nullable NSNumber<SDLUInt> *)grossCombinedWeightRating frontGrossAxleWeightRating:(nullable NSNumber<SDLUInt> *)frontGrossAxleWeightRating rearGrossAxleWeightRating:(nullable NSNumber<SDLUInt> *)rearGrossAxleWeightRating maxHitchTrailerWeight:(nullable NSNumber<SDLUInt> *)maxHitchTrailerWeight maxBedTrailerWeight:(nullable NSNumber<SDLUInt> *)maxBedTrailerWeight screenModeStatus:(nullable SDLScreenModeStatus)screenModeStatus tareStatus:(nullable SDLTareStatus)tareStatus tailLightModeStatus:(nullable SDLTailLightModeStatus)tailLightModeStatus trailerWeightStatus:(nullable NSNumber<SDLUInt> *)trailerWeightStatus frontAxleLoadRestorationStatus:(nullable SDLFrontAxleLoadRestorationStatus)frontAxleLoadRestorationStatus screenMode:(nullable SDLScreenMode)screenMode tare:(BOOL)tare tailLightMode:(nullable SDLTailLightMode)tailLightMode trailerWeight:(nullable NSNumber<SDLUInt> *)trailerWeight frontAxleLoadRestoration:(nullable SDLFrontAxleLoadRestoration)frontAxleLoadRestoration displayUnit:(nullable SDLObsshDisplayUnit)displayUnit passengerWeight:(nullable NSNumber<SDLUInt> *)passengerWeight screenStep:(nullable NSNumber<SDLUInt> *)screenStep;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *checkGear;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *checkSteeringWheel;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *checkFlatSurface;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *checkTirePressure;

/**
 * {"default_value": null, "max_value": 1023, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *payload;

/**
 * {"default_value": null, "max_value": 127, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *payloadPercent;

/**
 * {"default_value": null, "max_value": 2047, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *taredPayload;

/**
 * {"default_value": null, "max_value": 2047, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *trailerTongueLoad;

/**
 * {"default_value": null, "max_value": 127, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *trailerTongueLoadPercent;

/**
 * {"default_value": null, "max_value": 127, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *frontAxleLoadRestorationPercent;

/**
 * {"default_value": null, "max_value": 1023, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *factoryCurbWeight;

/**
 * {"default_value": null, "max_value": 1023, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *grossVehicleWeightRating;

/**
 * {"default_value": null, "max_value": 2047, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *grossCombinedWeightRating;

/**
 * {"default_value": null, "max_value": 1023, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *frontGrossAxleWeightRating;

/**
 * {"default_value": null, "max_value": 1023, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *rearGrossAxleWeightRating;

/**
 * {"default_value": null, "max_value": 2047, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *maxHitchTrailerWeight;

/**
 * {"default_value": null, "max_value": 2047, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *maxBedTrailerWeight;

@property (nullable, strong, nonatomic) SDLScreenModeStatus screenModeStatus;

@property (nullable, strong, nonatomic) SDLTareStatus tareStatus;

@property (nullable, strong, nonatomic) SDLTailLightModeStatus tailLightModeStatus;

/**
 * {"default_value": null, "max_value": 2047, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *trailerWeightStatus;

@property (nullable, strong, nonatomic) SDLFrontAxleLoadRestorationStatus frontAxleLoadRestorationStatus;

@property (nullable, strong, nonatomic) SDLScreenMode screenMode;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *tare;

@property (nullable, strong, nonatomic) SDLTailLightMode tailLightMode;

/**
 * {"default_value": null, "max_value": 2047, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *trailerWeight;

@property (nullable, strong, nonatomic) SDLFrontAxleLoadRestoration frontAxleLoadRestoration;

@property (nullable, strong, nonatomic) SDLObsshDisplayUnit displayUnit;

/**
 * {"default_value": null, "max_value": 1023, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *passengerWeight;

/**
 * {"default_value": null, "max_value": 14, "min_value": 0}
 */
@property (nullable, strong, nonatomic) NSNumber<SDLUInt> *screenStep;

@end

NS_ASSUME_NONNULL_END