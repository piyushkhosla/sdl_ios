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

#import "SDLObsshControlCapabilities.h"
#import "NSMutableDictionary+Store.h"
#import "SDLRPCParameterNames.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLObsshControlCapabilities

- (instancetype)initWithModuleName:(NSString *)moduleName {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.moduleName = moduleName;
    return self;
}

- (instancetype)initWithModuleName:(NSString *)moduleName checkGearAvailable:(BOOL)checkGearAvailable checkSteeringWheelAvailable:(BOOL)checkSteeringWheelAvailable checkFlatSurfaceAvailable:(BOOL)checkFlatSurfaceAvailable checkTirePressureAvailable:(BOOL)checkTirePressureAvailable payloadAvailable:(BOOL)payloadAvailable payloadPercentAvailable:(BOOL)payloadPercentAvailable taredPayloadAvailable:(BOOL)taredPayloadAvailable trailerTongueLoadAvailable:(BOOL)trailerTongueLoadAvailable trailerTongueLoadPercentAvailable:(BOOL)trailerTongueLoadPercentAvailable frontAxleLoadRestorationPercentAvailable:(BOOL)frontAxleLoadRestorationPercentAvailable factoryCurbWeightAvailable:(BOOL)factoryCurbWeightAvailable grossVehicleWeightRatingAvailable:(BOOL)grossVehicleWeightRatingAvailable grossCombinedWeightRatingAvailable:(BOOL)grossCombinedWeightRatingAvailable frontGrossAxleWeightRatingAvailable:(BOOL)frontGrossAxleWeightRatingAvailable rearGrossAxleWeightRatingAvailable:(BOOL)rearGrossAxleWeightRatingAvailable maxHitchTrailerWeightAvailable:(BOOL)maxHitchTrailerWeightAvailable maxBedTrailerWeightAvailable:(BOOL)maxBedTrailerWeightAvailable screenModeStatusAvailable:(BOOL)screenModeStatusAvailable tareStatusAvailable:(BOOL)tareStatusAvailable tailLightModeStatusAvailable:(BOOL)tailLightModeStatusAvailable trailerWeightStatusAvailable:(BOOL)trailerWeightStatusAvailable frontAxleLoadRestorationStatusAvailable:(BOOL)frontAxleLoadRestorationStatusAvailable screenModeAvailable:(BOOL)screenModeAvailable tareAvailable:(BOOL)tareAvailable tailLightModeAvailable:(BOOL)tailLightModeAvailable trailerWeightAvailable:(BOOL)trailerWeightAvailable frontAxleLoadRestorationAvailable:(BOOL)frontAxleLoadRestorationAvailable displayUnitAvailable:(BOOL)displayUnitAvailable passengerWeightAvailable:(BOOL)passengerWeightAvailable screenStepAvailable:(BOOL)screenStepAvailable {
    self = [self initWithModuleName:moduleName];
    if (!self) {
        return nil;
    }
    self.checkGearAvailable = @(checkGearAvailable);
    self.checkSteeringWheelAvailable = @(checkSteeringWheelAvailable);
    self.checkFlatSurfaceAvailable = @(checkFlatSurfaceAvailable);
    self.checkTirePressureAvailable = @(checkTirePressureAvailable);
    self.payloadAvailable = @(payloadAvailable);
    self.payloadPercentAvailable = @(payloadPercentAvailable);
    self.taredPayloadAvailable = @(taredPayloadAvailable);
    self.trailerTongueLoadAvailable = @(trailerTongueLoadAvailable);
    self.trailerTongueLoadPercentAvailable = @(trailerTongueLoadPercentAvailable);
    self.frontAxleLoadRestorationPercentAvailable = @(frontAxleLoadRestorationPercentAvailable);
    self.factoryCurbWeightAvailable = @(factoryCurbWeightAvailable);
    self.grossVehicleWeightRatingAvailable = @(grossVehicleWeightRatingAvailable);
    self.grossCombinedWeightRatingAvailable = @(grossCombinedWeightRatingAvailable);
    self.frontGrossAxleWeightRatingAvailable = @(frontGrossAxleWeightRatingAvailable);
    self.rearGrossAxleWeightRatingAvailable = @(rearGrossAxleWeightRatingAvailable);
    self.maxHitchTrailerWeightAvailable = @(maxHitchTrailerWeightAvailable);
    self.maxBedTrailerWeightAvailable = @(maxBedTrailerWeightAvailable);
    self.screenModeStatusAvailable = @(screenModeStatusAvailable);
    self.tareStatusAvailable = @(tareStatusAvailable);
    self.tailLightModeStatusAvailable = @(tailLightModeStatusAvailable);
    self.trailerWeightStatusAvailable = @(trailerWeightStatusAvailable);
    self.frontAxleLoadRestorationStatusAvailable = @(frontAxleLoadRestorationStatusAvailable);
    self.screenModeAvailable = @(screenModeAvailable);
    self.tareAvailable = @(tareAvailable);
    self.tailLightModeAvailable = @(tailLightModeAvailable);
    self.trailerWeightAvailable = @(trailerWeightAvailable);
    self.frontAxleLoadRestorationAvailable = @(frontAxleLoadRestorationAvailable);
    self.displayUnitAvailable = @(displayUnitAvailable);
    self.passengerWeightAvailable = @(passengerWeightAvailable);
    self.screenStepAvailable = @(screenStepAvailable);
    return self;
}

