//  FMCCarModeStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCCarModeStatus.h>

FMCCarModeStatus* FMCCarModeStatus_NORMAL = nil;
FMCCarModeStatus* FMCCarModeStatus_FACTORY = nil;
FMCCarModeStatus* FMCCarModeStatus_TRANSPORT = nil;
FMCCarModeStatus* FMCCarModeStatus_CRASH = nil;

NSMutableArray* FMCCarModeStatus_values = nil;

@implementation FMCCarModeStatus

+(FMCCarModeStatus*) valueOf:(NSString*) value {
    for (FMCCarModeStatus* item in FMCCarModeStatus.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCCarModeStatus_values == nil) {
        FMCCarModeStatus_values = [[NSMutableArray alloc] initWithObjects:
                FMCCarModeStatus.NORMAL,
                FMCCarModeStatus.FACTORY,
                FMCCarModeStatus.TRANSPORT,
                FMCCarModeStatus.CRASH,
                nil];
    }
    return FMCCarModeStatus_values;
}

+(FMCCarModeStatus*) NORMAL {
    if (FMCCarModeStatus_NORMAL == nil) {
        FMCCarModeStatus_NORMAL = [[FMCCarModeStatus alloc] initWithValue:@"NORMAL"];
    }
    return FMCCarModeStatus_NORMAL;
}

+(FMCCarModeStatus*) FACTORY {
    if (FMCCarModeStatus_FACTORY == nil) {
        FMCCarModeStatus_FACTORY = [[FMCCarModeStatus alloc] initWithValue:@"FACTORY"];
    }
    return FMCCarModeStatus_FACTORY;
}

+(FMCCarModeStatus*) TRANSPORT {
    if (FMCCarModeStatus_TRANSPORT == nil) {
        FMCCarModeStatus_TRANSPORT = [[FMCCarModeStatus alloc] initWithValue:@"TRANSPORT"];
    }
    return FMCCarModeStatus_TRANSPORT;
}

+(FMCCarModeStatus*) CRASH {
    if (FMCCarModeStatus_CRASH == nil) {
        FMCCarModeStatus_CRASH = [[FMCCarModeStatus alloc] initWithValue:@"CRASH"];
    }
    return FMCCarModeStatus_CRASH;
}

@end
