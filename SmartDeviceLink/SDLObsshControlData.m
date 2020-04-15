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

#import "SDLObsshControlData.h"
#import "NSMutableDictionary+Store.h"
#import "SDLTareStatus.h"
#import "SDLFrontAxleLoadRestoration.h"
#import "SDLFrontAxleLoadRestorationStatus.h"
#import "SDLTailLightMode.h"
#import "SDLScreenMode.h"
#import "SDLObsshDisplayUnit.h"
#import "SDLScreenModeStatus.h"
#import "SDLTailLightModeStatus.h"
#import "SDLRPCParameterNames.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLObsshControlData

- (instancetype)initWithCheckGear:(BOOL)checkGear checkSteeringWheel:(BOOL)checkSteeringWheel checkFlatSurface:(BOOL)checkFlatSurface checkTirePressure:(BOOL)checkTirePressure payload:(nullable NSNumber<SDLUInt> *)payload payloadPercent:(nullable NSNumber<SDLUInt> *)payloadPercent taredPayload:(nullable NSNumber<SDLUInt> *)taredPayload trailerTongueLoad:(nullable NSNumber<SDLUInt> *)trailerTongueLoad trailerTongueLoadPercent:(nullable NSNumber<SDLUInt> *)trailerTongueLoadPercent frontAxleLoadRestorationPercent:(nullable NSNumber<SDLUInt> *)frontAxleLoadRestorationPercent factoryCurbWeight:(nullable NSNumber<SDLUInt> *)factoryCurbWeight grossVehicleWeightRating:(nullable NSNumber<SDLUInt> *)grossVehicleWeightRating grossCombinedWeightRating:(nullable NSNumber<SDLUInt> *)grossCombinedWeightRating frontGrossAxleWeightRating:(nullable NSNumber<SDLUInt> *)frontGrossAxleWeightRating rearGrossAxleWeightRating:(nullable NSNumber<SDLUInt> *)rearGrossAxleWeightRating maxHitchTrailerWeight:(nullable NSNumber<SDLUInt> *)maxHitchTrailerWeight maxBedTrailerWeight:(nullable NSNumber<SDLUInt> *)maxBedTrailerWeight screenModeStatus:(nullable SDLScreenModeStatus)screenModeStatus tareStatus:(nullable SDLTareStatus)tareStatus tailLightModeStatus:(nullable SDLTailLightModeStatus)tailLightModeStatus trailerWeightStatus:(nullable NSNumber<SDLUInt> *)trailerWeightStatus frontAxleLoadRestorationStatus:(nullable SDLFrontAxleLoadRestorationStatus)frontAxleLoadRestorationStatus screenMode:(nullable SDLScreenMode)screenMode tare:(BOOL)tare tailLightMode:(nullable SDLTailLightMode)tailLightMode trailerWeight:(nullable NSNumber<SDLUInt> *)trailerWeight frontAxleLoadRestoration:(nullable SDLFrontAxleLoadRestoration)frontAxleLoadRestoration displayUnit:(nullable SDLObsshDisplayUnit)displayUnit passengerWeight:(nullable NSNumber<SDLUInt> *)passengerWeight screenStep:(nullable NSNumber<SDLUInt> *)screenStep {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.checkGear = @(checkGear);
    self.checkSteeringWheel = @(checkSteeringWheel);
    self.checkFlatSurface = @(checkFlatSurface);
    self.checkTirePressure = @(checkTirePressure);
    self.payload = payload;
    self.payloadPercent = payloadPercent;
    self.taredPayload = taredPayload;
    self.trailerTongueLoad = trailerTongueLoad;
    self.trailerTongueLoadPercent = trailerTongueLoadPercent;
    self.frontAxleLoadRestorationPercent = frontAxleLoadRestorationPercent;
    self.factoryCurbWeight = factoryCurbWeight;
    self.grossVehicleWeightRating = grossVehicleWeightRating;
    self.grossCombinedWeightRating = grossCombinedWeightRating;
    self.frontGrossAxleWeightRating = frontGrossAxleWeightRating;
    self.rearGrossAxleWeightRating = rearGrossAxleWeightRating;
    self.maxHitchTrailerWeight = maxHitchTrailerWeight;
    self.maxBedTrailerWeight = maxBedTrailerWeight;
    self.screenModeStatus = screenModeStatus;
    self.tareStatus = tareStatus;
    self.tailLightModeStatus = tailLightModeStatus;
    self.trailerWeightStatus = trailerWeightStatus;
    self.frontAxleLoadRestorationStatus = frontAxleLoadRestorationStatus;
    self.screenMode = screenMode;
    self.tare = @(tare);
    self.tailLightMode = tailLightMode;
    self.trailerWeight = trailerWeight;
    self.frontAxleLoadRestoration = frontAxleLoadRestoration;
    self.displayUnit = displayUnit;
    self.passengerWeight = passengerWeight;
    self.screenStep = screenStep;
    return self;
}

