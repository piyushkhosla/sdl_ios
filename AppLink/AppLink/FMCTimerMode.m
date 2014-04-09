//  FMCTimerMode.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCTimerMode.h>

FMCTimerMode* FMCTimerMode_UP = nil;
FMCTimerMode* FMCTimerMode_DOWN = nil;
FMCTimerMode* FMCTimerMode_NONE = nil;

NSMutableArray* FMCTimerMode_values = nil;

@implementation FMCTimerMode

+(FMCTimerMode*) valueOf:(NSString*) value {
    for (FMCTimerMode* item in FMCTimerMode.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCTimerMode_values == nil) {
        FMCTimerMode_values = [[NSMutableArray alloc] initWithObjects:
                FMCTimerMode.UP,
                FMCTimerMode.DOWN,
                FMCTimerMode.NONE,
                nil];
    }
    return FMCTimerMode_values;
}

+(FMCTimerMode*) UP {
    if (FMCTimerMode_UP == nil) {
        FMCTimerMode_UP = [[FMCTimerMode alloc] initWithValue:@"UP"];
    }
    return FMCTimerMode_UP;
}

+(FMCTimerMode*) DOWN {
    if (FMCTimerMode_DOWN == nil) {
        FMCTimerMode_DOWN = [[FMCTimerMode alloc] initWithValue:@"DOWN"];
    }
    return FMCTimerMode_DOWN;
}

+(FMCTimerMode*) NONE {
    if (FMCTimerMode_NONE == nil) {
        FMCTimerMode_NONE = [[FMCTimerMode alloc] initWithValue:@"NONE"];
    }
    return FMCTimerMode_NONE;
}

@end
