//  FMCTireStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCTireStatus.h>

#import <AppLink/FMCNames.h>

@implementation FMCTireStatus

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setPressureTelltale:(FMCWarningLightStatus*) pressureTelltale {
    if (pressureTelltale != nil) {
        [store setObject:pressureTelltale forKey:NAMES_pressureTelltale];
    } else {
        [store removeObjectForKey:NAMES_pressureTelltale];
    }
}

-(FMCWarningLightStatus*) pressureTelltale {
    NSObject* obj = [store objectForKey:NAMES_pressureTelltale];
    if ([obj isKindOfClass:FMCWarningLightStatus.class]) {
        return (FMCWarningLightStatus*)obj;
    } else {
        return [FMCWarningLightStatus valueOf:(NSString*)obj];
    }
}

-(void) setLeftFront:(FMCSingleTireStatus*) leftFront {
    if (leftFront != nil) {
        [store setObject:leftFront forKey:NAMES_leftFront];
    } else {
        [store removeObjectForKey:NAMES_leftFront];
    }
}

-(FMCSingleTireStatus*) leftFront {
    NSObject* obj = [store objectForKey:NAMES_leftFront];
    if ([obj isKindOfClass:FMCSingleTireStatus.class]) {
        return (FMCSingleTireStatus*)obj;
    } else {
        return [[FMCSingleTireStatus alloc] initWithDictionary:(NSMutableDictionary*)obj];
    }
}

-(void) setRightFront:(FMCSingleTireStatus*) rightFront {
    if (rightFront != nil) {
        [store setObject:rightFront forKey:NAMES_rightFront];
    } else {
        [store removeObjectForKey:NAMES_rightFront];
    }
}

-(FMCSingleTireStatus*) rightFront {
    NSObject* obj = [store objectForKey:NAMES_rightFront];
    if ([obj isKindOfClass:FMCSingleTireStatus.class]) {
        return (FMCSingleTireStatus*)obj;
    } else {
        return [[FMCSingleTireStatus alloc] initWithDictionary:(NSMutableDictionary*)obj];
    }
}

-(void) setLeftRear:(FMCSingleTireStatus*) leftRear {
    if (leftRear != nil) {
        [store setObject:leftRear forKey:NAMES_leftRear];
    } else {
        [store removeObjectForKey:NAMES_leftRear];
    }
}

-(FMCSingleTireStatus*) leftRear {
    NSObject* obj = [store objectForKey:NAMES_leftRear];
    if ([obj isKindOfClass:FMCSingleTireStatus.class]) {
        return (FMCSingleTireStatus*)obj;
    } else {
        return [[FMCSingleTireStatus alloc] initWithDictionary:(NSMutableDictionary*)obj];
    }
}

-(void) setRightRear:(FMCSingleTireStatus*) rightRear {
    if (rightRear != nil) {
        [store setObject:rightRear forKey:NAMES_rightRear];
    } else {
        [store removeObjectForKey:NAMES_rightRear];
    }
}

-(FMCSingleTireStatus*) rightRear {
    NSObject* obj = [store objectForKey:NAMES_rightRear];
    if ([obj isKindOfClass:FMCSingleTireStatus.class]) {
        return (FMCSingleTireStatus*)obj;
    } else {
        return [[FMCSingleTireStatus alloc] initWithDictionary:(NSMutableDictionary*)obj];
    }
}

-(void) setInnerLeftRear:(FMCSingleTireStatus*) innerLeftRear {
    if (innerLeftRear != nil) {
        [store setObject:innerLeftRear forKey:NAMES_innerLeftRear];
    } else {
        [store removeObjectForKey:NAMES_innerLeftRear];
    }
}

-(FMCSingleTireStatus*) innerLeftRear {
    NSObject* obj = [store objectForKey:NAMES_innerLeftRear];
    if ([obj isKindOfClass:FMCSingleTireStatus.class]) {
        return (FMCSingleTireStatus*)obj;
    } else {
        return [[FMCSingleTireStatus alloc] initWithDictionary:(NSMutableDictionary*)obj];
    }
}

-(void) setInnerRightRear:(FMCSingleTireStatus*) innerRightRear {
    if (innerRightRear != nil) {
        [store setObject:innerRightRear forKey:NAMES_innerRightRear];
    } else {
        [store removeObjectForKey:NAMES_innerRightRear];
    }
}

-(FMCSingleTireStatus*) innerRightRear {
    NSObject* obj = [store objectForKey:NAMES_innerRightRear];
    if ([obj isKindOfClass:FMCSingleTireStatus.class]) {
        return (FMCSingleTireStatus*)obj;
    } else {
        return [[FMCSingleTireStatus alloc] initWithDictionary:(NSMutableDictionary*)obj];
    }
}

@end