- (void)setCheckGear:(nullable NSNumber<SDLBool> *)checkGear {
    [self.store sdl_setObject:checkGear forName:SDLRPCParameterNameCheckGear];
}

- (nullable NSNumber<SDLBool> *)checkGear {
    return [self.store sdl_objectForName:SDLRPCParameterNameCheckGear ofClass:NSNumber.class error:nil];
}

- (void)setCheckSteeringWheel:(nullable NSNumber<SDLBool> *)checkSteeringWheel {
    [self.store sdl_setObject:checkSteeringWheel forName:SDLRPCParameterNameCheckSteeringWheel];
}

- (nullable NSNumber<SDLBool> *)checkSteeringWheel {
    return [self.store sdl_objectForName:SDLRPCParameterNameCheckSteeringWheel ofClass:NSNumber.class error:nil];
}

- (void)setCheckFlatSurface:(nullable NSNumber<SDLBool> *)checkFlatSurface {
    [self.store sdl_setObject:checkFlatSurface forName:SDLRPCParameterNameCheckFlatSurface];
}

- (nullable NSNumber<SDLBool> *)checkFlatSurface {
    return [self.store sdl_objectForName:SDLRPCParameterNameCheckFlatSurface ofClass:NSNumber.class error:nil];
}

- (void)setCheckTirePressure:(nullable NSNumber<SDLBool> *)checkTirePressure {
    [self.store sdl_setObject:checkTirePressure forName:SDLRPCParameterNameCheckTirePressure];
}

- (nullable NSNumber<SDLBool> *)checkTirePressure {
    return [self.store sdl_objectForName:SDLRPCParameterNameCheckTirePressure ofClass:NSNumber.class error:nil];
}

- (void)setPayload:(nullable NSNumber<SDLUInt> *)payload {
    [self.store sdl_setObject:payload forName:SDLRPCParameterNamePayload];
}

- (nullable NSNumber<SDLUInt> *)payload {
    return [self.store sdl_objectForName:SDLRPCParameterNamePayload ofClass:NSNumber.class error:nil];
}

- (void)setPayloadPercent:(nullable NSNumber<SDLUInt> *)payloadPercent {
    [self.store sdl_setObject:payloadPercent forName:SDLRPCParameterNamePayloadPercent];
}

- (nullable NSNumber<SDLUInt> *)payloadPercent {
    return [self.store sdl_objectForName:SDLRPCParameterNamePayloadPercent ofClass:NSNumber.class error:nil];
}

- (void)setTaredPayload:(nullable NSNumber<SDLUInt> *)taredPayload {
    [self.store sdl_setObject:taredPayload forName:SDLRPCParameterNameTaredPayload];
}

- (nullable NSNumber<SDLUInt> *)taredPayload {
    return [self.store sdl_objectForName:SDLRPCParameterNameTaredPayload ofClass:NSNumber.class error:nil];
}

- (void)setTrailerTongueLoad:(nullable NSNumber<SDLUInt> *)trailerTongueLoad {
    [self.store sdl_setObject:trailerTongueLoad forName:SDLRPCParameterNameTrailerTongueLoad];
}

- (nullable NSNumber<SDLUInt> *)trailerTongueLoad {
    return [self.store sdl_objectForName:SDLRPCParameterNameTrailerTongueLoad ofClass:NSNumber.class error:nil];
}

- (void)setTrailerTongueLoadPercent:(nullable NSNumber<SDLUInt> *)trailerTongueLoadPercent {
    [self.store sdl_setObject:trailerTongueLoadPercent forName:SDLRPCParameterNameTrailerTongueLoadPercent];
}

- (nullable NSNumber<SDLUInt> *)trailerTongueLoadPercent {
    return [self.store sdl_objectForName:SDLRPCParameterNameTrailerTongueLoadPercent ofClass:NSNumber.class error:nil];
}

- (void)setFrontAxleLoadRestorationPercent:(nullable NSNumber<SDLUInt> *)frontAxleLoadRestorationPercent {
    [self.store sdl_setObject:frontAxleLoadRestorationPercent forName:SDLRPCParameterNameFrontAxleLoadRestorationPercent];
}

