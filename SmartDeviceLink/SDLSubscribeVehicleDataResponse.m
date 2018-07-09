//  SDLSubscribeVehicleDataResponse.m
//


#import "SDLSubscribeVehicleDataResponse.h"

#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"
#import "SDLVehicleDataResult.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLSubscribeVehicleDataResponse

- (instancetype)init {
    if (self = [super initWithName:SDLNameSubscribeVehicleData]) {
    }
    return self;
}

- (void)setGps:(nullable SDLVehicleDataResult *)gps {
    [parameters sdl_setObject:gps forName:SDLNameGPS];
}

- (nullable SDLVehicleDataResult *)gps {
    return [parameters sdl_objectForName:SDLNameGPS ofClass:SDLVehicleDataResult.class];
}

- (void)setSpeed:(nullable SDLVehicleDataResult *)speed {
    [parameters sdl_setObject:speed forName:SDLNameSpeed];
}

- (nullable SDLVehicleDataResult *)speed {
    return [parameters sdl_objectForName:SDLNameSpeed ofClass:SDLVehicleDataResult.class];
}

- (void)setGpsArray:(nullable SDLVehicleDataResult *)gpsArray {
    [parameters sdl_setObject:gpsArray forName:SDLNameGPSArray];
}

- (nullable SDLVehicleDataResult *)gpsArray {
    return [parameters sdl_objectForName:SDLNameGPSArray ofClass:SDLVehicleDataResult.class];
}

- (void)setGpsDrArray:(nullable SDLVehicleDataResult *)gpsDrArray {
    [parameters sdl_setObject:gpsDrArray forName:SDLNameGPSDrArray];
}

- (nullable SDLVehicleDataResult *)gpsDrArray {
    return [parameters sdl_objectForName:SDLNameGPSDrArray ofClass:SDLVehicleDataResult.class];
}

- (void)setRpm:(nullable SDLVehicleDataResult *)rpm {
    [parameters sdl_setObject:rpm forName:SDLNameRPM];
}

- (nullable SDLVehicleDataResult *)rpm {
    return [parameters sdl_objectForName:SDLNameRPM ofClass:SDLVehicleDataResult.class];
}

- (void)setSpeedArray:(nullable SDLVehicleDataResult *)speedArray {
    [parameters sdl_setObject:speedArray forName:SDLNameSpeedArray];
}

- (nullable SDLVehicleDataResult *)speedArray {
    return [parameters sdl_objectForName:SDLNameSpeedArray ofClass:SDLVehicleDataResult.class];
}

- (void)setFuelLevel:(nullable SDLVehicleDataResult *)fuelLevel {
    [parameters sdl_setObject:fuelLevel forName:SDLNameFuelLevel];
}

- (nullable SDLVehicleDataResult *)fuelLevel {
    return [parameters sdl_objectForName:SDLNameFuelLevel ofClass:SDLVehicleDataResult.class];
}

- (void)setRpmArray:(nullable SDLVehicleDataResult *)rpmArray {
    [parameters sdl_setObject:rpmArray forName:SDLNameRPMArray];
}

- (nullable SDLVehicleDataResult *)rpmArray {
    return [parameters sdl_objectForName:SDLNameRPMArray ofClass:SDLVehicleDataResult.class];
}

- (void)setFuelLevel_State:(nullable SDLVehicleDataResult *)fuelLevel_State {
    [parameters sdl_setObject:fuelLevel_State forName:SDLNameFuelLevelState];
}

- (nullable SDLVehicleDataResult *)fuelLevel_State {
    return [parameters sdl_objectForName:SDLNameFuelLevelState ofClass:SDLVehicleDataResult.class];
}

- (void)setFuelLevelArray:(nullable SDLVehicleDataResult *)fuelLevelArray {
    [parameters sdl_setObject:fuelLevelArray forName:SDLNameFuelLevelArray];
}

- (nullable SDLVehicleDataResult *)fuelLevelArray {
    return [parameters sdl_objectForName:SDLNameFuelLevelArray ofClass:SDLVehicleDataResult.class];
}

