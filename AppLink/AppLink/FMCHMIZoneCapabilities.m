//  FMCHmiZoneCapabilities.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCHmiZoneCapabilities.h>

FMCHmiZoneCapabilities* FMCHmiZoneCapabilities_FRONT = nil;
FMCHmiZoneCapabilities* FMCHmiZoneCapabilities_BACK = nil;

NSMutableArray* FMCHmiZoneCapabilities_values = nil;

@implementation FMCHmiZoneCapabilities

+(FMCHmiZoneCapabilities*) valueOf:(NSString*) value {
    for (FMCHmiZoneCapabilities* item in FMCHmiZoneCapabilities.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCHmiZoneCapabilities_values == nil) {
        FMCHmiZoneCapabilities_values = [[NSMutableArray alloc] initWithObjects:
                FMCHmiZoneCapabilities.FRONT,
                FMCHmiZoneCapabilities.BACK,
                nil];
    }
    return FMCHmiZoneCapabilities_values;
}

+(FMCHmiZoneCapabilities*) FRONT {
    if (FMCHmiZoneCapabilities_FRONT == nil) {
        FMCHmiZoneCapabilities_FRONT = [[FMCHmiZoneCapabilities alloc] initWithValue:@"FRONT"];
    }
    return FMCHmiZoneCapabilities_FRONT;
}

+(FMCHmiZoneCapabilities*) BACK {
    if (FMCHmiZoneCapabilities_BACK == nil) {
        FMCHmiZoneCapabilities_BACK = [[FMCHmiZoneCapabilities alloc] initWithValue:@"BACK"];
    }
    return FMCHmiZoneCapabilities_BACK;
}

@end