- (nullable NSNumber<SDLUInt> *)frontAxleLoadRestorationPercent {
    return [self.store sdl_objectForName:SDLRPCParameterNameFrontAxleLoadRestorationPercent ofClass:NSNumber.class error:nil];
}

- (void)setFactoryCurbWeight:(nullable NSNumber<SDLUInt> *)factoryCurbWeight {
    [self.store sdl_setObject:factoryCurbWeight forName:SDLRPCParameterNameFactoryCurbWeight];
}

- (nullable NSNumber<SDLUInt> *)factoryCurbWeight {
    return [self.store sdl_objectForName:SDLRPCParameterNameFactoryCurbWeight ofClass:NSNumber.class error:nil];
}

- (void)setGrossVehicleWeightRating:(nullable NSNumber<SDLUInt> *)grossVehicleWeightRating {
    [self.store sdl_setObject:grossVehicleWeightRating forName:SDLRPCParameterNameGrossVehicleWeightRating];
}

- (nullable NSNumber<SDLUInt> *)grossVehicleWeightRating {
    return [self.store sdl_objectForName:SDLRPCParameterNameGrossVehicleWeightRating ofClass:NSNumber.class error:nil];
}

- (void)setGrossCombinedWeightRating:(nullable NSNumber<SDLUInt> *)grossCombinedWeightRating {
    [self.store sdl_setObject:grossCombinedWeightRating forName:SDLRPCParameterNameGrossCombinedWeightRating];
}

- (nullable NSNumber<SDLUInt> *)grossCombinedWeightRating {
    return [self.store sdl_objectForName:SDLRPCParameterNameGrossCombinedWeightRating ofClass:NSNumber.class error:nil];
}

- (void)setFrontGrossAxleWeightRating:(nullable NSNumber<SDLUInt> *)frontGrossAxleWeightRating {
    [self.store sdl_setObject:frontGrossAxleWeightRating forName:SDLRPCParameterNameFrontGrossAxleWeightRating];
}

- (nullable NSNumber<SDLUInt> *)frontGrossAxleWeightRating {
    return [self.store sdl_objectForName:SDLRPCParameterNameFrontGrossAxleWeightRating ofClass:NSNumber.class error:nil];
}

- (void)setRearGrossAxleWeightRating:(nullable NSNumber<SDLUInt> *)rearGrossAxleWeightRating {
    [self.store sdl_setObject:rearGrossAxleWeightRating forName:SDLRPCParameterNameRearGrossAxleWeightRating];
}

- (nullable NSNumber<SDLUInt> *)rearGrossAxleWeightRating {
    return [self.store sdl_objectForName:SDLRPCParameterNameRearGrossAxleWeightRating ofClass:NSNumber.class error:nil];
}

- (void)setMaxHitchTrailerWeight:(nullable NSNumber<SDLUInt> *)maxHitchTrailerWeight {
    [self.store sdl_setObject:maxHitchTrailerWeight forName:SDLRPCParameterNameMaxHitchTrailerWeight];
}

- (nullable NSNumber<SDLUInt> *)maxHitchTrailerWeight {
    return [self.store sdl_objectForName:SDLRPCParameterNameMaxHitchTrailerWeight ofClass:NSNumber.class error:nil];
}

- (void)setMaxBedTrailerWeight:(nullable NSNumber<SDLUInt> *)maxBedTrailerWeight {
    [self.store sdl_setObject:maxBedTrailerWeight forName:SDLRPCParameterNameMaxBedTrailerWeight];
}

- (nullable NSNumber<SDLUInt> *)maxBedTrailerWeight {
    return [self.store sdl_objectForName:SDLRPCParameterNameMaxBedTrailerWeight ofClass:NSNumber.class error:nil];
}

- (void)setScreenModeStatus:(nullable SDLScreenModeStatus)screenModeStatus {
    [self.store sdl_setObject:screenModeStatus forName:SDLRPCParameterNameScreenModeStatus];
}

- (nullable SDLScreenModeStatus)screenModeStatus {
    return [self.store sdl_enumForName:SDLRPCParameterNameScreenModeStatus error:nil];
}

- (void)setTareStatus:(nullable SDLTareStatus)tareStatus {
    [self.store sdl_setObject:tareStatus forName:SDLRPCParameterNameTareStatus];
}

- (nullable SDLTareStatus)tareStatus {
    return [self.store sdl_enumForName:SDLRPCParameterNameTareStatus error:nil];
}

