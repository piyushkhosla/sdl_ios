//  FMCPowerModeQualificationStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCPowerModeQualificationStatus.h>

FMCPowerModeQualificationStatus* FMCPowerModeQualificationStatus_POWER_MODE_UNDEFINED = nil;
FMCPowerModeQualificationStatus* FMCPowerModeQualificationStatus_POWER_MODE_EVALUATION_IN_PROGRESS = nil;
FMCPowerModeQualificationStatus* FMCPowerModeQualificationStatus_NOT_DEFINED = nil;
FMCPowerModeQualificationStatus* FMCPowerModeQualificationStatus_POWER_MODE_OK = nil;

NSMutableArray* FMCPowerModeQualificationStatus_values = nil;

@implementation FMCPowerModeQualificationStatus

+(FMCPowerModeQualificationStatus*) valueOf:(NSString*) value {
    for (FMCPowerModeQualificationStatus* item in FMCPowerModeQualificationStatus.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCPowerModeQualificationStatus_values == nil) {
        FMCPowerModeQualificationStatus_values = [[NSMutableArray alloc] initWithObjects:
                FMCPowerModeQualificationStatus.POWER_MODE_UNDEFINED,
                FMCPowerModeQualificationStatus.POWER_MODE_EVALUATION_IN_PROGRESS,
                FMCPowerModeQualificationStatus.NOT_DEFINED,
                FMCPowerModeQualificationStatus.POWER_MODE_OK,
                nil];
    }
    return FMCPowerModeQualificationStatus_values;
}

+(FMCPowerModeQualificationStatus*) POWER_MODE_UNDEFINED {
    if (FMCPowerModeQualificationStatus_POWER_MODE_UNDEFINED == nil) {
        FMCPowerModeQualificationStatus_POWER_MODE_UNDEFINED = [[FMCPowerModeQualificationStatus alloc] initWithValue:@"POWER_MODE_UNDEFINED"];
    }
    return FMCPowerModeQualificationStatus_POWER_MODE_UNDEFINED;
}

+(FMCPowerModeQualificationStatus*) POWER_MODE_EVALUATION_IN_PROGRESS {
    if (FMCPowerModeQualificationStatus_POWER_MODE_EVALUATION_IN_PROGRESS == nil) {
        FMCPowerModeQualificationStatus_POWER_MODE_EVALUATION_IN_PROGRESS = [[FMCPowerModeQualificationStatus alloc] initWithValue:@"POWER_MODE_EVALUATION_IN_PROGRESS"];
    }
    return FMCPowerModeQualificationStatus_POWER_MODE_EVALUATION_IN_PROGRESS;
}

+(FMCPowerModeQualificationStatus*) NOT_DEFINED {
    if (FMCPowerModeQualificationStatus_NOT_DEFINED == nil) {
        FMCPowerModeQualificationStatus_NOT_DEFINED = [[FMCPowerModeQualificationStatus alloc] initWithValue:@"NOT_DEFINED"];
    }
    return FMCPowerModeQualificationStatus_NOT_DEFINED;
}

+(FMCPowerModeQualificationStatus*) POWER_MODE_OK {
    if (FMCPowerModeQualificationStatus_POWER_MODE_OK == nil) {
        FMCPowerModeQualificationStatus_POWER_MODE_OK = [[FMCPowerModeQualificationStatus alloc] initWithValue:@"POWER_MODE_OK"];
    }
    return FMCPowerModeQualificationStatus_POWER_MODE_OK;
}

@end
