//  FMCComponentVolumeStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCComponentVolumeStatus.h>

FMCComponentVolumeStatus* FMCComponentVolumeStatus_UNKNOWN = nil;
FMCComponentVolumeStatus* FMCComponentVolumeStatus_NORMAL = nil;
FMCComponentVolumeStatus* FMCComponentVolumeStatus_LOW = nil;
FMCComponentVolumeStatus* FMCComponentVolumeStatus_FAULT = nil;
FMCComponentVolumeStatus* FMCComponentVolumeStatus_ALERT = nil;
FMCComponentVolumeStatus* FMCComponentVolumeStatus_NOT_SUPPORTED = nil;

NSMutableArray* FMCComponentVolumeStatus_values = nil;

@implementation FMCComponentVolumeStatus

+(FMCComponentVolumeStatus*) valueOf:(NSString*) value {
    for (FMCComponentVolumeStatus* item in FMCComponentVolumeStatus.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCComponentVolumeStatus_values == nil) {
        FMCComponentVolumeStatus_values = [[NSMutableArray alloc] initWithObjects:
                FMCComponentVolumeStatus.UNKNOWN,
                FMCComponentVolumeStatus.NORMAL,
                FMCComponentVolumeStatus.LOW,
                FMCComponentVolumeStatus.FAULT,
                FMCComponentVolumeStatus.ALERT,
                FMCComponentVolumeStatus.NOT_SUPPORTED,
                nil];
    }
    return FMCComponentVolumeStatus_values;
}

+(FMCComponentVolumeStatus*) UNKNOWN {
    if (FMCComponentVolumeStatus_UNKNOWN == nil) {
        FMCComponentVolumeStatus_UNKNOWN = [[FMCComponentVolumeStatus alloc] initWithValue:@"UNKNOWN"];
    }
    return FMCComponentVolumeStatus_UNKNOWN;
}

+(FMCComponentVolumeStatus*) NORMAL {
    if (FMCComponentVolumeStatus_NORMAL == nil) {
        FMCComponentVolumeStatus_NORMAL = [[FMCComponentVolumeStatus alloc] initWithValue:@"NORMAL"];
    }
    return FMCComponentVolumeStatus_NORMAL;
}

+(FMCComponentVolumeStatus*) LOW {
    if (FMCComponentVolumeStatus_LOW == nil) {
        FMCComponentVolumeStatus_LOW = [[FMCComponentVolumeStatus alloc] initWithValue:@"LOW"];
    }
    return FMCComponentVolumeStatus_LOW;
}

+(FMCComponentVolumeStatus*) FAULT {
    if (FMCComponentVolumeStatus_FAULT == nil) {
        FMCComponentVolumeStatus_FAULT = [[FMCComponentVolumeStatus alloc] initWithValue:@"FAULT"];
    }
    return FMCComponentVolumeStatus_FAULT;
}

+(FMCComponentVolumeStatus*) ALERT {
    if (FMCComponentVolumeStatus_ALERT == nil) {
        FMCComponentVolumeStatus_ALERT = [[FMCComponentVolumeStatus alloc] initWithValue:@"ALERT"];
    }
    return FMCComponentVolumeStatus_ALERT;
}

+(FMCComponentVolumeStatus*) NOT_SUPPORTED {
    if (FMCComponentVolumeStatus_NOT_SUPPORTED == nil) {
        FMCComponentVolumeStatus_NOT_SUPPORTED = [[FMCComponentVolumeStatus alloc] initWithValue:@"NOT_SUPPORTED"];
    }
    return FMCComponentVolumeStatus_NOT_SUPPORTED;
}

@end