- (void)setModuleName:(NSString *)moduleName {
    [self.store sdl_setObject:moduleName forName:SDLRPCParameterNameModuleName];
}

- (NSString *)moduleName {
    NSError *error = nil;
    return [self.store sdl_objectForName:SDLRPCParameterNameModuleName ofClass:NSString.class error:&error];
}

- (void)setCheckGearAvailable:(nullable NSNumber<SDLBool> *)checkGearAvailable {
    [self.store sdl_setObject:checkGearAvailable forName:SDLRPCParameterNameCheckGearAvailable];
}

- (nullable NSNumber<SDLBool> *)checkGearAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameCheckGearAvailable ofClass:NSNumber.class error:nil];
}

- (void)setCheckSteeringWheelAvailable:(nullable NSNumber<SDLBool> *)checkSteeringWheelAvailable {
    [self.store sdl_setObject:checkSteeringWheelAvailable forName:SDLRPCParameterNameCheckSteeringWheelAvailable];
}

- (nullable NSNumber<SDLBool> *)checkSteeringWheelAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameCheckSteeringWheelAvailable ofClass:NSNumber.class error:nil];
}

- (void)setCheckFlatSurfaceAvailable:(nullable NSNumber<SDLBool> *)checkFlatSurfaceAvailable {
    [self.store sdl_setObject:checkFlatSurfaceAvailable forName:SDLRPCParameterNameCheckFlatSurfaceAvailable];
}

- (nullable NSNumber<SDLBool> *)checkFlatSurfaceAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameCheckFlatSurfaceAvailable ofClass:NSNumber.class error:nil];
}

- (void)setCheckTirePressureAvailable:(nullable NSNumber<SDLBool> *)checkTirePressureAvailable {
    [self.store sdl_setObject:checkTirePressureAvailable forName:SDLRPCParameterNameCheckTirePressureAvailable];
}

- (nullable NSNumber<SDLBool> *)checkTirePressureAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameCheckTirePressureAvailable ofClass:NSNumber.class error:nil];
}

- (void)setPayloadAvailable:(nullable NSNumber<SDLBool> *)payloadAvailable {
    [self.store sdl_setObject:payloadAvailable forName:SDLRPCParameterNamePayloadAvailable];
}

- (nullable NSNumber<SDLBool> *)payloadAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNamePayloadAvailable ofClass:NSNumber.class error:nil];
}

- (void)setPayloadPercentAvailable:(nullable NSNumber<SDLBool> *)payloadPercentAvailable {
    [self.store sdl_setObject:payloadPercentAvailable forName:SDLRPCParameterNamePayloadPercentAvailable];
}

- (nullable NSNumber<SDLBool> *)payloadPercentAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNamePayloadPercentAvailable ofClass:NSNumber.class error:nil];
}

- (void)setTaredPayloadAvailable:(nullable NSNumber<SDLBool> *)taredPayloadAvailable {
    [self.store sdl_setObject:taredPayloadAvailable forName:SDLRPCParameterNameTaredPayloadAvailable];
}

- (nullable NSNumber<SDLBool> *)taredPayloadAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameTaredPayloadAvailable ofClass:NSNumber.class error:nil];
}

- (void)setTrailerTongueLoadAvailable:(nullable NSNumber<SDLBool> *)trailerTongueLoadAvailable {
    [self.store sdl_setObject:trailerTongueLoadAvailable forName:SDLRPCParameterNameTrailerTongueLoadAvailable];
}

- (nullable NSNumber<SDLBool> *)trailerTongueLoadAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameTrailerTongueLoadAvailable ofClass:NSNumber.class error:nil];
}

- (void)setTrailerTongueLoadPercentAvailable:(nullable NSNumber<SDLBool> *)trailerTongueLoadPercentAvailable {
    [self.store sdl_setObject:trailerTongueLoadPercentAvailable forName:SDLRPCParameterNameTrailerTongueLoadPercentAvailable];
}

- (nullable NSNumber<SDLBool> *)trailerTongueLoadPercentAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameTrailerTongueLoadPercentAvailable ofClass:NSNumber.class error:nil];
}

