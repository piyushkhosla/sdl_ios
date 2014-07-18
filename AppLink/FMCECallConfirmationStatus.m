//  FMCECallConfirmationStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCECallConfirmationStatus.h>

FMCECallConfirmationStatus* FMCECallConfirmationStatus_NORMAL = nil;
FMCECallConfirmationStatus* FMCECallConfirmationStatus_CALL_IN_PROGRESS = nil;
FMCECallConfirmationStatus* FMCECallConfirmationStatus_CALL_CANCELLED = nil;
FMCECallConfirmationStatus* FMCECallConfirmationStatus_CALL_COMPLETED = nil;
FMCECallConfirmationStatus* FMCECallConfirmationStatus_CALL_UNSUCCESSFUL = nil;
FMCECallConfirmationStatus* FMCECallConfirmationStatus_ECALL_CONFIGURED_OFF = nil;
FMCECallConfirmationStatus* FMCECallConfirmationStatus_CALL_COMPLETE_DTMF_TIMEOUT = nil;

NSMutableArray* FMCECallConfirmationStatus_values = nil;

@implementation FMCECallConfirmationStatus

+(FMCECallConfirmationStatus*) valueOf:(NSString*) value {
    for (FMCECallConfirmationStatus* item in FMCECallConfirmationStatus.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCECallConfirmationStatus_values == nil) {
        FMCECallConfirmationStatus_values = [[NSMutableArray alloc] initWithObjects:
                FMCECallConfirmationStatus.NORMAL,
                FMCECallConfirmationStatus.CALL_IN_PROGRESS,
                FMCECallConfirmationStatus.CALL_CANCELLED,
                FMCECallConfirmationStatus.CALL_COMPLETED,
                FMCECallConfirmationStatus.CALL_UNSUCCESSFUL,
                FMCECallConfirmationStatus.ECALL_CONFIGURED_OFF,
                FMCECallConfirmationStatus.CALL_COMPLETE_DTMF_TIMEOUT,
                nil];
    }
    return FMCECallConfirmationStatus_values;
}

+(FMCECallConfirmationStatus*) NORMAL {
    if (FMCECallConfirmationStatus_NORMAL == nil) {
        FMCECallConfirmationStatus_NORMAL = [[FMCECallConfirmationStatus alloc] initWithValue:@"NORMAL"];
    }
    return FMCECallConfirmationStatus_NORMAL;
}

+(FMCECallConfirmationStatus*) CALL_IN_PROGRESS {
    if (FMCECallConfirmationStatus_CALL_IN_PROGRESS == nil) {
        FMCECallConfirmationStatus_CALL_IN_PROGRESS = [[FMCECallConfirmationStatus alloc] initWithValue:@"CALL_IN_PROGRESS"];
    }
    return FMCECallConfirmationStatus_CALL_IN_PROGRESS;
}

+(FMCECallConfirmationStatus*) CALL_CANCELLED {
    if (FMCECallConfirmationStatus_CALL_CANCELLED == nil) {
        FMCECallConfirmationStatus_CALL_CANCELLED = [[FMCECallConfirmationStatus alloc] initWithValue:@"CALL_CANCELLED"];
    }
    return FMCECallConfirmationStatus_CALL_CANCELLED;
}

+(FMCECallConfirmationStatus*) CALL_COMPLETED {
    if (FMCECallConfirmationStatus_CALL_COMPLETED == nil) {
        FMCECallConfirmationStatus_CALL_COMPLETED = [[FMCECallConfirmationStatus alloc] initWithValue:@"CALL_COMPLETED"];
    }
    return FMCECallConfirmationStatus_CALL_COMPLETED;
}

+(FMCECallConfirmationStatus*) CALL_UNSUCCESSFUL {
    if (FMCECallConfirmationStatus_CALL_UNSUCCESSFUL == nil) {
        FMCECallConfirmationStatus_CALL_UNSUCCESSFUL = [[FMCECallConfirmationStatus alloc] initWithValue:@"CALL_UNSUCCESSFUL"];
    }
    return FMCECallConfirmationStatus_CALL_UNSUCCESSFUL;
}

+(FMCECallConfirmationStatus*) ECALL_CONFIGURED_OFF {
    if (FMCECallConfirmationStatus_ECALL_CONFIGURED_OFF == nil) {
        FMCECallConfirmationStatus_ECALL_CONFIGURED_OFF = [[FMCECallConfirmationStatus alloc] initWithValue:@"ECALL_CONFIGURED_OFF"];
    }
    return FMCECallConfirmationStatus_ECALL_CONFIGURED_OFF;
}

+(FMCECallConfirmationStatus*) CALL_COMPLETE_DTMF_TIMEOUT {
    if (FMCECallConfirmationStatus_CALL_COMPLETE_DTMF_TIMEOUT == nil) {
        FMCECallConfirmationStatus_CALL_COMPLETE_DTMF_TIMEOUT = [[FMCECallConfirmationStatus alloc] initWithValue:@"CALL_COMPLETE_DTMF_TIMEOUT"];
    }
    return FMCECallConfirmationStatus_CALL_COMPLETE_DTMF_TIMEOUT;
}

@end
