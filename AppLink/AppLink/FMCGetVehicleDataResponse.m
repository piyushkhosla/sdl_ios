//  FMCGetVehicleDataResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCGetVehicleDataResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCGetVehicleDataResponse

-(id) init {
    if (self = [super initWithName:NAMES_GetVehicleData]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setGps:(FMCGPSData*) gps {
    if (gps != nil) {
        [parameters setObject:gps forKey:NAMES_gps];
    } else {
        [parameters removeObjectForKey:NAMES_gps];
    }
}

-(FMCGPSData*) gps {
    NSObject* obj = [parameters objectForKey:NAMES_gps];
    if ([obj isKindOfClass:FMCGPSData.class]) {
        return (FMCGPSData*)obj;
    } else {
        return [[[FMCGPSData alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setSpeed:(NSNumber*) speed {
    if (speed != nil) {
        [parameters setObject:speed forKey:NAMES_speed];
    } else {
        [parameters removeObjectForKey:NAMES_speed];
    }
}

-(NSNumber*) speed {
    return [parameters objectForKey:NAMES_speed];
}

-(void) setRpm:(NSNumber*) rpm {
    if (rpm != nil) {
        [parameters setObject:rpm forKey:NAMES_rpm];
    } else {
        [parameters removeObjectForKey:NAMES_rpm];
    }
}

-(NSNumber*) rpm {
    return [parameters objectForKey:NAMES_rpm];
}

-(void) setFuelLevel:(NSNumber*) fuelLevel {
    if (fuelLevel != nil) {
        [parameters setObject:fuelLevel forKey:NAMES_fuelLevel];
    } else {
        [parameters removeObjectForKey:NAMES_fuelLevel];
    }
}

-(NSNumber*) fuelLevel {
    return [parameters objectForKey:NAMES_fuelLevel];
}

-(void) setFuelLevelState:(FMCComponentVolumeStatus*) fuelLevelState {
    if (fuelLevelState != nil) {
        [parameters setObject:fuelLevelState forKey:NAMES_fuelLevelState];
    } else {
        [parameters removeObjectForKey:NAMES_fuelLevelState];
    }
}

-(FMCComponentVolumeStatus*) fuelLevelState {
    NSObject* obj = [parameters objectForKey:NAMES_fuelLevelState];
    if ([obj isKindOfClass:FMCComponentVolumeStatus.class]) {
        return (FMCComponentVolumeStatus*)obj;
    } else {
        return [FMCComponentVolumeStatus valueOf:(NSString*)obj];
    }
}

-(void) setInstantFuelConsumption:(NSNumber*) instantFuelConsumption {
    if (instantFuelConsumption != nil) {
        [parameters setObject:instantFuelConsumption forKey:NAMES_instantFuelConsumption];
    } else {
        [parameters removeObjectForKey:NAMES_instantFuelConsumption];
    }
}

-(NSNumber*) instantFuelConsumption {
    return [parameters objectForKey:NAMES_instantFuelConsumption];
}

-(void) setExternalTemperature:(NSNumber*) externalTemperature {
    if (externalTemperature != nil) {
        [parameters setObject:externalTemperature forKey:NAMES_externalTemperature];
    } else {
        [parameters removeObjectForKey:NAMES_externalTemperature];
    }
}

-(NSNumber*) externalTemperature {
    return [parameters objectForKey:NAMES_externalTemperature];
}

-(void) setVin:(NSString*) vin {
    if (vin != nil) {
        [parameters setObject:vin forKey:NAMES_vin];
    } else {
        [parameters removeObjectForKey:NAMES_vin];
    }
}

-(NSString*) vin {
    return [parameters objectForKey:NAMES_vin];
}

-(void) setPrndl:(FMCPRNDL*) prndl {
    if (prndl != nil) {
        [parameters setObject:prndl forKey:NAMES_prndl];
    } else {
        [parameters removeObjectForKey:NAMES_prndl];
    }
}

-(FMCPRNDL*) prndl {
    NSObject* obj = [parameters objectForKey:NAMES_prndl];
    if ([obj isKindOfClass:FMCPRNDL.class]) {
        return (FMCPRNDL*)obj;
    } else {
        return [FMCPRNDL valueOf:(NSString*)obj];
    }
}

-(void) setTirePressure:(FMCTireStatus*) tirePressure {
    if (tirePressure != nil) {
        [parameters setObject:tirePressure forKey:NAMES_tirePressure];
    } else {
        [parameters removeObjectForKey:NAMES_tirePressure];
    }
}

-(FMCTireStatus*) tirePressure {
    NSObject* obj = [parameters objectForKey:NAMES_tirePressure];
    if ([obj isKindOfClass:FMCTireStatus.class]) {
        return (FMCTireStatus*)obj;
    } else {
        return [[[FMCTireStatus alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setOdometer:(NSNumber*) odometer {
    if (odometer != nil) {
        [parameters setObject:odometer forKey:NAMES_odometer];
    } else {
        [parameters removeObjectForKey:NAMES_odometer];
    }
}

-(NSNumber*) odometer {
    return [parameters objectForKey:NAMES_odometer];
}

-(void) setBeltStatus:(FMCBeltStatus*) beltStatus {
    if (beltStatus != nil) {
        [parameters setObject:beltStatus forKey:NAMES_beltStatus];
    } else {
        [parameters removeObjectForKey:NAMES_beltStatus];
    }
}

-(FMCBeltStatus*) beltStatus {
    NSObject* obj = [parameters objectForKey:NAMES_beltStatus];
    if ([obj isKindOfClass:FMCBeltStatus.class]) {
        return (FMCBeltStatus*)obj;
    } else {
        return [[[FMCBeltStatus alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setBodyInformation:(FMCBodyInformation*) bodyInformation {
    if (bodyInformation != nil) {
        [parameters setObject:bodyInformation forKey:NAMES_bodyInformation];
    } else {
        [parameters removeObjectForKey:NAMES_bodyInformation];
    }
}

-(FMCBodyInformation*) bodyInformation {
    NSObject* obj = [parameters objectForKey:NAMES_bodyInformation];
    if ([obj isKindOfClass:FMCBodyInformation.class]) {
        return (FMCBodyInformation*)obj;
    } else {
        return [[[FMCBodyInformation alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setDeviceStatus:(FMCDeviceStatus*) deviceStatus {
    if (deviceStatus != nil) {
        [parameters setObject:deviceStatus forKey:NAMES_deviceStatus];
    } else {
        [parameters removeObjectForKey:NAMES_deviceStatus];
    }
}

-(FMCDeviceStatus*) deviceStatus {
    NSObject* obj = [parameters objectForKey:NAMES_deviceStatus];
    if ([obj isKindOfClass:FMCDeviceStatus.class]) {
        return (FMCDeviceStatus*)obj;
    } else {
        return [[[FMCDeviceStatus alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setDriverBraking:(FMCVehicleDataEventStatus*) driverBraking {
    if (driverBraking != nil) {
        [parameters setObject:driverBraking forKey:NAMES_driverBraking];
    } else {
        [parameters removeObjectForKey:NAMES_driverBraking];
    }
}

-(FMCVehicleDataEventStatus*) driverBraking {
    NSObject* obj = [parameters objectForKey:NAMES_driverBraking];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setWiperStatus:(FMCWiperStatus*) wiperStatus {
    if (wiperStatus != nil) {
        [parameters setObject:wiperStatus forKey:NAMES_wiperStatus];
    } else {
        [parameters removeObjectForKey:NAMES_wiperStatus];
    }
}

-(FMCWiperStatus*) wiperStatus {
    NSObject* obj = [parameters objectForKey:NAMES_wiperStatus];
    if ([obj isKindOfClass:FMCWiperStatus.class]) {
        return (FMCWiperStatus*)obj;
    } else {
        return [FMCWiperStatus valueOf:(NSString*)obj];
    }
}

-(void) setHeadLampStatus:(FMCHeadLampStatus*) headLampStatus {
    if (headLampStatus != nil) {
        [parameters setObject:headLampStatus forKey:NAMES_headLampStatus];
    } else {
        [parameters removeObjectForKey:NAMES_headLampStatus];
    }
}

-(FMCHeadLampStatus*) headLampStatus {
    NSObject* obj = [parameters objectForKey:NAMES_headLampStatus];
    if ([obj isKindOfClass:FMCHeadLampStatus.class]) {
        return (FMCHeadLampStatus*)obj;
    } else {
        return [[[FMCHeadLampStatus alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setEngineTorque:(NSNumber*) engineTorque {
    if (engineTorque != nil) {
        [parameters setObject:engineTorque forKey:NAMES_engineTorque];
    } else {
        [parameters removeObjectForKey:NAMES_engineTorque];
    }
}

-(NSNumber*) engineTorque {
    return [parameters objectForKey:NAMES_engineTorque];
}

-(void) setAccPedalPosition:(NSNumber*) accPedalPosition {
    if (accPedalPosition != nil) {
        [parameters setObject:accPedalPosition forKey:NAMES_accPedalPosition];
    } else {
        [parameters removeObjectForKey:NAMES_accPedalPosition];
    }
}

-(NSNumber*) accPedalPosition {
    return [parameters objectForKey:NAMES_accPedalPosition];
}

-(void) setSteeringWheelAngle:(NSNumber*) steeringWheelAngle {
    if (steeringWheelAngle != nil) {
        [parameters setObject:steeringWheelAngle forKey:NAMES_steeringWheelAngle];
    } else {
        [parameters removeObjectForKey:NAMES_steeringWheelAngle];
    }
}

-(NSNumber*) steeringWheelAngle {
    return [parameters objectForKey:NAMES_steeringWheelAngle];
}

@end