- (void)setFrontAxleLoadRestorationPercentAvailable:(nullable NSNumber<SDLBool> *)frontAxleLoadRestorationPercentAvailable {
    [self.store sdl_setObject:frontAxleLoadRestorationPercentAvailable forName:SDLRPCParameterNameFrontAxleLoadRestorationPercentAvailable];
}

- (nullable NSNumber<SDLBool> *)frontAxleLoadRestorationPercentAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameFrontAxleLoadRestorationPercentAvailable ofClass:NSNumber.class error:nil];
}

- (void)setFactoryCurbWeightAvailable:(nullable NSNumber<SDLBool> *)factoryCurbWeightAvailable {
    [self.store sdl_setObject:factoryCurbWeightAvailable forName:SDLRPCParameterNameFactoryCurbWeightAvailable];
}

- (nullable NSNumber<SDLBool> *)factoryCurbWeightAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameFactoryCurbWeightAvailable ofClass:NSNumber.class error:nil];
}

- (void)setGrossVehicleWeightRatingAvailable:(nullable NSNumber<SDLBool> *)grossVehicleWeightRatingAvailable {
    [self.store sdl_setObject:grossVehicleWeightRatingAvailable forName:SDLRPCParameterNameGrossVehicleWeightRatingAvailable];
}

- (nullable NSNumber<SDLBool> *)grossVehicleWeightRatingAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameGrossVehicleWeightRatingAvailable ofClass:NSNumber.class error:nil];
}

- (void)setGrossCombinedWeightRatingAvailable:(nullable NSNumber<SDLBool> *)grossCombinedWeightRatingAvailable {
    [self.store sdl_setObject:grossCombinedWeightRatingAvailable forName:SDLRPCParameterNameGrossCombinedWeightRatingAvailable];
}

- (nullable NSNumber<SDLBool> *)grossCombinedWeightRatingAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameGrossCombinedWeightRatingAvailable ofClass:NSNumber.class error:nil];
}

- (void)setFrontGrossAxleWeightRatingAvailable:(nullable NSNumber<SDLBool> *)frontGrossAxleWeightRatingAvailable {
    [self.store sdl_setObject:frontGrossAxleWeightRatingAvailable forName:SDLRPCParameterNameFrontGrossAxleWeightRatingAvailable];
}

- (nullable NSNumber<SDLBool> *)frontGrossAxleWeightRatingAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameFrontGrossAxleWeightRatingAvailable ofClass:NSNumber.class error:nil];
}

- (void)setRearGrossAxleWeightRatingAvailable:(nullable NSNumber<SDLBool> *)rearGrossAxleWeightRatingAvailable {
    [self.store sdl_setObject:rearGrossAxleWeightRatingAvailable forName:SDLRPCParameterNameRearGrossAxleWeightRatingAvailable];
}

- (nullable NSNumber<SDLBool> *)rearGrossAxleWeightRatingAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameRearGrossAxleWeightRatingAvailable ofClass:NSNumber.class error:nil];
}

- (void)setMaxHitchTrailerWeightAvailable:(nullable NSNumber<SDLBool> *)maxHitchTrailerWeightAvailable {
    [self.store sdl_setObject:maxHitchTrailerWeightAvailable forName:SDLRPCParameterNameMaxHitchTrailerWeightAvailable];
}

- (nullable NSNumber<SDLBool> *)maxHitchTrailerWeightAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameMaxHitchTrailerWeightAvailable ofClass:NSNumber.class error:nil];
}

- (void)setMaxBedTrailerWeightAvailable:(nullable NSNumber<SDLBool> *)maxBedTrailerWeightAvailable {
    [self.store sdl_setObject:maxBedTrailerWeightAvailable forName:SDLRPCParameterNameMaxBedTrailerWeightAvailable];
}

- (nullable NSNumber<SDLBool> *)maxBedTrailerWeightAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameMaxBedTrailerWeightAvailable ofClass:NSNumber.class error:nil];
}

- (void)setScreenModeStatusAvailable:(nullable NSNumber<SDLBool> *)screenModeStatusAvailable {
    [self.store sdl_setObject:screenModeStatusAvailable forName:SDLRPCParameterNameScreenModeStatusAvailable];
}

- (nullable NSNumber<SDLBool> *)screenModeStatusAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameScreenModeStatusAvailable ofClass:NSNumber.class error:nil];
}

- (void)setTareStatusAvailable:(nullable NSNumber<SDLBool> *)tareStatusAvailable {
    [self.store sdl_setObject:tareStatusAvailable forName:SDLRPCParameterNameTareStatusAvailable];
}

- (nullable NSNumber<SDLBool> *)tareStatusAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameTareStatusAvailable ofClass:NSNumber.class error:nil];
}

