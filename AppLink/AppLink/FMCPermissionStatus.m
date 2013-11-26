//  FMCPermissionStatus.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCPermissionStatus.h>

FMCPermissionStatus* FMCPermissionStatus_ALLOWED = nil;
FMCPermissionStatus* FMCPermissionStatus_DISALLOWED = nil;
FMCPermissionStatus* FMCPermissionStatus_USER_DISALLOWED = nil;
FMCPermissionStatus* FMCPermissionStatus_USER_CONSENT_PENDING = nil;

NSMutableArray* FMCPermissionStatus_values = nil;

@implementation FMCPermissionStatus

+(FMCPermissionStatus*)valueOf:(NSString *)value {
    for (FMCPermissionStatus *item in FMCPermissionStatus.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*)values {
    if (FMCPermissionStatus_values == nil) {
        FMCPermissionStatus_values = [[NSMutableArray alloc] initWithObjects: 
                                     FMCPermissionStatus.ALLOWED,
                                     FMCPermissionStatus.DISALLOWED,
                                     FMCPermissionStatus.USER_DISALLOWED,
                                     FMCPermissionStatus.USER_CONSENT_PENDING,
                                     nil];
    }
    return FMCPermissionStatus_values;
}

+(FMCPermissionStatus*)ALLOWED {
    if (FMCPermissionStatus_ALLOWED == nil) {
        FMCPermissionStatus_ALLOWED = [[FMCPermissionStatus alloc] initWithValue:@"ALLOWED"];
    }
    return FMCPermissionStatus_ALLOWED;
}

+(FMCPermissionStatus*)DISALLOWED {
    if (FMCPermissionStatus_DISALLOWED == nil) {
        FMCPermissionStatus_DISALLOWED = [[FMCPermissionStatus alloc] initWithValue:@"DISALLOWED"];
    }
    return FMCPermissionStatus_DISALLOWED;
}

+(FMCPermissionStatus*)USER_DISALLOWED {
    if (FMCPermissionStatus_USER_DISALLOWED == nil) {
        FMCPermissionStatus_USER_DISALLOWED = [[FMCPermissionStatus alloc] initWithValue:@"USER_DISALLOWED"];
    }
    return FMCPermissionStatus_USER_DISALLOWED;
}

+(FMCPermissionStatus*)USER_CONSENT_PENDING {
    if (FMCPermissionStatus_USER_CONSENT_PENDING == nil) {
        FMCPermissionStatus_USER_CONSENT_PENDING = [[FMCPermissionStatus alloc] initWithValue:@"USER_CONSENT_PENDING"];
    }
    return FMCPermissionStatus_USER_CONSENT_PENDING;
}

@end