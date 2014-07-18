//  FMCHMILevel.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCHMILevel.h>

FMCHMILevel* FMCHMILevel_HMI_FULL = nil;
FMCHMILevel* FMCHMILevel_HMI_LIMITED = nil;
FMCHMILevel* FMCHMILevel_HMI_BACKGROUND = nil;
FMCHMILevel* FMCHMILevel_HMI_NONE = nil;

NSMutableArray* FMCHMILevel_values = nil;

@implementation FMCHMILevel

+(FMCHMILevel*) valueOf:(NSString*) value {
    for (FMCHMILevel* item in FMCHMILevel.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCHMILevel_values == nil) {
        FMCHMILevel_values = [[NSMutableArray alloc] initWithObjects:
                FMCHMILevel.HMI_FULL,
                FMCHMILevel.HMI_LIMITED,
                FMCHMILevel.HMI_BACKGROUND,
                FMCHMILevel.HMI_NONE,
                nil];
    }
    return FMCHMILevel_values;
}

+(FMCHMILevel*) HMI_FULL {
    if (FMCHMILevel_HMI_FULL == nil) {
        FMCHMILevel_HMI_FULL = [[FMCHMILevel alloc] initWithValue:@"FULL"];
    }
    return FMCHMILevel_HMI_FULL;
}

+(FMCHMILevel*) HMI_LIMITED {
    if (FMCHMILevel_HMI_LIMITED == nil) {
        FMCHMILevel_HMI_LIMITED = [[FMCHMILevel alloc] initWithValue:@"LIMITED"];
    }
    return FMCHMILevel_HMI_LIMITED;
}

+(FMCHMILevel*) HMI_BACKGROUND {
    if (FMCHMILevel_HMI_BACKGROUND == nil) {
        FMCHMILevel_HMI_BACKGROUND = [[FMCHMILevel alloc] initWithValue:@"BACKGROUND"];
    }
    return FMCHMILevel_HMI_BACKGROUND;
}

+(FMCHMILevel*) HMI_NONE {
    if (FMCHMILevel_HMI_NONE == nil) {
        FMCHMILevel_HMI_NONE = [[FMCHMILevel alloc] initWithValue:@"NONE"];
    }
    return FMCHMILevel_HMI_NONE;
}

@end