- (void)setTailLightModeStatus:(nullable SDLTailLightModeStatus)tailLightModeStatus {
    [self.store sdl_setObject:tailLightModeStatus forName:SDLRPCParameterNameTailLightModeStatus];
}

- (nullable SDLTailLightModeStatus)tailLightModeStatus {
    return [self.store sdl_enumForName:SDLRPCParameterNameTailLightModeStatus error:nil];
}

- (void)setTrailerWeightStatus:(nullable NSNumber<SDLUInt> *)trailerWeightStatus {
    [self.store sdl_setObject:trailerWeightStatus forName:SDLRPCParameterNameTrailerWeightStatus];
}

- (nullable NSNumber<SDLUInt> *)trailerWeightStatus {
    return [self.store sdl_objectForName:SDLRPCParameterNameTrailerWeightStatus ofClass:NSNumber.class error:nil];
}

- (void)setFrontAxleLoadRestorationStatus:(nullable SDLFrontAxleLoadRestorationStatus)frontAxleLoadRestorationStatus {
    [self.store sdl_setObject:frontAxleLoadRestorationStatus forName:SDLRPCParameterNameFrontAxleLoadRestorationStatus];
}

- (nullable SDLFrontAxleLoadRestorationStatus)frontAxleLoadRestorationStatus {
    return [self.store sdl_enumForName:SDLRPCParameterNameFrontAxleLoadRestorationStatus error:nil];
}

- (void)setScreenMode:(nullable SDLScreenMode)screenMode {
    [self.store sdl_setObject:screenMode forName:SDLRPCParameterNameScreenMode];
}

- (nullable SDLScreenMode)screenMode {
    return [self.store sdl_enumForName:SDLRPCParameterNameScreenMode error:nil];
}

- (void)setTare:(nullable NSNumber<SDLBool> *)tare {
    [self.store sdl_setObject:tare forName:SDLRPCParameterNameTare];
}

- (nullable NSNumber<SDLBool> *)tare {
    return [self.store sdl_objectForName:SDLRPCParameterNameTare ofClass:NSNumber.class error:nil];
}

- (void)setTailLightMode:(nullable SDLTailLightMode)tailLightMode {
    [self.store sdl_setObject:tailLightMode forName:SDLRPCParameterNameTailLightMode];
}

- (nullable SDLTailLightMode)tailLightMode {
    return [self.store sdl_enumForName:SDLRPCParameterNameTailLightMode error:nil];
}

- (void)setTrailerWeight:(nullable NSNumber<SDLUInt> *)trailerWeight {
    [self.store sdl_setObject:trailerWeight forName:SDLRPCParameterNameTrailerWeight];
}

- (nullable NSNumber<SDLUInt> *)trailerWeight {
    return [self.store sdl_objectForName:SDLRPCParameterNameTrailerWeight ofClass:NSNumber.class error:nil];
}

- (void)setFrontAxleLoadRestoration:(nullable SDLFrontAxleLoadRestoration)frontAxleLoadRestoration {
    [self.store sdl_setObject:frontAxleLoadRestoration forName:SDLRPCParameterNameFrontAxleLoadRestoration];
}

- (nullable SDLFrontAxleLoadRestoration)frontAxleLoadRestoration {
    return [self.store sdl_enumForName:SDLRPCParameterNameFrontAxleLoadRestoration error:nil];
}

- (void)setDisplayUnit:(nullable SDLObsshDisplayUnit)displayUnit {
    [self.store sdl_setObject:displayUnit forName:SDLRPCParameterNameDisplayUnit];
}

- (nullable SDLObsshDisplayUnit)displayUnit {
    return [self.store sdl_enumForName:SDLRPCParameterNameDisplayUnit error:nil];
}

- (void)setPassengerWeight:(nullable NSNumber<SDLUInt> *)passengerWeight {
    [self.store sdl_setObject:passengerWeight forName:SDLRPCParameterNamePassengerWeight];
}

- (nullable NSNumber<SDLUInt> *)passengerWeight {
    return [self.store sdl_objectForName:SDLRPCParameterNamePassengerWeight ofClass:NSNumber.class error:nil];
}

- (void)setScreenStep:(nullable NSNumber<SDLUInt> *)screenStep {
    [self.store sdl_setObject:screenStep forName:SDLRPCParameterNameScreenStep];
}

- (nullable NSNumber<SDLUInt> *)screenStep {
    return [self.store sdl_objectForName:SDLRPCParameterNameScreenStep ofClass:NSNumber.class error:nil];
}

@end

NS_ASSUME_NONNULL_END