//  FMCDeviceLevelStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCDeviceLevelStatus.h>

FMCDeviceLevelStatus* FMCDeviceLevelStatus_ZERO_LEVEL_BARS = nil;
FMCDeviceLevelStatus* FMCDeviceLevelStatus_ONE_LEVEL_BARS = nil;
FMCDeviceLevelStatus* FMCDeviceLevelStatus_TWO_LEVEL_BARS = nil;
FMCDeviceLevelStatus* FMCDeviceLevelStatus_THREE_LEVEL_BARS = nil;
FMCDeviceLevelStatus* FMCDeviceLevelStatus_FOUR_LEVEL_BARS = nil;
FMCDeviceLevelStatus* FMCDeviceLevelStatus_NOT_PROVIDED = nil;

NSMutableArray* FMCDeviceLevelStatus_values = nil;

@implementation FMCDeviceLevelStatus

+(FMCDeviceLevelStatus*) valueOf:(NSString*) value {
    for (FMCDeviceLevelStatus* item in FMCDeviceLevelStatus.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCDeviceLevelStatus_values == nil) {
        FMCDeviceLevelStatus_values = [[NSMutableArray alloc] initWithObjects:
                FMCDeviceLevelStatus.ZERO_LEVEL_BARS,
                FMCDeviceLevelStatus.ONE_LEVEL_BARS,
                FMCDeviceLevelStatus.TWO_LEVEL_BARS,
                FMCDeviceLevelStatus.THREE_LEVEL_BARS,
                FMCDeviceLevelStatus.FOUR_LEVEL_BARS,
                FMCDeviceLevelStatus.NOT_PROVIDED,
                nil];
    }
    return FMCDeviceLevelStatus_values;
}

+(FMCDeviceLevelStatus*) ZERO_LEVEL_BARS {
    if (FMCDeviceLevelStatus_ZERO_LEVEL_BARS == nil) {
        FMCDeviceLevelStatus_ZERO_LEVEL_BARS = [[FMCDeviceLevelStatus alloc] initWithValue:@"ZERO_LEVEL_BARS"];
    }
    return FMCDeviceLevelStatus_ZERO_LEVEL_BARS;
}

+(FMCDeviceLevelStatus*) ONE_LEVEL_BARS {
    if (FMCDeviceLevelStatus_ONE_LEVEL_BARS == nil) {
        FMCDeviceLevelStatus_ONE_LEVEL_BARS = [[FMCDeviceLevelStatus alloc] initWithValue:@"ONE_LEVEL_BARS"];
    }
    return FMCDeviceLevelStatus_ONE_LEVEL_BARS;
}

+(FMCDeviceLevelStatus*) TWO_LEVEL_BARS {
    if (FMCDeviceLevelStatus_TWO_LEVEL_BARS == nil) {
        FMCDeviceLevelStatus_TWO_LEVEL_BARS = [[FMCDeviceLevelStatus alloc] initWithValue:@"TWO_LEVEL_BARS"];
    }
    return FMCDeviceLevelStatus_TWO_LEVEL_BARS;
}

+(FMCDeviceLevelStatus*) THREE_LEVEL_BARS {
    if (FMCDeviceLevelStatus_THREE_LEVEL_BARS == nil) {
        FMCDeviceLevelStatus_THREE_LEVEL_BARS = [[FMCDeviceLevelStatus alloc] initWithValue:@"THREE_LEVEL_BARS"];
    }
    return FMCDeviceLevelStatus_THREE_LEVEL_BARS;
}

+(FMCDeviceLevelStatus*) FOUR_LEVEL_BARS {
    if (FMCDeviceLevelStatus_FOUR_LEVEL_BARS == nil) {
        FMCDeviceLevelStatus_FOUR_LEVEL_BARS = [[FMCDeviceLevelStatus alloc] initWithValue:@"FOUR_LEVEL_BARS"];
    }
    return FMCDeviceLevelStatus_FOUR_LEVEL_BARS;
}

+(FMCDeviceLevelStatus*) NOT_PROVIDED {
    if (FMCDeviceLevelStatus_NOT_PROVIDED == nil) {
        FMCDeviceLevelStatus_NOT_PROVIDED = [[FMCDeviceLevelStatus alloc] initWithValue:@"NOT_PROVIDED"];
    }
    return FMCDeviceLevelStatus_NOT_PROVIDED;
}

@end
