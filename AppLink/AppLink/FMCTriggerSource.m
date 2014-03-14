//  FMCTriggerSource.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCTriggerSource.h>

FMCTriggerSource* FMCTriggerSource_TS_MENU = nil;
FMCTriggerSource* FMCTriggerSource_TS_VR = nil;
FMCTriggerSource* FMCTriggerSource_TS_KEYBOARD = nil;

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
                                   FMCTriggerSource.TS_MENU,
                                   FMCTriggerSource.TS_VR,
                                   FMCTriggerSource.TS_KEYBOARD,
                                   nil];
    }
    return FMCTriggerSource_values;
}

+(FMCTriggerSource*) TS_MENU {
    	if (FMCTriggerSource_TS_MENU == nil) {
        		FMCTriggerSource_TS_MENU = [[FMCTriggerSource alloc] initWithValue:@"MENU"];
    	}
    	return FMCTriggerSource_TS_MENU;
}

+(FMCTriggerSource*) TS_VR {
    if (FMCTriggerSource_TS_VR == nil) {
        FMCTriggerSource_TS_VR = [[FMCTriggerSource alloc] initWithValue:@"VR"];
    }
    return FMCTriggerSource_TS_VR;
}

+(FMCTriggerSource*) TS_KEYBOARD
{
    if (FMCTriggerSource_TS_KEYBOARD == nil)
    {
        FMCTriggerSource_TS_KEYBOARD = [[FMCTriggerSource alloc] initWithValue:@"KEYBOARD"];
    }

    return FMCTriggerSource_TS_KEYBOARD;
}

@end
