//  FMCEmergencyEvent.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCEmergencyEvent.h>

#import <AppLink/FMCNames.h>

@implementation FMCEmergencyEvent

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setEmergencyEventType:(FMCEmergencyEventType*) emergencyEventType {
    if (emergencyEventType != nil) {
        [store setObject:emergencyEventType forKey:NAMES_emergencyEventType];
    } else {
        [store removeObjectForKey:NAMES_emergencyEventType];
    }
}

-(FMCEmergencyEventType*) emergencyEventType {
    NSObject* obj = [store objectForKey:NAMES_emergencyEventType];
    if ([obj isKindOfClass:FMCEmergencyEventType.class]) {
        return (FMCEmergencyEventType*)obj;
    } else {
        return [FMCEmergencyEventType valueOf:(NSString*)obj];
    }
}

-(void) setFuelCutoffStatus:(FMCFuelCutoffStatus*) fuelCutoffStatus {
    if (fuelCutoffStatus != nil) {
        [store setObject:fuelCutoffStatus forKey:NAMES_fuelCutoffStatus];
    } else {
        [store removeObjectForKey:NAMES_fuelCutoffStatus];
    }
}

-(FMCFuelCutoffStatus*) fuelCutoffStatus {
    NSObject* obj = [store objectForKey:NAMES_fuelCutoffStatus];
    if ([obj isKindOfClass:FMCFuelCutoffStatus.class]) {
        return (FMCFuelCutoffStatus*)obj;
    } else {
        return [FMCFuelCutoffStatus valueOf:(NSString*)obj];
    }
}

-(void) setRolloverEvent:(FMCVehicleDataEventStatus*) rolloverEvent {
    if (rolloverEvent != nil) {
        [store setObject:rolloverEvent forKey:NAMES_rolloverEvent];
    } else {
        [store removeObjectForKey:NAMES_rolloverEvent];
    }
}

-(FMCVehicleDataEventStatus*) rolloverEvent {
    NSObject* obj = [store objectForKey:NAMES_rolloverEvent];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setMaximumChangeVelocity:(NSNumber*) maximumChangeVelocity {
    if (maximumChangeVelocity != nil) {
        [store setObject:maximumChangeVelocity forKey:NAMES_maximumChangeVelocity];
    } else {
        [store removeObjectForKey:NAMES_maximumChangeVelocity];
    }
}

-(NSNumber*) maximumChangeVelocity {
    return [store objectForKey:NAMES_maximumChangeVelocity];
}

-(void) setMultipleEvents:(FMCVehicleDataEventStatus*) multipleEvents {
    if (multipleEvents != nil) {
        [store setObject:multipleEvents forKey:NAMES_multipleEvents];
    } else {
        [store removeObjectForKey:NAMES_multipleEvents];
    }
}

-(FMCVehicleDataEventStatus*) multipleEvents {
    NSObject* obj = [store objectForKey:NAMES_multipleEvents];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

@end
