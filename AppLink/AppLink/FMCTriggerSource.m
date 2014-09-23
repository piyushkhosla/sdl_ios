//  FMCTriggerSource.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCTriggerSource.h>

FMCTriggerSource* FMCTriggerSource_MENU = nil;
FMCTriggerSource* FMCTriggerSource_VR = nil;
FMCTriggerSource* FMCTriggerSource_KEYBOARD = nil;

NSMutableArray* FMCTriggerSource_values = nil;

@implementation FMCTriggerSource

+(FMCTriggerSource*) valueOf:(NSString*) value {
    for (FMCTriggerSource* item in FMCTriggerSource.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCTriggerSource_values == nil) {
        FMCTriggerSource_values = [[NSMutableArray alloc] initWithObjects:
                FMCTriggerSource.MENU,
                FMCTriggerSource.VR,
                FMCTriggerSource.KEYBOARD,
                nil];
    }
    return FMCTriggerSource_values;
}

+(FMCTriggerSource*) MENU {
    if (FMCTriggerSource_MENU == nil) {
        FMCTriggerSource_MENU = [[FMCTriggerSource alloc] initWithValue:@"MENU"];
    }
    return FMCTriggerSource_MENU;
}

+(FMCTriggerSource*) VR {
    if (FMCTriggerSource_VR == nil) {
        FMCTriggerSource_VR = [[FMCTriggerSource alloc] initWithValue:@"VR"];
    }
    return FMCTriggerSource_VR;
}

+(FMCTriggerSource*) KEYBOARD {
    if (FMCTriggerSource_KEYBOARD == nil) {
        FMCTriggerSource_KEYBOARD = [[FMCTriggerSource alloc] initWithValue:@"KEYBOARD"];
    }
    return FMCTriggerSource_KEYBOARD;
}

@end
