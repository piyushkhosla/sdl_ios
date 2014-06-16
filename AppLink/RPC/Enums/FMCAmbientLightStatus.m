//  FMCAmbientLightStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCAmbientLightStatus.h>

FMCAmbientLightStatus* FMCAmbientLightStatus_NIGHT = nil;
FMCAmbientLightStatus* FMCAmbientLightStatus_TWILIGHT_1 = nil;
FMCAmbientLightStatus* FMCAmbientLightStatus_TWILIGHT_2 = nil;
FMCAmbientLightStatus* FMCAmbientLightStatus_TWILIGHT_3 = nil;
FMCAmbientLightStatus* FMCAmbientLightStatus_TWILIGHT_4 = nil;
FMCAmbientLightStatus* FMCAmbientLightStatus_DAY = nil;
FMCAmbientLightStatus* FMCAmbientLightStatus_UNKNOWN = nil;
FMCAmbientLightStatus* FMCAmbientLightStatus_INVALID = nil;

NSMutableArray* FMCAmbientLightStatus_values = nil;

@implementation FMCAmbientLightStatus

+(FMCAmbientLightStatus*) valueOf:(NSString*) value {
    for (FMCAmbientLightStatus* item in FMCAmbientLightStatus.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCAmbientLightStatus_values == nil) {
        FMCAmbientLightStatus_values = [[NSMutableArray alloc] initWithObjects:
                FMCAmbientLightStatus.NIGHT,
                FMCAmbientLightStatus.TWILIGHT_1,
                FMCAmbientLightStatus.TWILIGHT_2,
                FMCAmbientLightStatus.TWILIGHT_3,
                FMCAmbientLightStatus.TWILIGHT_4,
                FMCAmbientLightStatus.DAY,
                FMCAmbientLightStatus.UNKNOWN,
                FMCAmbientLightStatus.INVALID,
                nil];
    }
    return FMCAmbientLightStatus_values;
}

+(FMCAmbientLightStatus*) NIGHT {
    if (FMCAmbientLightStatus_NIGHT == nil) {
        FMCAmbientLightStatus_NIGHT = [[FMCAmbientLightStatus alloc] initWithValue:@"NIGHT"];
    }
    return FMCAmbientLightStatus_NIGHT;
}

+(FMCAmbientLightStatus*) TWILIGHT_1 {
    if (FMCAmbientLightStatus_TWILIGHT_1 == nil) {
        FMCAmbientLightStatus_TWILIGHT_1 = [[FMCAmbientLightStatus alloc] initWithValue:@"TWILIGHT_1"];
    }
    return FMCAmbientLightStatus_TWILIGHT_1;
}

+(FMCAmbientLightStatus*) TWILIGHT_2 {
    if (FMCAmbientLightStatus_TWILIGHT_2 == nil) {
        FMCAmbientLightStatus_TWILIGHT_2 = [[FMCAmbientLightStatus alloc] initWithValue:@"TWILIGHT_2"];
    }
    return FMCAmbientLightStatus_TWILIGHT_2;
}

+(FMCAmbientLightStatus*) TWILIGHT_3 {
    if (FMCAmbientLightStatus_TWILIGHT_3 == nil) {
        FMCAmbientLightStatus_TWILIGHT_3 = [[FMCAmbientLightStatus alloc] initWithValue:@"TWILIGHT_3"];
    }
    return FMCAmbientLightStatus_TWILIGHT_3;
}

+(FMCAmbientLightStatus*) TWILIGHT_4 {
    if (FMCAmbientLightStatus_TWILIGHT_4 == nil) {
        FMCAmbientLightStatus_TWILIGHT_4 = [[FMCAmbientLightStatus alloc] initWithValue:@"TWILIGHT_4"];
    }
    return FMCAmbientLightStatus_TWILIGHT_4;
}

+(FMCAmbientLightStatus*) DAY {
    if (FMCAmbientLightStatus_DAY == nil) {
        FMCAmbientLightStatus_DAY = [[FMCAmbientLightStatus alloc] initWithValue:@"DAY"];
    }
    return FMCAmbientLightStatus_DAY;
}

+(FMCAmbientLightStatus*) UNKNOWN {
    if (FMCAmbientLightStatus_UNKNOWN == nil) {
        FMCAmbientLightStatus_UNKNOWN = [[FMCAmbientLightStatus alloc] initWithValue:@"UNKNOWN"];
    }
    return FMCAmbientLightStatus_UNKNOWN;
}

+(FMCAmbientLightStatus*) INVALID {
    if (FMCAmbientLightStatus_INVALID == nil) {
        FMCAmbientLightStatus_INVALID = [[FMCAmbientLightStatus alloc] initWithValue:@"INVALID"];
    }
    return FMCAmbientLightStatus_INVALID;
}

@end
