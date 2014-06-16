//  FMCDriverDistractionState.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCDriverDistractionState.h>

FMCDriverDistractionState* FMCDriverDistractionState_DD_ON = nil;
FMCDriverDistractionState* FMCDriverDistractionState_DD_OFF = nil;

NSMutableArray* FMCDriverDistractionState_values = nil;

@implementation FMCDriverDistractionState

+(FMCDriverDistractionState*) valueOf:(NSString*) value {
    for (FMCDriverDistractionState* item in FMCDriverDistractionState.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCDriverDistractionState_values == nil) {
        FMCDriverDistractionState_values = [[NSMutableArray alloc] initWithObjects:
                FMCDriverDistractionState.DD_ON,
                FMCDriverDistractionState.DD_OFF,
                nil];
    }
    return FMCDriverDistractionState_values;
}

+(FMCDriverDistractionState*) DD_ON {
    if (FMCDriverDistractionState_DD_ON == nil) {
        FMCDriverDistractionState_DD_ON = [[FMCDriverDistractionState alloc] initWithValue:@"DD_ON"];
    }
    return FMCDriverDistractionState_DD_ON;
}

+(FMCDriverDistractionState*) DD_OFF {
    if (FMCDriverDistractionState_DD_OFF == nil) {
        FMCDriverDistractionState_DD_OFF = [[FMCDriverDistractionState alloc] initWithValue:@"DD_OFF"];
    }
    return FMCDriverDistractionState_DD_OFF;
}

@end
