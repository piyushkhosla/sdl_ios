//  FMCPowerModeStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCPowerModeStatus.h>

FMCPowerModeStatus* FMCPowerModeStatus_KEY_OUT = nil;
FMCPowerModeStatus* FMCPowerModeStatus_KEY_RECENTLY_OUT = nil;
FMCPowerModeStatus* FMCPowerModeStatus_KEY_APPROVED_0 = nil;
FMCPowerModeStatus* FMCPowerModeStatus_POST_ACCESORY_0 = nil;
FMCPowerModeStatus* FMCPowerModeStatus_ACCESORY_1 = nil;
FMCPowerModeStatus* FMCPowerModeStatus_POST_IGNITION_1 = nil;
FMCPowerModeStatus* FMCPowerModeStatus_IGNITION_ON_2 = nil;
FMCPowerModeStatus* FMCPowerModeStatus_RUNNING_2 = nil;
FMCPowerModeStatus* FMCPowerModeStatus_CRANK_3 = nil;

NSMutableArray* FMCPowerModeStatus_values = nil;

@implementation FMCPowerModeStatus

+(FMCPowerModeStatus*) valueOf:(NSString*) value {
    for (FMCPowerModeStatus* item in FMCPowerModeStatus.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCPowerModeStatus_values == nil) {
        FMCPowerModeStatus_values = [[NSMutableArray alloc] initWithObjects:
                FMCPowerModeStatus.KEY_OUT,
                FMCPowerModeStatus.KEY_RECENTLY_OUT,
                FMCPowerModeStatus.KEY_APPROVED_0,
                FMCPowerModeStatus.POST_ACCESORY_0,
                FMCPowerModeStatus.ACCESORY_1,
                FMCPowerModeStatus.POST_IGNITION_1,
                FMCPowerModeStatus.IGNITION_ON_2,
                FMCPowerModeStatus.RUNNING_2,
                FMCPowerModeStatus.CRANK_3,
                nil];
    }
    return FMCPowerModeStatus_values;
}

+(FMCPowerModeStatus*) KEY_OUT {
    if (FMCPowerModeStatus_KEY_OUT == nil) {
        FMCPowerModeStatus_KEY_OUT = [[FMCPowerModeStatus alloc] initWithValue:@"KEY_OUT"];
    }
    return FMCPowerModeStatus_KEY_OUT;
}

+(FMCPowerModeStatus*) KEY_RECENTLY_OUT {
    if (FMCPowerModeStatus_KEY_RECENTLY_OUT == nil) {
        FMCPowerModeStatus_KEY_RECENTLY_OUT = [[FMCPowerModeStatus alloc] initWithValue:@"KEY_RECENTLY_OUT"];
    }
    return FMCPowerModeStatus_KEY_RECENTLY_OUT;
}

+(FMCPowerModeStatus*) KEY_APPROVED_0 {
    if (FMCPowerModeStatus_KEY_APPROVED_0 == nil) {
        FMCPowerModeStatus_KEY_APPROVED_0 = [[FMCPowerModeStatus alloc] initWithValue:@"KEY_APPROVED_0"];
    }
    return FMCPowerModeStatus_KEY_APPROVED_0;
}

+(FMCPowerModeStatus*) POST_ACCESORY_0 {
    if (FMCPowerModeStatus_POST_ACCESORY_0 == nil) {
        FMCPowerModeStatus_POST_ACCESORY_0 = [[FMCPowerModeStatus alloc] initWithValue:@"POST_ACCESORY_0"];
    }
    return FMCPowerModeStatus_POST_ACCESORY_0;
}

+(FMCPowerModeStatus*) ACCESORY_1 {
    if (FMCPowerModeStatus_ACCESORY_1 == nil) {
        FMCPowerModeStatus_ACCESORY_1 = [[FMCPowerModeStatus alloc] initWithValue:@"ACCESORY_1"];
    }
    return FMCPowerModeStatus_ACCESORY_1;
}

+(FMCPowerModeStatus*) POST_IGNITION_1 {
    if (FMCPowerModeStatus_POST_IGNITION_1 == nil) {
        FMCPowerModeStatus_POST_IGNITION_1 = [[FMCPowerModeStatus alloc] initWithValue:@"POST_IGNITION_1"];
    }
    return FMCPowerModeStatus_POST_IGNITION_1;
}

+(FMCPowerModeStatus*) IGNITION_ON_2 {
    if (FMCPowerModeStatus_IGNITION_ON_2 == nil) {
        FMCPowerModeStatus_IGNITION_ON_2 = [[FMCPowerModeStatus alloc] initWithValue:@"IGNITION_ON_2"];
    }
    return FMCPowerModeStatus_IGNITION_ON_2;
}

+(FMCPowerModeStatus*) RUNNING_2 {
    if (FMCPowerModeStatus_RUNNING_2 == nil) {
        FMCPowerModeStatus_RUNNING_2 = [[FMCPowerModeStatus alloc] initWithValue:@"RUNNING_2"];
    }
    return FMCPowerModeStatus_RUNNING_2;
}

+(FMCPowerModeStatus*) CRANK_3 {
    if (FMCPowerModeStatus_CRANK_3 == nil) {
        FMCPowerModeStatus_CRANK_3 = [[FMCPowerModeStatus alloc] initWithValue:@"CRANK_3"];
    }
    return FMCPowerModeStatus_CRANK_3;
}

@end
