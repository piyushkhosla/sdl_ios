//  FMCAirbagStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCAirbagStatus.h>

#import <AppLink/FMCNames.h>

@implementation FMCAirbagStatus

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setDriverAirbagDeployed:(FMCVehicleDataEventStatus*) driverAirbagDeployed {
    if (driverAirbagDeployed != nil) {
        [store setObject:driverAirbagDeployed forKey:NAMES_driverAirbagDeployed];
    } else {
        [store removeObjectForKey:NAMES_driverAirbagDeployed];
    }
}

-(FMCVehicleDataEventStatus*) driverAirbagDeployed {
    NSObject* obj = [store objectForKey:NAMES_driverAirbagDeployed];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setDriverSideAirbagDeployed:(FMCVehicleDataEventStatus*) driverSideAirbagDeployed {
    if (driverSideAirbagDeployed != nil) {
        [store setObject:driverSideAirbagDeployed forKey:NAMES_driverSideAirbagDeployed];
    } else {
        [store removeObjectForKey:NAMES_driverSideAirbagDeployed];
    }
}

-(FMCVehicleDataEventStatus*) driverSideAirbagDeployed {
    NSObject* obj = [store objectForKey:NAMES_driverSideAirbagDeployed];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setDriverCurtainAirbagDeployed:(FMCVehicleDataEventStatus*) driverCurtainAirbagDeployed {
    if (driverCurtainAirbagDeployed != nil) {
        [store setObject:driverCurtainAirbagDeployed forKey:NAMES_driverCurtainAirbagDeployed];
    } else {
        [store removeObjectForKey:NAMES_driverCurtainAirbagDeployed];
    }
}

-(FMCVehicleDataEventStatus*) driverCurtainAirbagDeployed {
    NSObject* obj = [store objectForKey:NAMES_driverCurtainAirbagDeployed];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setPassengerAirbagDeployed:(FMCVehicleDataEventStatus*) passengerAirbagDeployed {
    if (passengerAirbagDeployed != nil) {
        [store setObject:passengerAirbagDeployed forKey:NAMES_passengerAirbagDeployed];
    } else {
        [store removeObjectForKey:NAMES_passengerAirbagDeployed];
    }
}

-(FMCVehicleDataEventStatus*) passengerAirbagDeployed {
    NSObject* obj = [store objectForKey:NAMES_passengerAirbagDeployed];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setPassengerCurtainAirbagDeployed:(FMCVehicleDataEventStatus*) passengerCurtainAirbagDeployed {
    if (passengerCurtainAirbagDeployed != nil) {
        [store setObject:passengerCurtainAirbagDeployed forKey:NAMES_passengerCurtainAirbagDeployed];
    } else {
        [store removeObjectForKey:NAMES_passengerCurtainAirbagDeployed];
    }
}

-(FMCVehicleDataEventStatus*) passengerCurtainAirbagDeployed {
    NSObject* obj = [store objectForKey:NAMES_passengerCurtainAirbagDeployed];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setDriverKneeAirbagDeployed:(FMCVehicleDataEventStatus*) driverKneeAirbagDeployed {
    if (driverKneeAirbagDeployed != nil) {
        [store setObject:driverKneeAirbagDeployed forKey:NAMES_driverKneeAirbagDeployed];
    } else {
        [store removeObjectForKey:NAMES_driverKneeAirbagDeployed];
    }
}

-(FMCVehicleDataEventStatus*) driverKneeAirbagDeployed {
    NSObject* obj = [store objectForKey:NAMES_driverKneeAirbagDeployed];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setPassengerSideAirbagDeployed:(FMCVehicleDataEventStatus*) passengerSideAirbagDeployed {
    if (passengerSideAirbagDeployed != nil) {
        [store setObject:passengerSideAirbagDeployed forKey:NAMES_passengerSideAirbagDeployed];
    } else {
        [store removeObjectForKey:NAMES_passengerSideAirbagDeployed];
    }
}

-(FMCVehicleDataEventStatus*) passengerSideAirbagDeployed {
    NSObject* obj = [store objectForKey:NAMES_passengerSideAirbagDeployed];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setPassengerKneeAirbagDeployed:(FMCVehicleDataEventStatus*) passengerKneeAirbagDeployed {
    if (passengerKneeAirbagDeployed != nil) {
        [store setObject:passengerKneeAirbagDeployed forKey:NAMES_passengerKneeAirbagDeployed];
    } else {
        [store removeObjectForKey:NAMES_passengerKneeAirbagDeployed];
    }
}

-(FMCVehicleDataEventStatus*) passengerKneeAirbagDeployed {
    NSObject* obj = [store objectForKey:NAMES_passengerKneeAirbagDeployed];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

@end
