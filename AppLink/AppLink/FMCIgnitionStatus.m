//  FMCIgnitionStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCIgnitionStatus.h>

FMCIgnitionStatus* FMCIgnitionStatus_UNKNOWN = nil;
FMCIgnitionStatus* FMCIgnitionStatus_OFF = nil;
FMCIgnitionStatus* FMCIgnitionStatus_ACCESSORY = nil;
FMCIgnitionStatus* FMCIgnitionStatus_RUN = nil;
FMCIgnitionStatus* FMCIgnitionStatus_START = nil;
FMCIgnitionStatus* FMCIgnitionStatus_INVALID = nil;

NSMutableArray* FMCIgnitionStatus_values = nil;

@implementation FMCIgnitionStatus

+(FMCIgnitionStatus*) valueOf:(NSString*) value {
    for (FMCIgnitionStatus* item in FMCIgnitionStatus.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCIgnitionStatus_values == nil) {
        FMCIgnitionStatus_values = [[NSMutableArray alloc] initWithObjects:
                FMCIgnitionStatus.UNKNOWN,
                FMCIgnitionStatus.OFF,
                FMCIgnitionStatus.ACCESSORY,
                FMCIgnitionStatus.RUN,
                FMCIgnitionStatus.START,
                FMCIgnitionStatus.INVALID,
                nil];
    }
    return FMCIgnitionStatus_values;
}

+(FMCIgnitionStatus*) UNKNOWN {
    if (FMCIgnitionStatus_UNKNOWN == nil) {
        FMCIgnitionStatus_UNKNOWN = [[FMCIgnitionStatus alloc] initWithValue:@"UNKNOWN"];
    }
    return FMCIgnitionStatus_UNKNOWN;
}

+(FMCIgnitionStatus*) OFF {
    if (FMCIgnitionStatus_OFF == nil) {
        FMCIgnitionStatus_OFF = [[FMCIgnitionStatus alloc] initWithValue:@"OFF"];
    }
    return FMCIgnitionStatus_OFF;
}

+(FMCIgnitionStatus*) ACCESSORY {
    if (FMCIgnitionStatus_ACCESSORY == nil) {
        FMCIgnitionStatus_ACCESSORY = [[FMCIgnitionStatus alloc] initWithValue:@"ACCESSORY"];
    }
    return FMCIgnitionStatus_ACCESSORY;
}

+(FMCIgnitionStatus*) RUN {
    if (FMCIgnitionStatus_RUN == nil) {
        FMCIgnitionStatus_RUN = [[FMCIgnitionStatus alloc] initWithValue:@"RUN"];
    }
    return FMCIgnitionStatus_RUN;
}

+(FMCIgnitionStatus*) START {
    if (FMCIgnitionStatus_START == nil) {
        FMCIgnitionStatus_START = [[FMCIgnitionStatus alloc] initWithValue:@"START"];
    }
    return FMCIgnitionStatus_START;
}

+(FMCIgnitionStatus*) INVALID {
    if (FMCIgnitionStatus_INVALID == nil) {
        FMCIgnitionStatus_INVALID = [[FMCIgnitionStatus alloc] initWithValue:@"INVALID"];
    }
    return FMCIgnitionStatus_INVALID;
}

@end
