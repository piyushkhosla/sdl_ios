//  SDLOnVehicleData.m
//

#import "SDLOnVehicleData.h"

#import "NSMutableDictionary+Store.h"
#import "SDLAccPedalPositionType.h"
#import "SDLAxisSensorDataType.h"
#import "SDLAirbagStatus.h"
#import "SDLBeltStatus.h"
#import "SDLBodyInformation.h"
#import "SDLClusterModeStatus.h"
#import "SDLComponentVolumeStatus.h"
#import "SDLComponentVolumeStatusType.h"
#import "SDLDeviceStatus.h"
#import "SDLECallInfo.h"
#import "SDLEmergencyEvent.h"
#import "SDLEngineTorqueType.h"
#import "SDLExternalTemperatureType.h"
#import "SDLFuelLevelType.h"
#import "SDLGPSData.h"
#import "SDLGPSDataType.h"
#import "SDLGPSDrDataType.h"
#import "SDLHeadLampStatus.h"
#import "SDLMyKey.h"
#import "SDLNames.h"
#import "SDLPRNDLType.h"
#import "SDLRpmType.h"
#import "SDLSpeedType.h"
#import "SDLSteeringWheelAngleType.h"
#import "SDLTireStatus.h"
#import "SDLTireStatusType.h"
#import "SDLWheelSpeedsDataType.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLOnVehicleData

- (instancetype)init {
    if (self = [super initWithName:SDLNameOnVehicleData]) {
    }
    return self;
}

- (void)setGps:(nullable SDLGPSData *)gps {
    [parameters sdl_setObject:gps forName:SDLNameGPS];
}

- (nullable SDLGPSData *)gps {
    return [parameters sdl_objectForName:SDLNameGPS ofClass:SDLGPSData.class];
}

- (void)setSpeed:(nullable NSNumber<SDLFloat> *)speed {
    [parameters sdl_setObject:speed forName:SDLNameSpeed];
}

- (nullable NSNumber<SDLFloat> *)speed {
    return [parameters sdl_objectForName:SDLNameSpeed];
}

- (void)setGpsArray:(nullable NSMutableArray<SDLGPSDataType *> *)gpsArray {
    [parameters sdl_setObject:gpsArray forName:SDLNameGPSArray];
}

- (nullable NSMutableArray<SDLGPSDataType *> *)gpsArray {
    return [parameters sdl_objectForName:SDLNameGPSArray];
}

- (void)setGpsDrArray:(nullable NSMutableArray<SDLGPSDrDataType *> *)gpsDrArray {
    [parameters sdl_setObject:gpsDrArray forName:SDLNameGPSDrArray];
}

- (nullable NSMutableArray<SDLGPSDrDataType *> *)gpsDrArray {
    return [parameters sdl_objectForName:SDLNameGPSDrArray];
}

- (void)setRpm:(nullable NSNumber<SDLInt> *)rpm {
    [parameters sdl_setObject:rpm forName:SDLNameRPM];
}

- (nullable NSNumber<SDLInt> *)rpm {
    return [parameters sdl_objectForName:SDLNameRPM];
}

- (nullable NSMutableArray<SDLSpeedType *> *)speedArray {
    return [parameters sdl_objectForName:SDLNameSpeedArray];
}

- (void)setSpeedArray:(nullable NSMutableArray<SDLSpeedType *> *)speedArray {
    [parameters sdl_setObject:speedArray forName:SDLNameSpeedArray];
}

- (void)setFuelLevel:(nullable NSNumber<SDLFloat> *)fuelLevel {
    [parameters sdl_setObject:fuelLevel forName:SDLNameFuelLevel];
}

- (nullable NSNumber<SDLFloat> *)fuelLevel {
    return [parameters sdl_objectForName:SDLNameFuelLevel];
}

- (void)setRpmArray:(nullable NSMutableArray<SDLRpmType *> *)rpmArray {
    [parameters sdl_setObject:rpmArray forName:SDLNameRPMArray];
}

- (nullable NSMutableArray<SDLRpmType *> *)rpmArray {
    return [parameters sdl_objectForName:SDLNameRPMArray];
}

- (void)setFuelLevel_State:(nullable SDLComponentVolumeStatus)fuelLevel_State {
    [parameters sdl_setObject:fuelLevel_State forName:SDLNameFuelLevelState];
}