- (void)setTailLightModeStatusAvailable:(nullable NSNumber<SDLBool> *)tailLightModeStatusAvailable {
    [self.store sdl_setObject:tailLightModeStatusAvailable forName:SDLRPCParameterNameTailLightModeStatusAvailable];
}

- (nullable NSNumber<SDLBool> *)tailLightModeStatusAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameTailLightModeStatusAvailable ofClass:NSNumber.class error:nil];
}

- (void)setTrailerWeightStatusAvailable:(nullable NSNumber<SDLBool> *)trailerWeightStatusAvailable {
    [self.store sdl_setObject:trailerWeightStatusAvailable forName:SDLRPCParameterNameTrailerWeightStatusAvailable];
}

- (nullable NSNumber<SDLBool> *)trailerWeightStatusAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameTrailerWeightStatusAvailable ofClass:NSNumber.class error:nil];
}

- (void)setFrontAxleLoadRestorationStatusAvailable:(nullable NSNumber<SDLBool> *)frontAxleLoadRestorationStatusAvailable {
    [self.store sdl_setObject:frontAxleLoadRestorationStatusAvailable forName:SDLRPCParameterNameFrontAxleLoadRestorationStatusAvailable];
}

- (nullable NSNumber<SDLBool> *)frontAxleLoadRestorationStatusAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameFrontAxleLoadRestorationStatusAvailable ofClass:NSNumber.class error:nil];
}

- (void)setScreenModeAvailable:(nullable NSNumber<SDLBool> *)screenModeAvailable {
    [self.store sdl_setObject:screenModeAvailable forName:SDLRPCParameterNameScreenModeAvailable];
}

- (nullable NSNumber<SDLBool> *)screenModeAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameScreenModeAvailable ofClass:NSNumber.class error:nil];
}

- (void)setTareAvailable:(nullable NSNumber<SDLBool> *)tareAvailable {
    [self.store sdl_setObject:tareAvailable forName:SDLRPCParameterNameTareAvailable];
}

- (nullable NSNumber<SDLBool> *)tareAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameTareAvailable ofClass:NSNumber.class error:nil];
}

- (void)setTailLightModeAvailable:(nullable NSNumber<SDLBool> *)tailLightModeAvailable {
    [self.store sdl_setObject:tailLightModeAvailable forName:SDLRPCParameterNameTailLightModeAvailable];
}

- (nullable NSNumber<SDLBool> *)tailLightModeAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameTailLightModeAvailable ofClass:NSNumber.class error:nil];
}

- (void)setTrailerWeightAvailable:(nullable NSNumber<SDLBool> *)trailerWeightAvailable {
    [self.store sdl_setObject:trailerWeightAvailable forName:SDLRPCParameterNameTrailerWeightAvailable];
}

- (nullable NSNumber<SDLBool> *)trailerWeightAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameTrailerWeightAvailable ofClass:NSNumber.class error:nil];
}

- (void)setFrontAxleLoadRestorationAvailable:(nullable NSNumber<SDLBool> *)frontAxleLoadRestorationAvailable {
    [self.store sdl_setObject:frontAxleLoadRestorationAvailable forName:SDLRPCParameterNameFrontAxleLoadRestorationAvailable];
}

- (nullable NSNumber<SDLBool> *)frontAxleLoadRestorationAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameFrontAxleLoadRestorationAvailable ofClass:NSNumber.class error:nil];
}

- (void)setDisplayUnitAvailable:(nullable NSNumber<SDLBool> *)displayUnitAvailable {
    [self.store sdl_setObject:displayUnitAvailable forName:SDLRPCParameterNameDisplayUnitAvailable];
}

- (nullable NSNumber<SDLBool> *)displayUnitAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameDisplayUnitAvailable ofClass:NSNumber.class error:nil];
}

- (void)setPassengerWeightAvailable:(nullable NSNumber<SDLBool> *)passengerWeightAvailable {
    [self.store sdl_setObject:passengerWeightAvailable forName:SDLRPCParameterNamePassengerWeightAvailable];
}

- (nullable NSNumber<SDLBool> *)passengerWeightAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNamePassengerWeightAvailable ofClass:NSNumber.class error:nil];
}

- (void)setScreenStepAvailable:(nullable NSNumber<SDLBool> *)screenStepAvailable {
    [self.store sdl_setObject:screenStepAvailable forName:SDLRPCParameterNameScreenStepAvailable];
}

- (nullable NSNumber<SDLBool> *)screenStepAvailable {
    return [self.store sdl_objectForName:SDLRPCParameterNameScreenStepAvailable ofClass:NSNumber.class error:nil];
}

@end

NS_ASSUME_NONNULL_END