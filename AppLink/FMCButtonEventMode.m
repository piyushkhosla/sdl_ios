//  FMCButtonEventMode.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCButtonEventMode.h>

FMCButtonEventMode* FMCButtonEventMode_BUTTONUP = nil;
FMCButtonEventMode* FMCButtonEventMode_BUTTONDOWN = nil;

NSMutableArray* FMCButtonEventMode_values = nil;

@implementation FMCButtonEventMode

+(FMCButtonEventMode*) valueOf:(NSString*) value {
    for (FMCButtonEventMode* item in FMCButtonEventMode.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCButtonEventMode_values == nil) {
        FMCButtonEventMode_values = [[NSMutableArray alloc] initWithObjects:
                FMCButtonEventMode.BUTTONUP,
                FMCButtonEventMode.BUTTONDOWN,
                nil];
    }
    return FMCButtonEventMode_values;
}

+(FMCButtonEventMode*) BUTTONUP {
    if (FMCButtonEventMode_BUTTONUP == nil) {
        FMCButtonEventMode_BUTTONUP = [[FMCButtonEventMode alloc] initWithValue:@"BUTTONUP"];
    }
    return FMCButtonEventMode_BUTTONUP;
}

+(FMCButtonEventMode*) BUTTONDOWN {
    if (FMCButtonEventMode_BUTTONDOWN == nil) {
        FMCButtonEventMode_BUTTONDOWN = [[FMCButtonEventMode alloc] initWithValue:@"BUTTONDOWN"];
    }
    return FMCButtonEventMode_BUTTONDOWN;
}

@end