- (nullable SDLComponentVolumeStatus)fuelLevel_State {
    return [parameters sdl_objectForName:SDLNameFuelLevelState];
}

- (void)setFuelLevelArray:(nullable NSMutableArray<SDLFuelLevelType *> *)fuelLevelArray {
    [parameters sdl_setObject:fuelLevelArray forName:SDLNameFuelLevelArray];
}

- (nullable NSMutableArray<SDLFuelLevelType *> *)fuelLevelArray {
    return [parameters sdl_objectForName:SDLNameFuelLevelArray];
}

- (void)setInstantFuelConsumption:(nullable NSNumber<SDLFloat> *)instantFuelConsumption {
    [parameters sdl_setObject:instantFuelConsumption forName:SDLNameInstantFuelConsumption];
}

- (nullable NSNumber<SDLFloat> *)instantFuelConsumption {
    return [parameters sdl_objectForName:SDLNameInstantFuelConsumption];
}

- (void)setFuelLevel_StateArray:(nullable NSMutableArray<SDLComponentVolumeStatusType *> *)fuelLevel_StateArray {
    [parameters sdl_setObject:fuelLevel_StateArray forName:SDLNameFuelLevelStateArray];
}

- (nullable NSMutableArray<SDLComponentVolumeStatusType *> *)fuelLevel_StateArray {
    return [parameters sdl_objectForName:SDLNameFuelLevelStateArray];
}

- (void)setExternalTemperature:(nullable NSNumber<SDLFloat> *)externalTemperature {
    [parameters sdl_setObject:externalTemperature forName:SDLNameExternalTemperature];
}

- (nullable NSNumber<SDLFloat> *)externalTemperature {
    return [parameters sdl_objectForName:SDLNameExternalTemperature];
}

- (void)setVin:(nullable NSString *)vin {
    [parameters sdl_setObject:vin forName:SDLNameVIN];
}

- (nullable NSString *)vin {
    return [parameters sdl_objectForName:SDLNameVIN];
}

- (void)setExternalTemperatureArray:(nullable NSMutableArray<SDLExternalTemperatureType *> *)externalTemperatureArray {
    [parameters sdl_setObject:externalTemperatureArray forName:SDLNameExternalTemperatureArray];
}

- (nullable NSMutableArray<SDLExternalTemperatureType *> *)externalTemperatureArray {
    return [parameters sdl_objectForName:SDLNameExternalTemperatureArray];
}

- (void)setPrndl:(nullable SDLPRNDL)prndl {
    [parameters sdl_setObject:prndl forName:SDLNamePRNDL];
}

- (nullable SDLPRNDL)prndl {
    return [parameters sdl_objectForName:SDLNamePRNDL];
}

- (void)setTirePressure:(nullable SDLTireStatus *)tirePressure {
    [parameters sdl_setObject:tirePressure forName:SDLNameTirePressure];
}

- (nullable SDLTireStatus *)tirePressure {
    return [parameters sdl_objectForName:SDLNameTirePressure ofClass:SDLTireStatus.class];
}

- (void)setPrndlArray:(nullable NSMutableArray<SDLPRNDLType *>*)prndlArray {
    [parameters sdl_setObject:prndlArray forName:SDLNamePRNDLArray];
}

- (nullable NSMutableArray<SDLPRNDLType *> *)prndlArray {
    return [parameters sdl_objectForName:SDLNamePRNDLArray];
}

- (void)setOdometer:(nullable NSNumber<SDLInt> *)odometer {
    [parameters sdl_setObject:odometer forName:SDLNameOdometer];
}

- (nullable NSNumber<SDLInt> *)odometer {
    return [parameters sdl_objectForName:SDLNameOdometer];
}

- (void)setTirePressureArray:(nullable NSMutableArray<SDLTireStatusType *> *)tirePressureArray {
    [parameters sdl_setObject:tirePressureArray forName:SDLNameTirePressureArray];
}

- (nullable NSMutableArray<SDLTireStatusType *> *)tirePressureArray {
    return [parameters sdl_objectForName:SDLNameTirePressureArray];
}

- (void)setBeltStatus:(nullable SDLBeltStatus *)beltStatus {
    [parameters sdl_setObject:beltStatus forName:SDLNameBeltStatus];
}

