//  FMCVehicleDataActiveStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCVehicleDataActiveStatus.h>

FMCVehicleDataActiveStatus* FMCVehicleDataActiveStatus_INACTIVE_NOT_CONFIRMED = nil;
FMCVehicleDataActiveStatus* FMCVehicleDataActiveStatus_INACTIVE_CONFIRMED = nil;
FMCVehicleDataActiveStatus* FMCVehicleDataActiveStatus_ACTIVE_NOT_CONFIRMED = nil;
FMCVehicleDataActiveStatus* FMCVehicleDataActiveStatus_ACTIVE_CONFIRMED = nil;
FMCVehicleDataActiveStatus* FMCVehicleDataActiveStatus_FAULT = nil;

NSMutableArray* FMCVehicleDataActiveStatus_values = nil;

@implementation FMCVehicleDataActiveStatus

+(FMCVehicleDataActiveStatus*) valueOf:(NSString*) value {
    for (FMCVehicleDataActiveStatus* item in FMCVehicleDataActiveStatus.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCVehicleDataActiveStatus_values == nil) {
        FMCVehicleDataActiveStatus_values = [[NSMutableArray alloc] initWithObjects:
                FMCVehicleDataActiveStatus.INACTIVE_NOT_CONFIRMED,
                FMCVehicleDataActiveStatus.INACTIVE_CONFIRMED,
                FMCVehicleDataActiveStatus.ACTIVE_NOT_CONFIRMED,
                FMCVehicleDataActiveStatus.ACTIVE_CONFIRMED,
                FMCVehicleDataActiveStatus.FAULT,
                nil];
    }
    return FMCVehicleDataActiveStatus_values;
}

+(FMCVehicleDataActiveStatus*) INACTIVE_NOT_CONFIRMED {
    if (FMCVehicleDataActiveStatus_INACTIVE_NOT_CONFIRMED == nil) {
        FMCVehicleDataActiveStatus_INACTIVE_NOT_CONFIRMED = [[FMCVehicleDataActiveStatus alloc] initWithValue:@"INACTIVE_NOT_CONFIRMED"];
    }
    return FMCVehicleDataActiveStatus_INACTIVE_NOT_CONFIRMED;
}

+(FMCVehicleDataActiveStatus*) INACTIVE_CONFIRMED {
    if (FMCVehicleDataActiveStatus_INACTIVE_CONFIRMED == nil) {
        FMCVehicleDataActiveStatus_INACTIVE_CONFIRMED = [[FMCVehicleDataActiveStatus alloc] initWithValue:@"INACTIVE_CONFIRMED"];
    }
    return FMCVehicleDataActiveStatus_INACTIVE_CONFIRMED;
}

+(FMCVehicleDataActiveStatus*) ACTIVE_NOT_CONFIRMED {
    if (FMCVehicleDataActiveStatus_ACTIVE_NOT_CONFIRMED == nil) {
        FMCVehicleDataActiveStatus_ACTIVE_NOT_CONFIRMED = [[FMCVehicleDataActiveStatus alloc] initWithValue:@"ACTIVE_NOT_CONFIRMED"];
    }
    return FMCVehicleDataActiveStatus_ACTIVE_NOT_CONFIRMED;
}

+(FMCVehicleDataActiveStatus*) ACTIVE_CONFIRMED {
    if (FMCVehicleDataActiveStatus_ACTIVE_CONFIRMED == nil) {
        FMCVehicleDataActiveStatus_ACTIVE_CONFIRMED = [[FMCVehicleDataActiveStatus alloc] initWithValue:@"ACTIVE_CONFIRMED"];
    }
    return FMCVehicleDataActiveStatus_ACTIVE_CONFIRMED;
}

+(FMCVehicleDataActiveStatus*) FAULT {
    if (FMCVehicleDataActiveStatus_FAULT == nil) {
        FMCVehicleDataActiveStatus_FAULT = [[FMCVehicleDataActiveStatus alloc] initWithValue:@"FAULT"];
    }
    return FMCVehicleDataActiveStatus_FAULT;
}

@end
