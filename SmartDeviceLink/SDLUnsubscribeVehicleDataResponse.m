//  SDLUnsubscribeVehicleDataResponse.m
//


#import "SDLUnsubscribeVehicleDataResponse.h"

#import "SDLNames.h"
#import "SDLVehicleDataResult.h"


@implementation SDLUnsubscribeVehicleDataResponse

- (instancetype)init {
    if (self = [super initWithName:NAMES_UnsubscribeVehicleData]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setGps:(SDLVehicleDataResult *)gps {
    if (gps != nil) {
        [parameters setObject:gps forKey:NAMES_gps];
    } else {
        [parameters removeObjectForKey:NAMES_gps];
    }
}

- (SDLVehicleDataResult *)gps {
    NSObject *obj = [parameters objectForKey:NAMES_gps];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setSpeed:(SDLVehicleDataResult *)speed {
    if (speed != nil) {
        [parameters setObject:speed forKey:NAMES_speed];
    } else {
        [parameters removeObjectForKey:NAMES_speed];
    }
}

- (SDLVehicleDataResult *)speed {
    NSObject *obj = [parameters objectForKey:NAMES_speed];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setRpm:(SDLVehicleDataResult *)rpm {
    if (rpm != nil) {
        [parameters setObject:rpm forKey:NAMES_rpm];
    } else {
        [parameters removeObjectForKey:NAMES_rpm];
    }
}

- (SDLVehicleDataResult *)rpm {
    NSObject *obj = [parameters objectForKey:NAMES_rpm];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setFuelLevel:(SDLVehicleDataResult *)fuelLevel {
    if (fuelLevel != nil) {
        [parameters setObject:fuelLevel forKey:NAMES_fuelLevel];
    } else {
        [parameters removeObjectForKey:NAMES_fuelLevel];
    }
}

- (SDLVehicleDataResult *)fuelLevel {
    NSObject *obj = [parameters objectForKey:NAMES_fuelLevel];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setFuelLevel_State:(SDLVehicleDataResult *)fuelLevel_State {
    if (fuelLevel_State != nil) {
        [parameters setObject:fuelLevel_State forKey:NAMES_fuelLevel_State];
    } else {
        [parameters removeObjectForKey:NAMES_fuelLevel_State];
    }
}

- (SDLVehicleDataResult *)fuelLevel_State {
    NSObject *obj = [parameters objectForKey:NAMES_fuelLevel_State];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setInstantFuelConsumption:(SDLVehicleDataResult *)instantFuelConsumption {
    if (instantFuelConsumption != nil) {
        [parameters setObject:instantFuelConsumption forKey:NAMES_instantFuelConsumption];
    } else {
        [parameters removeObjectForKey:NAMES_instantFuelConsumption];
    }
}

- (SDLVehicleDataResult *)instantFuelConsumption {
    NSObject *obj = [parameters objectForKey:NAMES_instantFuelConsumption];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setExternalTemperature:(SDLVehicleDataResult *)externalTemperature {
    if (externalTemperature != nil) {
        [parameters setObject:externalTemperature forKey:NAMES_externalTemperature];
    } else {
        [parameters removeObjectForKey:NAMES_externalTemperature];
    }
}

- (SDLVehicleDataResult *)externalTemperature {
    NSObject *obj = [parameters objectForKey:NAMES_externalTemperature];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setPrndl:(SDLVehicleDataResult *)prndl {
    if (prndl != nil) {
        [parameters setObject:prndl forKey:NAMES_prndl];
    } else {
        [parameters removeObjectForKey:NAMES_prndl];
    }
}

- (SDLVehicleDataResult *)prndl {
    NSObject *obj = [parameters objectForKey:NAMES_prndl];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setTirePressure:(SDLVehicleDataResult *)tirePressure {
    if (tirePressure != nil) {
        [parameters setObject:tirePressure forKey:NAMES_tirePressure];
    } else {
        [parameters removeObjectForKey:NAMES_tirePressure];
    }
}

- (SDLVehicleDataResult *)tirePressure {
    NSObject *obj = [parameters objectForKey:NAMES_tirePressure];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setOdometer:(SDLVehicleDataResult *)odometer {
    if (odometer != nil) {
        [parameters setObject:odometer forKey:NAMES_odometer];
    } else {
        [parameters removeObjectForKey:NAMES_odometer];
    }
}

- (SDLVehicleDataResult *)odometer {
    NSObject *obj = [parameters objectForKey:NAMES_odometer];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setBeltStatus:(SDLVehicleDataResult *)beltStatus {
    if (beltStatus != nil) {
        [parameters setObject:beltStatus forKey:NAMES_beltStatus];
    } else {
        [parameters removeObjectForKey:NAMES_beltStatus];
    }
}

- (SDLVehicleDataResult *)beltStatus {
    NSObject *obj = [parameters objectForKey:NAMES_beltStatus];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setBodyInformation:(SDLVehicleDataResult *)bodyInformation {
    if (bodyInformation != nil) {
        [parameters setObject:bodyInformation forKey:NAMES_bodyInformation];
    } else {
        [parameters removeObjectForKey:NAMES_bodyInformation];
    }
}

- (SDLVehicleDataResult *)bodyInformation {
    NSObject *obj = [parameters objectForKey:NAMES_bodyInformation];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setDeviceStatus:(SDLVehicleDataResult *)deviceStatus {
    if (deviceStatus != nil) {
        [parameters setObject:deviceStatus forKey:NAMES_deviceStatus];
    } else {
        [parameters removeObjectForKey:NAMES_deviceStatus];
    }
}

- (SDLVehicleDataResult *)deviceStatus {
    NSObject *obj = [parameters objectForKey:NAMES_deviceStatus];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setDriverBraking:(SDLVehicleDataResult *)driverBraking {
    if (driverBraking != nil) {
        [parameters setObject:driverBraking forKey:NAMES_driverBraking];
    } else {
        [parameters removeObjectForKey:NAMES_driverBraking];
    }
}

- (SDLVehicleDataResult *)driverBraking {
    NSObject *obj = [parameters objectForKey:NAMES_driverBraking];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setWiperStatus:(SDLVehicleDataResult *)wiperStatus {
    if (wiperStatus != nil) {
        [parameters setObject:wiperStatus forKey:NAMES_wiperStatus];
    } else {
        [parameters removeObjectForKey:NAMES_wiperStatus];
    }
}

- (SDLVehicleDataResult *)wiperStatus {
    NSObject *obj = [parameters objectForKey:NAMES_wiperStatus];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setHeadLampStatus:(SDLVehicleDataResult *)headLampStatus {
    if (headLampStatus != nil) {
        [parameters setObject:headLampStatus forKey:NAMES_headLampStatus];
    } else {
        [parameters removeObjectForKey:NAMES_headLampStatus];
    }
}

- (SDLVehicleDataResult *)headLampStatus {
    NSObject *obj = [parameters objectForKey:NAMES_headLampStatus];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setEngineTorque:(SDLVehicleDataResult *)engineTorque {
    if (engineTorque != nil) {
        [parameters setObject:engineTorque forKey:NAMES_engineTorque];
    } else {
        [parameters removeObjectForKey:NAMES_engineTorque];
    }
}

- (SDLVehicleDataResult *)engineTorque {
    NSObject *obj = [parameters objectForKey:NAMES_engineTorque];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setAccPedalPosition:(SDLVehicleDataResult *)accPedalPosition {
    if (accPedalPosition != nil) {
        [parameters setObject:accPedalPosition forKey:NAMES_accPedalPosition];
    } else {
        [parameters removeObjectForKey:NAMES_accPedalPosition];
    }
}

- (SDLVehicleDataResult *)accPedalPosition {
    NSObject *obj = [parameters objectForKey:NAMES_accPedalPosition];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setSteeringWheelAngle:(SDLVehicleDataResult *)steeringWheelAngle {
    if (steeringWheelAngle != nil) {
        [parameters setObject:steeringWheelAngle forKey:NAMES_steeringWheelAngle];
    } else {
        [parameters removeObjectForKey:NAMES_steeringWheelAngle];
    }
}

- (SDLVehicleDataResult *)steeringWheelAngle {
    NSObject *obj = [parameters objectForKey:NAMES_steeringWheelAngle];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setECallInfo:(SDLVehicleDataResult *)eCallInfo {
    if (eCallInfo != nil) {
        [parameters setObject:eCallInfo forKey:NAMES_eCallInfo];
    } else {
        [parameters removeObjectForKey:NAMES_eCallInfo];
    }
}

- (SDLVehicleDataResult *)eCallInfo {
    NSObject *obj = [parameters objectForKey:NAMES_eCallInfo];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setAirbagStatus:(SDLVehicleDataResult *)airbagStatus {
    if (airbagStatus != nil) {
        [parameters setObject:airbagStatus forKey:NAMES_airbagStatus];
    } else {
        [parameters removeObjectForKey:NAMES_airbagStatus];
    }
}

- (SDLVehicleDataResult *)airbagStatus {
    NSObject *obj = [parameters objectForKey:NAMES_airbagStatus];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setEmergencyEvent:(SDLVehicleDataResult *)emergencyEvent {
    if (emergencyEvent != nil) {
        [parameters setObject:emergencyEvent forKey:NAMES_emergencyEvent];
    } else {
        [parameters removeObjectForKey:NAMES_emergencyEvent];
    }
}

- (SDLVehicleDataResult *)emergencyEvent {
    NSObject *obj = [parameters objectForKey:NAMES_emergencyEvent];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setClusterModes:(SDLVehicleDataResult *)clusterModes {
    if (clusterModes != nil) {
        [parameters setObject:clusterModes forKey:NAMES_clusterModes];
    } else {
        [parameters removeObjectForKey:NAMES_clusterModes];
    }
}

- (SDLVehicleDataResult *)clusterModes {
    NSObject *obj = [parameters objectForKey:NAMES_clusterModes];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setMyKey:(SDLVehicleDataResult *)myKey {
    if (myKey != nil) {
        [parameters setObject:myKey forKey:NAMES_myKey];
    } else {
        [parameters removeObjectForKey:NAMES_myKey];
    }
}

- (SDLVehicleDataResult *)myKey {
    NSObject *obj = [parameters objectForKey:NAMES_myKey];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setFuelRange:(SDLVehicleDataResult *)fuelRange {
    if (fuelRange != nil) {
        [parameters setObject:fuelRange forKey:NAMES_fuelRange];
    } else {
        [parameters removeObjectForKey:NAMES_fuelRange];
    }
    
}

- (SDLVehicleDataResult *)fuelRange {
    NSObject *obj = [parameters objectForKey:NAMES_fuelRange];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setAbs_State:(SDLVehicleDataResult *)abs_State {
    if (abs_State != nil) {
        [parameters setObject:abs_State forKey:NAMES_abs_State];
    } else {
        [parameters removeObjectForKey:NAMES_abs_State];
    }
}

- (SDLVehicleDataResult *)abs_State {
    NSObject *obj = [parameters objectForKey:NAMES_abs_State];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setTirePressureValue:(SDLVehicleDataResult *)tirePressureValue {
    if (tirePressureValue != nil) {
        [parameters setObject:tirePressureValue forKey:NAMES_tirePressureValue];
    } else {
        [parameters removeObjectForKey:NAMES_tirePressureValue];
    }
}

- (SDLVehicleDataResult *)tirePressureValue {
    NSObject *obj = [parameters objectForKey:NAMES_tirePressureValue];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setTpms:(SDLVehicleDataResult *)tpms {
    if (tpms != nil) {
        [parameters setObject:tpms forKey:NAMES_tpms];
    } else {
        [parameters removeObjectForKey:NAMES_tpms];
    }
}

- (SDLVehicleDataResult *)tpms {
    NSObject *obj = [parameters objectForKey:NAMES_tpms];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setTurnSignal:(SDLVehicleDataResult *)turnSignal {
    if (turnSignal != nil) {
        [parameters setObject:turnSignal forKey:NAMES_turnSignal];
    } else {
        [parameters removeObjectForKey:NAMES_turnSignal];
    }
}

- (SDLVehicleDataResult *)turnSignal {
    NSObject *obj = [parameters objectForKey:NAMES_turnSignal];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

- (void)setEngineOilLife:(SDLVehicleDataResult *)engineOilLife {
    if (engineOilLife != nil) {
        [parameters setObject:engineOilLife forKey:NAMES_engineOilLife];
    } else {
        [parameters removeObjectForKey:NAMES_engineOilLife];
    }
}

- (SDLVehicleDataResult *)engineOilLife {
    NSObject *obj = [parameters objectForKey:NAMES_engineOilLife];
    if (obj == nil || [obj isKindOfClass:SDLVehicleDataResult.class]) {
        return (SDLVehicleDataResult *)obj;
    } else {
        return [[SDLVehicleDataResult alloc] initWithDictionary:(NSMutableDictionary *)obj];
    }
}

@end
