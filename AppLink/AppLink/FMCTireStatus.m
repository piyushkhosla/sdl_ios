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

-(void) setPressureTelltale:(FMCWarningLightStatus *) pressureTelltale {
    if (pressureTelltale != nil) {
        [store setObject:pressureTelltale forKey:NAMES_pressureTelltale];
    } else {
        [store removeObjectForKey:NAMES_pressureTelltale];
    }
}

-(FMCWarningLightStatus*) pressureTelltale {
    return [store objectForKey:NAMES_pressureTelltale];
}

-(void) setLeftFront:(FMCSingleTireStatus*) leftFront {
    if (leftFront != nil) {
        [store setObject:leftFront forKey:NAMES_leftFront];
    } else {
        [store removeObjectForKey:NAMES_leftFront];
    }
}

-(FMCWarningLightStatus*) leftFront {
    return [store objectForKey:NAMES_leftFront];
}

-(void) setRightFront:(FMCSingleTireStatus*) rightFront {
    if (rightFront != nil) {
        [store setObject:rightFront forKey:NAMES_rightFront];
    } else {
        [store removeObjectForKey:NAMES_rightFront];
    }
}

-(FMCWarningLightStatus*) rightFront {
    return [store objectForKey:NAMES_rightFront];
}

-(void) setLeftRear:(FMCSingleTireStatus*) leftRear {
    if (leftRear != nil) {
        [store setObject:leftRear forKey:NAMES_leftRear];
    } else {
        [store removeObjectForKey:NAMES_leftRear];
    }
}

-(FMCWarningLightStatus*) leftRear {
    return [store objectForKey:NAMES_leftRear];
}

-(void) setRightRear:(FMCSingleTireStatus*) rightRear {
    if (rightRear != nil) {
        [store setObject:rightRear forKey:NAMES_rightRear];
    } else {
        [store removeObjectForKey:NAMES_rightRear];
    }
}

-(FMCWarningLightStatus*) rightRear {
    return [store objectForKey:NAMES_rightRear];
}

-(void) setInnerLeftRear:(FMCSingleTireStatus *) innerLeftRear {
    if (innerLeftRear != nil) {
        [store setObject:innerLeftRear forKey:NAMES_innerLeftRear];
    } else {
        [store removeObjectForKey:NAMES_innerLeftRear];
    }
}

-(FMCWarningLightStatus*) innerLeftRear {
    return [store objectForKey:NAMES_innerLeftRear];
}

-(void) setInnerRightRear:(FMCSingleTireStatus*) innerRightRear {
    if (innerRightRear != nil) {
        [store setObject:innerRightRear forKey:NAMES_innerRightRear];
    } else {
        [store removeObjectForKey:NAMES_innerRightRear];
    }
}

-(FMCWarningLightStatus*) innerRightRear {
    return [store objectForKey:NAMES_innerRightRear];
}

@end
