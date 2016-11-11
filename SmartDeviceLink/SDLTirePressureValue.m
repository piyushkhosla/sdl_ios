//
//  SDLTirePressureValue.m
//  SmartDeviceLink-iOS
//
//  Created by CHDSEZ318988DADM on 07/07/16.
//  Copyright © 2016 smartdevicelink. All rights reserved.
//

#import "SDLTirePressureValue.h"
#import "SDLNames.h"

@implementation SDLTirePressureValue

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setLeftFront:(NSNumber *)leftFront {
    if (leftFront != nil) {
        [store setObject:leftFront forKey:NAMES_leftFront];
    } else {
        [store removeObjectForKey:NAMES_leftFront];
    }
}

- (NSNumber *)leftFront {
    return [store objectForKey:NAMES_leftFront];
}

- (void)setRightFront:(NSNumber *)rightFront {
    if (rightFront != nil) {
        [store setObject:rightFront forKey:NAMES_rightFront];
    } else {
        [store removeObjectForKey:NAMES_rightFront];
    }
}

- (NSNumber *)rightFront {
    return [store objectForKey:NAMES_rightFront];
}

- (void)setLeftRear:(NSNumber *)leftRear {
    if (leftRear != nil) {
        [store setObject:leftRear forKey:NAMES_leftRear];
    } else {
        [store removeObjectForKey:NAMES_leftRear];
    }
}

- (NSNumber *)leftRear {
    return [store objectForKey:NAMES_leftRear];
}

- (void)setInnerLeftRear:(NSNumber *)innerLeftRear {
    if (innerLeftRear != nil) {
        [store setObject:innerLeftRear forKey:NAMES_innerLeftRear];
    } else {
        [store removeObjectForKey:NAMES_innerLeftRear];
    }
}

- (NSNumber *)innerLeftRear {
    return [store objectForKey:NAMES_innerLeftRear];
}

- (void)setInnerRightRear:(NSNumber *)innerRightRear {
    if (innerRightRear != nil) {
        [store setObject:innerRightRear forKey:NAMES_innerRightRear];
    } else {
        [store removeObjectForKey:NAMES_innerRightRear];
    }
}

- (NSNumber *)innerRightRear {
    return [store objectForKey:NAMES_innerRightRear];
}

- (void)setFrontRecommended:(NSNumber *)frontRecommended {
    if (frontRecommended != nil) {
        [store setObject:frontRecommended forKey:NAMES_frontRecommended];
    } else {
        [store removeObjectForKey:NAMES_frontRecommended];
    }
}

- (NSNumber *)frontRecommended {
    return [store objectForKey:NAMES_frontRecommended];
}

- (void)setRearRecommended:(NSNumber *)rearRecommended {
    if (rearRecommended != nil) {
        [store setObject:rearRecommended forKey:NAMES_rearRecommended];
    } else {
        [store removeObjectForKey:NAMES_rearRecommended];
    }
}

- (NSNumber *)rearRecommended {
    return [store objectForKey:NAMES_rearRecommended];
}

@end