- (void)setInstantFuelConsumption:(nullable SDLVehicleDataResult *)instantFuelConsumption {
    [parameters sdl_setObject:instantFuelConsumption forName:SDLNameInstantFuelConsumption];
}

- (nullable SDLVehicleDataResult *)instantFuelConsumption {
    return [parameters sdl_objectForName:SDLNameInstantFuelConsumption ofClass:SDLVehicleDataResult.class];
}

- (void)setExternalTemperature:(nullable SDLVehicleDataResult *)externalTemperature {
    [parameters sdl_setObject:externalTemperature forName:SDLNameExternalTemperature];
}

- (nullable SDLVehicleDataResult *)externalTemperature {
    return [parameters sdl_objectForName:SDLNameExternalTemperature ofClass:SDLVehicleDataResult.class];
}

- (void)setPrndl:(nullable SDLVehicleDataResult *)prndl {
    [parameters sdl_setObject:prndl forName:SDLNamePRNDL];
}

- (nullable SDLVehicleDataResult *)prndl {
    return [parameters sdl_objectForName:SDLNamePRNDL ofClass:SDLVehicleDataResult.class];
}

- (void)setFuelLevel_StateArray:(nullable SDLVehicleDataResult *)fuelLevel_StateArray {
    [parameters sdl_setObject:fuelLevel_StateArray forName:SDLNameFuelLevelStateArray];
}

- (nullable SDLVehicleDataResult *)fuelLevel_StateArray {
    return [parameters sdl_objectForName:SDLNameFuelLevelStateArray ofClass:SDLVehicleDataResult.class];
}
- (void)setExternalTemperatureArray:(nullable SDLVehicleDataResult *)externalTemperatureArray {
    [parameters sdl_setObject:externalTemperatureArray forName:SDLNameExternalTemperatureArray];
}

- (nullable SDLVehicleDataResult *)externalTemperatureArray {
    return [parameters sdl_objectForName:SDLNameExternalTemperatureArray ofClass:SDLVehicleDataResult.class];
}

- (void)setTirePressure:(nullable SDLVehicleDataResult *)tirePressure {
    [parameters sdl_setObject:tirePressure forName:SDLNameTirePressure];
}

- (nullable SDLVehicleDataResult *)tirePressure {
    return [parameters sdl_objectForName:SDLNameTirePressure ofClass:SDLVehicleDataResult.class];
}

- (void)setPrndlArray:(nullable SDLVehicleDataResult *)prndlArray {
    [parameters sdl_setObject:prndlArray forName:SDLNamePRNDLArray];
}

- (nullable SDLVehicleDataResult *)prndlArray {
    return [parameters sdl_objectForName:SDLNamePRNDLArray ofClass:SDLVehicleDataResult.class];
}

- (void)setTirePressureArray:(nullable SDLVehicleDataResult *)tirePressureArray {
    [parameters sdl_setObject:tirePressureArray forName:SDLNameTirePressureArray];
}

- (nullable SDLVehicleDataResult *)tirePressureArray {
    return [parameters sdl_objectForName:SDLNameTirePressureArray ofClass:SDLVehicleDataResult.class];
}

- (void)setOdometer:(nullable SDLVehicleDataResult *)odometer {
    [parameters sdl_setObject:odometer forName:SDLNameOdometer];
}

- (nullable SDLVehicleDataResult *)odometer {
    return [parameters sdl_objectForName:SDLNameOdometer ofClass:SDLVehicleDataResult.class];
}


- (void)setFuelRemainingRangeArray:(nullable SDLVehicleDataResult *)fuelRemainingRangeArray {
    [parameters sdl_setObject:fuelRemainingRangeArray forName:SDLNameFuelRemainingRangeArray];
}

- (nullable SDLVehicleDataResult *)fuelRemainingRangeArray {
    return [parameters sdl_objectForName:SDLNameFuelRemainingRangeArray ofClass:SDLVehicleDataResult.class];
}

- (void)setBrakePedalPositionArray:(nullable SDLVehicleDataResult *)brakePedalPositionArray {
    [parameters sdl_setObject:brakePedalPositionArray forName:SDLNameBrakePedalPositionArray];
}

