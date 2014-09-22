//  FMCFuelCutoffStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCFuelCutoffStatus.h>

FMCFuelCutoffStatus* FMCFuelCutoffStatus_TERMINATE_FUEL = nil;
FMCFuelCutoffStatus* FMCFuelCutoffStatus_NORMAL_OPERATION = nil;
FMCFuelCutoffStatus* FMCFuelCutoffStatus_FAULT = nil;

NSMutableArray* FMCFuelCutoffStatus_values = nil;

@implementation FMCFuelCutoffStatus

+(FMCFuelCutoffStatus*) valueOf:(NSString*) value {
    for (FMCFuelCutoffStatus* item in FMCFuelCutoffStatus.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCFuelCutoffStatus_values == nil) {
        FMCFuelCutoffStatus_values = [[NSMutableArray alloc] initWithObjects:
                FMCFuelCutoffStatus.TERMINATE_FUEL,
                FMCFuelCutoffStatus.NORMAL_OPERATION,
                FMCFuelCutoffStatus.FAULT,
                nil];
    }
    return FMCFuelCutoffStatus_values;
}

+(FMCFuelCutoffStatus*) TERMINATE_FUEL {
    if (FMCFuelCutoffStatus_TERMINATE_FUEL == nil) {
        FMCFuelCutoffStatus_TERMINATE_FUEL = [[FMCFuelCutoffStatus alloc] initWithValue:@"TERMINATE_FUEL"];
    }
    return FMCFuelCutoffStatus_TERMINATE_FUEL;
}

+(FMCFuelCutoffStatus*) NORMAL_OPERATION {
    if (FMCFuelCutoffStatus_NORMAL_OPERATION == nil) {
        FMCFuelCutoffStatus_NORMAL_OPERATION = [[FMCFuelCutoffStatus alloc] initWithValue:@"NORMAL_OPERATION"];
    }
    return FMCFuelCutoffStatus_NORMAL_OPERATION;
}

+(FMCFuelCutoffStatus*) FAULT {
    if (FMCFuelCutoffStatus_FAULT == nil) {
        FMCFuelCutoffStatus_FAULT = [[FMCFuelCutoffStatus alloc] initWithValue:@"FAULT"];
    }
    return FMCFuelCutoffStatus_FAULT;
}

@end