- (nullable SDLBeltStatus *)beltStatus {
    return [parameters sdl_objectForName:SDLNameBeltStatus ofClass:SDLBeltStatus.class];
}

- (void)setBodyInformation:(nullable SDLBodyInformation *)bodyInformation {
    [parameters sdl_setObject:bodyInformation forName:SDLNameBodyInformation];
}

- (nullable SDLBodyInformation *)bodyInformation {
    return [parameters sdl_objectForName:SDLNameBodyInformation ofClass:SDLBodyInformation.class];
}

- (void)setDeviceStatus:(nullable SDLDeviceStatus *)deviceStatus {
    [parameters sdl_setObject:deviceStatus forName:SDLNameDeviceStatus];
}

- (nullable SDLDeviceStatus *)deviceStatus {
    return [parameters sdl_objectForName:SDLNameDeviceStatus ofClass:SDLDeviceStatus.class];
}

- (void)setDriverBraking:(nullable SDLVehicleDataEventStatus)driverBraking {
    [parameters sdl_setObject:driverBraking forName:SDLNameDriverBraking];
}

- (nullable SDLVehicleDataEventStatus)driverBraking {
    return [parameters sdl_objectForName:SDLNameDriverBraking];
}

- (void)setWiperStatus:(nullable SDLWiperStatus)wiperStatus {
    [parameters sdl_setObject:wiperStatus forName:SDLNameWiperStatus];
}

- (nullable SDLWiperStatus)wiperStatus {
    return [parameters sdl_objectForName:SDLNameWiperStatus];
}

- (void)setFuelRemainingRangeArray:(nullable NSMutableArray<SDLFuelRemainingRangeType *> *)fuelRemainingRangeArray {
    [parameters sdl_setObject:fuelRemainingRangeArray forName:SDLNameFuelRemainingRangeArray];
}

- (nullable NSMutableArray<SDLFuelRemainingRangeType *>*)fuelRemainingRangeArray {
    return [parameters sdl_objectForName:SDLNameFuelRemainingRangeArray];
}

- (void)setBrakePedalPositionArray:(nullable NSMutableArray<SDLBrakePedalPositionType *> *)brakePedalPositionArray {
    [parameters sdl_setObject:brakePedalPositionArray forName:SDLNameBrakePedalPositionArray];
}

- (nullable NSMutableArray<SDLBrakePedalPositionType *>*)brakePedalPositionArray {
    return [parameters sdl_objectForName:SDLNameBrakePedalPositionArray];
}

- (void)setHeadLampStatus:(nullable SDLHeadLampStatus *)headLampStatus {
    [parameters sdl_setObject:headLampStatus forName:SDLNameHeadLampStatus];
}

- (nullable SDLHeadLampStatus *)headLampStatus {
    return [parameters sdl_objectForName:SDLNameHeadLampStatus ofClass:SDLHeadLampStatus.class];
}

- (void)setEngineTorque:(nullable NSNumber<SDLFloat> *)engineTorque {
    [parameters sdl_setObject:engineTorque forName:SDLNameEngineTorque];
}

- (nullable NSNumber<SDLFloat> *)engineTorque {
    return [parameters sdl_objectForName:SDLNameEngineTorque];
}

- (void)setAccPedalPosition:(nullable NSNumber<SDLFloat> *)accPedalPosition {
    [parameters sdl_setObject:accPedalPosition forName:SDLNameAccelerationPedalPosition];
}

- (nullable NSNumber<SDLFloat> *)accPedalPosition {
    return [parameters sdl_objectForName:SDLNameAccelerationPedalPosition];
}

- (void)setEngineTorqueArray:(nullable NSMutableArray<SDLEngineTorqueType *> *)engineTorqueArray {
    [parameters sdl_setObject:engineTorqueArray forName:SDLNameEngineTorqueArray];
}

- (nullable NSMutableArray<SDLEngineTorqueType *> *)engineTorqueArray {
    return [parameters sdl_objectForName:SDLNameEngineTorqueArray];
}

- (void)setSteeringWheelAngle:(nullable NSNumber<SDLFloat> *)steeringWheelAngle {
    [parameters sdl_setObject:steeringWheelAngle forName:SDLNameSteeringWheelAngle];
}

