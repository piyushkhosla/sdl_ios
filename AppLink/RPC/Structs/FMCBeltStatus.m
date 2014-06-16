//  FMCBeltStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Structs/FMCBeltStatus.h>

#import <AppLink/FMCNames.h>

@implementation FMCBeltStatus

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setDriverBeltDeployed:(FMCVehicleDataEventStatus*) driverBeltDeployed {
    if (driverBeltDeployed != nil) {
        [store setObject:driverBeltDeployed forKey:NAMES_driverBeltDeployed];
    } else {
        [store removeObjectForKey:NAMES_driverBeltDeployed];
    }
}

-(FMCVehicleDataEventStatus*) driverBeltDeployed {
    NSObject* obj = [store objectForKey:NAMES_driverBeltDeployed];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setPassengerBeltDeployed:(FMCVehicleDataEventStatus*) passengerBeltDeployed {
    if (passengerBeltDeployed != nil) {
        [store setObject:passengerBeltDeployed forKey:NAMES_passengerBeltDeployed];
    } else {
        [store removeObjectForKey:NAMES_passengerBeltDeployed];
    }
}

-(FMCVehicleDataEventStatus*) passengerBeltDeployed {
    NSObject* obj = [store objectForKey:NAMES_passengerBeltDeployed];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setPassengerBuckleBelted:(FMCVehicleDataEventStatus*) passengerBuckleBelted {
    if (passengerBuckleBelted != nil) {
        [store setObject:passengerBuckleBelted forKey:NAMES_passengerBuckleBelted];
    } else {
        [store removeObjectForKey:NAMES_passengerBuckleBelted];
    }
}

-(FMCVehicleDataEventStatus*) passengerBuckleBelted {
    NSObject* obj = [store objectForKey:NAMES_passengerBuckleBelted];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setDriverBuckleBelted:(FMCVehicleDataEventStatus*) driverBuckleBelted {
    if (driverBuckleBelted != nil) {
        [store setObject:driverBuckleBelted forKey:NAMES_driverBuckleBelted];
    } else {
        [store removeObjectForKey:NAMES_driverBuckleBelted];
    }
}

-(FMCVehicleDataEventStatus*) driverBuckleBelted {
    NSObject* obj = [store objectForKey:NAMES_driverBuckleBelted];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setLeftRow2BuckleBelted:(FMCVehicleDataEventStatus*) leftRow2BuckleBelted {
    if (leftRow2BuckleBelted != nil) {
        [store setObject:leftRow2BuckleBelted forKey:NAMES_leftRow2BuckleBelted];
    } else {
        [store removeObjectForKey:NAMES_leftRow2BuckleBelted];
    }
}

-(FMCVehicleDataEventStatus*) leftRow2BuckleBelted {
    NSObject* obj = [store objectForKey:NAMES_leftRow2BuckleBelted];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setPassengerChildDetected:(FMCVehicleDataEventStatus*) passengerChildDetected {
    if (passengerChildDetected != nil) {
        [store setObject:passengerChildDetected forKey:NAMES_passengerChildDetected];
    } else {
        [store removeObjectForKey:NAMES_passengerChildDetected];
    }
}

-(FMCVehicleDataEventStatus*) passengerChildDetected {
    NSObject* obj = [store objectForKey:NAMES_passengerChildDetected];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setRightRow2BuckleBelted:(FMCVehicleDataEventStatus*) rightRow2BuckleBelted {
    if (rightRow2BuckleBelted != nil) {
        [store setObject:rightRow2BuckleBelted forKey:NAMES_rightRow2BuckleBelted];
    } else {
        [store removeObjectForKey:NAMES_rightRow2BuckleBelted];
    }
}

-(FMCVehicleDataEventStatus*) rightRow2BuckleBelted {
    NSObject* obj = [store objectForKey:NAMES_rightRow2BuckleBelted];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setMiddleRow2BuckleBelted:(FMCVehicleDataEventStatus*) middleRow2BuckleBelted {
    if (middleRow2BuckleBelted != nil) {
        [store setObject:middleRow2BuckleBelted forKey:NAMES_middleRow2BuckleBelted];
    } else {
        [store removeObjectForKey:NAMES_middleRow2BuckleBelted];
    }
}

-(FMCVehicleDataEventStatus*) middleRow2BuckleBelted {
    NSObject* obj = [store objectForKey:NAMES_middleRow2BuckleBelted];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setMiddleRow3BuckleBelted:(FMCVehicleDataEventStatus*) middleRow3BuckleBelted {
    if (middleRow3BuckleBelted != nil) {
        [store setObject:middleRow3BuckleBelted forKey:NAMES_middleRow3BuckleBelted];
    } else {
        [store removeObjectForKey:NAMES_middleRow3BuckleBelted];
    }
}

-(FMCVehicleDataEventStatus*) middleRow3BuckleBelted {
    NSObject* obj = [store objectForKey:NAMES_middleRow3BuckleBelted];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setLeftRow3BuckleBelted:(FMCVehicleDataEventStatus*) leftRow3BuckleBelted {
    if (leftRow3BuckleBelted != nil) {
        [store setObject:leftRow3BuckleBelted forKey:NAMES_leftRow3BuckleBelted];
    } else {
        [store removeObjectForKey:NAMES_leftRow3BuckleBelted];
    }
}

-(FMCVehicleDataEventStatus*) leftRow3BuckleBelted {
    NSObject* obj = [store objectForKey:NAMES_leftRow3BuckleBelted];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setRightRow3BuckleBelted:(FMCVehicleDataEventStatus*) rightRow3BuckleBelted {
    if (rightRow3BuckleBelted != nil) {
        [store setObject:rightRow3BuckleBelted forKey:NAMES_rightRow3BuckleBelted];
    } else {
        [store removeObjectForKey:NAMES_rightRow3BuckleBelted];
    }
}

-(FMCVehicleDataEventStatus*) rightRow3BuckleBelted {
    NSObject* obj = [store objectForKey:NAMES_rightRow3BuckleBelted];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setLeftRearInflatableBelted:(FMCVehicleDataEventStatus*) leftRearInflatableBelted {
    if (leftRearInflatableBelted != nil) {
        [store setObject:leftRearInflatableBelted forKey:NAMES_leftRearInflatableBelted];
    } else {
        [store removeObjectForKey:NAMES_leftRearInflatableBelted];
    }
}

-(FMCVehicleDataEventStatus*) leftRearInflatableBelted {
    NSObject* obj = [store objectForKey:NAMES_leftRearInflatableBelted];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setRightRearInflatableBelted:(FMCVehicleDataEventStatus*) rightRearInflatableBelted {
    if (rightRearInflatableBelted != nil) {
        [store setObject:rightRearInflatableBelted forKey:NAMES_rightRearInflatableBelted];
    } else {
        [store removeObjectForKey:NAMES_rightRearInflatableBelted];
    }
}

-(FMCVehicleDataEventStatus*) rightRearInflatableBelted {
    NSObject* obj = [store objectForKey:NAMES_rightRearInflatableBelted];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setMiddleRow1BeltDeployed:(FMCVehicleDataEventStatus*) middleRow1BeltDeployed {
    if (middleRow1BeltDeployed != nil) {
        [store setObject:middleRow1BeltDeployed forKey:NAMES_middleRow1BeltDeployed];
    } else {
        [store removeObjectForKey:NAMES_middleRow1BeltDeployed];
    }
}

-(FMCVehicleDataEventStatus*) middleRow1BeltDeployed {
    NSObject* obj = [store objectForKey:NAMES_middleRow1BeltDeployed];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

-(void) setMiddleRow1BuckleBelted:(FMCVehicleDataEventStatus*) middleRow1BuckleBelted {
    if (middleRow1BuckleBelted != nil) {
        [store setObject:middleRow1BuckleBelted forKey:NAMES_middleRow1BuckleBelted];
    } else {
        [store removeObjectForKey:NAMES_middleRow1BuckleBelted];
    }
}

-(FMCVehicleDataEventStatus*) middleRow1BuckleBelted {
    NSObject* obj = [store objectForKey:NAMES_middleRow1BuckleBelted];
    if ([obj isKindOfClass:FMCVehicleDataEventStatus.class]) {
        return (FMCVehicleDataEventStatus*)obj;
    } else {
        return [FMCVehicleDataEventStatus valueOf:(NSString*)obj];
    }
}

@end