- (nullable SDLVehicleDataResult *)brakePedalPositionArray {
    return [parameters sdl_objectForName:SDLNameBrakePedalPositionArray ofClass:SDLVehicleDataResult.class];
}

- (void)setBeltStatus:(nullable SDLVehicleDataResult *)beltStatus {
    [parameters sdl_setObject:beltStatus forName:SDLNameBeltStatus];
}

- (nullable SDLVehicleDataResult *)beltStatus {
    return [parameters sdl_objectForName:SDLNameBeltStatus ofClass:SDLVehicleDataResult.class];
}

- (void)setBodyInformation:(nullable SDLVehicleDataResult *)bodyInformation {
    [parameters sdl_setObject:bodyInformation forName:SDLNameBodyInformation];
}

- (nullable SDLVehicleDataResult *)bodyInformation {
    return [parameters sdl_objectForName:SDLNameBodyInformation ofClass:SDLVehicleDataResult.class];
}

- (void)setDeviceStatus:(nullable SDLVehicleDataResult *)deviceStatus {
    [parameters sdl_setObject:deviceStatus forName:SDLNameDeviceStatus];
}

- (nullable SDLVehicleDataResult *)deviceStatus {
    return [parameters sdl_objectForName:SDLNameDeviceStatus ofClass:SDLVehicleDataResult.class];
}

- (void)setDriverBraking:(nullable SDLVehicleDataResult *)driverBraking {
    [parameters sdl_setObject:driverBraking forName:SDLNameDriverBraking];
}

- (nullable SDLVehicleDataResult *)driverBraking {
    return [parameters sdl_objectForName:SDLNameDriverBraking ofClass:SDLVehicleDataResult.class];
}

- (void)setWiperStatus:(nullable SDLVehicleDataResult *)wiperStatus {
    [parameters sdl_setObject:wiperStatus forName:SDLNameWiperStatus];
}

- (nullable SDLVehicleDataResult *)wiperStatus {
    return [parameters sdl_objectForName:SDLNameWiperStatus ofClass:SDLVehicleDataResult.class];
}

- (void)setHeadLampStatus:(nullable SDLVehicleDataResult *)headLampStatus {
    [parameters sdl_setObject:headLampStatus forName:SDLNameHeadLampStatus];
}

- (nullable SDLVehicleDataResult *)headLampStatus {
    return [parameters sdl_objectForName:SDLNameHeadLampStatus ofClass:SDLVehicleDataResult.class];
}

- (void)setEngineTorque:(nullable SDLVehicleDataResult *)engineTorque {
    [parameters sdl_setObject:engineTorque forName:SDLNameEngineTorque];
}

- (nullable SDLVehicleDataResult *)engineTorque {
    return [parameters sdl_objectForName:SDLNameEngineTorque ofClass:SDLVehicleDataResult.class];
}

- (void)setAccPedalPosition:(nullable SDLVehicleDataResult *)accPedalPosition {
    [parameters sdl_setObject:accPedalPosition forName:SDLNameAccelerationPedalPosition];
}

- (nullable SDLVehicleDataResult *)accPedalPosition {
    return [parameters sdl_objectForName:SDLNameAccelerationPedalPosition ofClass:SDLVehicleDataResult.class];
}

- (void)setEngineTorqueArray:(nullable SDLVehicleDataResult *)engineTorqueArray {
    [parameters sdl_setObject:engineTorqueArray forName:SDLNameEngineTorqueArray];
}

- (nullable SDLVehicleDataResult *)engineTorqueArray {
    return [parameters sdl_objectForName:SDLNameEngineTorqueArray ofClass:SDLVehicleDataResult.class];
}

- (void)setSteeringWheelAngle:(nullable SDLVehicleDataResult *)steeringWheelAngle {
    [parameters sdl_setObject:steeringWheelAngle forName:SDLNameSteeringWheelAngle];
}

- (nullable SDLVehicleDataResult *)steeringWheelAngle {
    return [parameters sdl_objectForName:SDLNameSteeringWheelAngle ofClass:SDLVehicleDataResult.class];
}