- (nullable NSNumber<SDLFloat> *)steeringWheelAngle {
    return [parameters sdl_objectForName:SDLNameSteeringWheelAngle];
}

- (void)setAccPedalPositionArray:(nullable NSMutableArray<SDLAccPedalPositionType *> *)accPedalPositionArray {
    [parameters sdl_setObject:accPedalPositionArray forName:SDLNameAccelerationPedalPositionArray];
}

- (nullable NSMutableArray<SDLAccPedalPositionType *> *)accPedalPositionArray {
    return [parameters sdl_objectForName:SDLNameAccelerationPedalPositionArray];
}

- (void)setECallInfo:(nullable SDLECallInfo *)eCallInfo {
    [parameters sdl_setObject:eCallInfo forName:SDLNameECallInfo];
}

- (nullable SDLECallInfo *)eCallInfo {
    return [parameters sdl_objectForName:SDLNameECallInfo ofClass:SDLECallInfo.class];
}

- (void)setSteeringWheelAngleArray:(nullable NSMutableArray<SDLSteeringWheelAngleType *> *)steeringWheelAngleArray {
    [parameters sdl_setObject:steeringWheelAngleArray forName:SDLNameSteeringWheelAngleArray];
}

- (nullable NSMutableArray<SDLSteeringWheelAngleType *> *)steeringWheelAngleArray {
    return [parameters sdl_objectForName:SDLNameSteeringWheelAngleArray];
}

- (void)setAccelerometerArray:(nullable NSMutableArray<SDLAxisSensorDataType *>*)accelerometerArray {
    [parameters sdl_setObject:accelerometerArray forName:SDLNameAccelerometerArray];
}

- (nullable NSMutableArray<SDLAxisSensorDataType *>*)accelerometerArray {
    return [parameters sdl_objectForName:SDLNameAccelerometerArray];
}

- (void)setGyroscopeArray:(nullable NSMutableArray<SDLAxisSensorDataType *> *)gyroscopeArray {
    [parameters sdl_setObject:gyroscopeArray forName:SDLNameGyroscopeArray];
}

- (nullable NSMutableArray<SDLAxisSensorDataType *>*)gyroscopeArray {
    return [parameters sdl_objectForName:SDLNameGyroscopeArray];
}

- (void)setWheelSpeedsArray:(nullable NSMutableArray<SDLWheelSpeedsDataType *>*)wheelSpeedsArray {
    [parameters sdl_setObject:wheelSpeedsArray forName:SDLNameWheelSpeedsArray];
}

- (nullable NSMutableArray<SDLWheelSpeedsDataType *> *)wheelSpeedsArray {
    return [parameters sdl_objectForName:SDLNameWheelSpeedsArray];
}

- (void)setAirbagStatus:(nullable SDLAirbagStatus *)airbagStatus {
    [parameters sdl_setObject:airbagStatus forName:SDLNameAirbagStatus];
}

- (nullable SDLAirbagStatus *)airbagStatus {
    return [parameters sdl_objectForName:SDLNameAirbagStatus ofClass:SDLAirbagStatus.class];
}

- (void)setEmergencyEvent:(nullable SDLEmergencyEvent *)emergencyEvent {
    [parameters sdl_setObject:emergencyEvent forName:SDLNameEmergencyEvent];
}

- (nullable SDLEmergencyEvent *)emergencyEvent {
    return [parameters sdl_objectForName:SDLNameEmergencyEvent ofClass:SDLEmergencyEvent.class];
}

- (void)setClusterModeStatus:(nullable SDLClusterModeStatus *)clusterModeStatus {
    [parameters sdl_setObject:clusterModeStatus forName:SDLNameClusterModeStatus];
}

- (nullable SDLClusterModeStatus *)clusterModeStatus {
    return [parameters sdl_objectForName:SDLNameClusterModeStatus ofClass:SDLClusterModeStatus.class];
}

- (void)setMyKey:(nullable SDLMyKey *)myKey {
    [parameters sdl_setObject:myKey forName:SDLNameMyKey];
}

- (nullable SDLMyKey *)myKey {
    return [parameters sdl_objectForName:SDLNameMyKey ofClass:SDLMyKey.class];
}

@end

NS_ASSUME_NONNULL_END

