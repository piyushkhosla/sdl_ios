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
 * Contains information about a OBSSH control module's capabilities.
 *
 * @since SDL 5.0.0
 */
@interface SDLObsshControlCapabilities : SDLRPCStruct

/**
 * @param moduleName - moduleName
 * @return A SDLObsshControlCapabilities object
 */
- (instancetype)initWithModuleName:(NSString *)moduleName;

/**
 * @param moduleName - moduleName
 * @param checkGearAvailable - @(checkGearAvailable)
 * @param checkSteeringWheelAvailable - @(checkSteeringWheelAvailable)
 * @param checkFlatSurfaceAvailable - @(checkFlatSurfaceAvailable)
 * @param checkTirePressureAvailable - @(checkTirePressureAvailable)
 * @param payloadAvailable - @(payloadAvailable)
 * @param payloadPercentAvailable - @(payloadPercentAvailable)
 * @param taredPayloadAvailable - @(taredPayloadAvailable)
 * @param trailerTongueLoadAvailable - @(trailerTongueLoadAvailable)
 * @param trailerTongueLoadPercentAvailable - @(trailerTongueLoadPercentAvailable)
 * @param frontAxleLoadRestorationPercentAvailable - @(frontAxleLoadRestorationPercentAvailable)
 * @param factoryCurbWeightAvailable - @(factoryCurbWeightAvailable)
 * @param grossVehicleWeightRatingAvailable - @(grossVehicleWeightRatingAvailable)
 * @param grossCombinedWeightRatingAvailable - @(grossCombinedWeightRatingAvailable)
 * @param frontGrossAxleWeightRatingAvailable - @(frontGrossAxleWeightRatingAvailable)
 * @param rearGrossAxleWeightRatingAvailable - @(rearGrossAxleWeightRatingAvailable)
 * @param maxHitchTrailerWeightAvailable - @(maxHitchTrailerWeightAvailable)
 * @param maxBedTrailerWeightAvailable - @(maxBedTrailerWeightAvailable)
 * @param screenModeStatusAvailable - @(screenModeStatusAvailable)
 * @param tareStatusAvailable - @(tareStatusAvailable)
 * @param tailLightModeStatusAvailable - @(tailLightModeStatusAvailable)
 * @param trailerWeightStatusAvailable - @(trailerWeightStatusAvailable)
 * @param frontAxleLoadRestorationStatusAvailable - @(frontAxleLoadRestorationStatusAvailable)
 * @param screenModeAvailable - @(screenModeAvailable)
 * @param tareAvailable - @(tareAvailable)
 * @param tailLightModeAvailable - @(tailLightModeAvailable)
 * @param trailerWeightAvailable - @(trailerWeightAvailable)
 * @param frontAxleLoadRestorationAvailable - @(frontAxleLoadRestorationAvailable)
 * @param displayUnitAvailable - @(displayUnitAvailable)
 * @param passengerWeightAvailable - @(passengerWeightAvailable)
 * @param screenStepAvailable - @(screenStepAvailable)
 * @return A SDLObsshControlCapabilities object
 */
- (instancetype)initWithModuleName:(NSString *)moduleName checkGearAvailable:(BOOL)checkGearAvailable checkSteeringWheelAvailable:(BOOL)checkSteeringWheelAvailable checkFlatSurfaceAvailable:(BOOL)checkFlatSurfaceAvailable checkTirePressureAvailable:(BOOL)checkTirePressureAvailable payloadAvailable:(BOOL)payloadAvailable payloadPercentAvailable:(BOOL)payloadPercentAvailable taredPayloadAvailable:(BOOL)taredPayloadAvailable trailerTongueLoadAvailable:(BOOL)trailerTongueLoadAvailable trailerTongueLoadPercentAvailable:(BOOL)trailerTongueLoadPercentAvailable frontAxleLoadRestorationPercentAvailable:(BOOL)frontAxleLoadRestorationPercentAvailable factoryCurbWeightAvailable:(BOOL)factoryCurbWeightAvailable grossVehicleWeightRatingAvailable:(BOOL)grossVehicleWeightRatingAvailable grossCombinedWeightRatingAvailable:(BOOL)grossCombinedWeightRatingAvailable frontGrossAxleWeightRatingAvailable:(BOOL)frontGrossAxleWeightRatingAvailable rearGrossAxleWeightRatingAvailable:(BOOL)rearGrossAxleWeightRatingAvailable maxHitchTrailerWeightAvailable:(BOOL)maxHitchTrailerWeightAvailable maxBedTrailerWeightAvailable:(BOOL)maxBedTrailerWeightAvailable screenModeStatusAvailable:(BOOL)screenModeStatusAvailable tareStatusAvailable:(BOOL)tareStatusAvailable tailLightModeStatusAvailable:(BOOL)tailLightModeStatusAvailable trailerWeightStatusAvailable:(BOOL)trailerWeightStatusAvailable frontAxleLoadRestorationStatusAvailable:(BOOL)frontAxleLoadRestorationStatusAvailable screenModeAvailable:(BOOL)screenModeAvailable tareAvailable:(BOOL)tareAvailable tailLightModeAvailable:(BOOL)tailLightModeAvailable trailerWeightAvailable:(BOOL)trailerWeightAvailable frontAxleLoadRestorationAvailable:(BOOL)frontAxleLoadRestorationAvailable displayUnitAvailable:(BOOL)displayUnitAvailable passengerWeightAvailable:(BOOL)passengerWeightAvailable screenStepAvailable:(BOOL)screenStepAvailable;

/**
 * {"default_value": null, "max_length": 100, "min_length": 1}
 */
@property (strong, nonatomic) NSString *moduleName;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *checkGearAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *checkSteeringWheelAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *checkFlatSurfaceAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *checkTirePressureAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *payloadAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *payloadPercentAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *taredPayloadAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *trailerTongueLoadAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *trailerTongueLoadPercentAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *frontAxleLoadRestorationPercentAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *factoryCurbWeightAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *grossVehicleWeightRatingAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *grossCombinedWeightRatingAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *frontGrossAxleWeightRatingAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *rearGrossAxleWeightRatingAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *maxHitchTrailerWeightAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *maxBedTrailerWeightAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *screenModeStatusAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *tareStatusAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *tailLightModeStatusAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *trailerWeightStatusAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *frontAxleLoadRestorationStatusAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *screenModeAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *tareAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *tailLightModeAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *trailerWeightAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *frontAxleLoadRestorationAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *displayUnitAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *passengerWeightAvailable;

@property (nullable, strong, nonatomic) NSNumber<SDLBool> *screenStepAvailable;

@end

NS_ASSUME_NONNULL_END