- (void)setAccPedalPositionArray:(nullable SDLVehicleDataResult *)accPedalPositionArray {
    [parameters sdl_setObject:accPedalPositionArray forName:SDLNameAccelerationPedalPositionArray];
}

- (nullable SDLVehicleDataResult *)accPedalPositionArray {
    return [parameters sdl_objectForName:SDLNameAccelerationPedalPositionArray ofClass:SDLVehicleDataResult.class];
}

- (void)setECallInfo:(nullable SDLVehicleDataResult *)eCallInfo {
    [parameters sdl_setObject:eCallInfo forName:SDLNameECallInfo];
}

- (nullable SDLVehicleDataResult *)eCallInfo {
    return [parameters sdl_objectForName:SDLNameECallInfo ofClass:SDLVehicleDataResult.class];
}

- (void)setSteeringWheelAngleArray:(nullable SDLVehicleDataResult *)steeringWheelAngleArray {
    [parameters sdl_setObject:steeringWheelAngleArray forName:SDLNameSteeringWheelAngleArray];
}

- (nullable SDLVehicleDataResult *)steeringWheelAngleArray {
    return [parameters sdl_objectForName:SDLNameSteeringWheelAngleArray ofClass:SDLVehicleDataResult.class];
}

- (void)setAccelerometerArray:(nullable SDLVehicleDataResult *)accelerometerArray {
    [parameters sdl_setObject:accelerometerArray forName:SDLNameAccelerometerArray];
}

- (nullable SDLVehicleDataResult *)accelerometerArray {
    return [parameters sdl_objectForName:SDLNameAccelerometerArray ofClass:SDLVehicleDataResult.class];
}

- (void)setGyroscopeArray:(nullable SDLVehicleDataResult *)gyroscopeArray {
    [parameters sdl_setObject:gyroscopeArray forName:SDLNameGyroscopeArray];
}

- (nullable SDLVehicleDataResult *)gyroscopeArray {
    return [parameters sdl_objectForName:SDLNameGyroscopeArray ofClass:SDLVehicleDataResult.class];
}

- (void)setWheelSpeedsArray:(nullable SDLVehicleDataResult *)wheelSpeedsArray {
    [parameters sdl_setObject:wheelSpeedsArray forName:SDLNameWheelSpeedsArray];
}

- (nullable SDLVehicleDataResult *)wheelSpeedsArray {
    return [parameters sdl_objectForName:SDLNameWheelSpeedsArray ofClass:SDLVehicleDataResult.class];
}

- (void)setAirbagStatus:(nullable SDLVehicleDataResult *)airbagStatus {
    [parameters sdl_setObject:airbagStatus forName:SDLNameAirbagStatus];
}

- (nullable SDLVehicleDataResult *)airbagStatus {
    return [parameters sdl_objectForName:SDLNameAirbagStatus ofClass:SDLVehicleDataResult.class];
}

- (void)setEmergencyEvent:(nullable SDLVehicleDataResult *)emergencyEvent {
    [parameters sdl_setObject:emergencyEvent forName:SDLNameEmergencyEvent];
}

- (nullable SDLVehicleDataResult *)emergencyEvent {
    return [parameters sdl_objectForName:SDLNameEmergencyEvent ofClass:SDLVehicleDataResult.class];
}

- (void)setClusterModes:(nullable SDLVehicleDataResult *)clusterModes {
    [parameters sdl_setObject:clusterModes forName:SDLNameClusterModes];
}

- (nullable SDLVehicleDataResult *)clusterModes {
    return [parameters sdl_objectForName:SDLNameClusterModes ofClass:SDLVehicleDataResult.class];
}

- (void)setMyKey:(nullable SDLVehicleDataResult *)myKey {
    [parameters sdl_setObject:myKey forName:SDLNameMyKey];
}

- (nullable SDLVehicleDataResult *)myKey {
    return [parameters sdl_objectForName:SDLNameMyKey ofClass:SDLVehicleDataResult.class];
}

@end

NS_ASSUME_NONNULL_END

