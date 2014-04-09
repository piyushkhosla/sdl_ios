//  FMCSystemContext.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSystemContext.h>

FMCSystemContext* FMCSystemContext_MAIN = nil;
FMCSystemContext* FMCSystemContext_VRSESSION = nil;
FMCSystemContext* FMCSystemContext_MENU = nil;
FMCSystemContext* FMCSystemContext_HMI_OBSCURED = nil;
FMCSystemContext* FMCSystemContext_ALERT = nil;

NSMutableArray* FMCSystemContext_values = nil;

@implementation FMCSystemContext

+(FMCSystemContext*) valueOf:(NSString*) value {
    for (FMCSystemContext* item in FMCSystemContext.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCSystemContext_values == nil) {
        FMCSystemContext_values = [[NSMutableArray alloc] initWithObjects:
                FMCSystemContext.MAIN,
                FMCSystemContext.VRSESSION,
                FMCSystemContext.MENU,
                FMCSystemContext.HMI_OBSCURED,
                FMCSystemContext.ALERT,
                nil];
    }
    return FMCSystemContext_values;
}

+(FMCSystemContext*) MAIN {
    if (FMCSystemContext_MAIN == nil) {
        FMCSystemContext_MAIN = [[FMCSystemContext alloc] initWithValue:@"MAIN"];
    }
    return FMCSystemContext_MAIN;
}

+(FMCSystemContext*) VRSESSION {
    if (FMCSystemContext_VRSESSION == nil) {
        FMCSystemContext_VRSESSION = [[FMCSystemContext alloc] initWithValue:@"VRSESSION"];
    }
    return FMCSystemContext_VRSESSION;
}

+(FMCSystemContext*) MENU {
    if (FMCSystemContext_MENU == nil) {
        FMCSystemContext_MENU = [[FMCSystemContext alloc] initWithValue:@"MENU"];
    }
    return FMCSystemContext_MENU;
}

+(FMCSystemContext*) HMI_OBSCURED {
    if (FMCSystemContext_HMI_OBSCURED == nil) {
        FMCSystemContext_HMI_OBSCURED = [[FMCSystemContext alloc] initWithValue:@"HMI_OBSCURED"];
    }
    return FMCSystemContext_HMI_OBSCURED;
}

+(FMCSystemContext*) ALERT {
    if (FMCSystemContext_ALERT == nil) {
        FMCSystemContext_ALERT = [[FMCSystemContext alloc] initWithValue:@"ALERT"];
    }
    return FMCSystemContext_ALERT;
}

@end
