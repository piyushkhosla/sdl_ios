//  FMCLayoutMode.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCLayoutMode.h>

FMCLayoutMode* FMCLayoutMode_ICON_ONLY = nil;
FMCLayoutMode* FMCLayoutMode_ICON_WITH_SEARCH = nil;
FMCLayoutMode* FMCLayoutMode_LIST_ONLY = nil;
FMCLayoutMode* FMCLayoutMode_LIST_WITH_SEARCH = nil;
FMCLayoutMode* FMCLayoutMode_KEYBOARD = nil;

NSMutableArray* FMCLayoutMode_values = nil;

@implementation FMCLayoutMode

+(FMCLayoutMode*) valueOf:(NSString*) value {
    for (FMCLayoutMode* item in FMCLayoutMode.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCLayoutMode_values == nil) {
        FMCLayoutMode_values = [[NSMutableArray alloc] initWithObjects:
                FMCLayoutMode.ICON_ONLY,
                FMCLayoutMode.ICON_WITH_SEARCH,
                FMCLayoutMode.LIST_ONLY,
                FMCLayoutMode.LIST_WITH_SEARCH,
                FMCLayoutMode.KEYBOARD,
                nil];
    }
    return FMCLayoutMode_values;
}

+(FMCLayoutMode*) ICON_ONLY {
    if (FMCLayoutMode_ICON_ONLY == nil) {
        FMCLayoutMode_ICON_ONLY = [[FMCLayoutMode alloc] initWithValue:@"ICON_ONLY"];
    }
    return FMCLayoutMode_ICON_ONLY;
}

+(FMCLayoutMode*) ICON_WITH_SEARCH {
    if (FMCLayoutMode_ICON_WITH_SEARCH == nil) {
        FMCLayoutMode_ICON_WITH_SEARCH = [[FMCLayoutMode alloc] initWithValue:@"ICON_WITH_SEARCH"];
    }
    return FMCLayoutMode_ICON_WITH_SEARCH;
}

+(FMCLayoutMode*) LIST_ONLY {
    if (FMCLayoutMode_LIST_ONLY == nil) {
        FMCLayoutMode_LIST_ONLY = [[FMCLayoutMode alloc] initWithValue:@"LIST_ONLY"];
    }
    return FMCLayoutMode_LIST_ONLY;
}

+(FMCLayoutMode*) LIST_WITH_SEARCH {
    if (FMCLayoutMode_LIST_WITH_SEARCH == nil) {
        FMCLayoutMode_LIST_WITH_SEARCH = [[FMCLayoutMode alloc] initWithValue:@"LIST_WITH_SEARCH"];
    }
    return FMCLayoutMode_LIST_WITH_SEARCH;
}

+(FMCLayoutMode*) KEYBOARD {
    if (FMCLayoutMode_KEYBOARD == nil) {
        FMCLayoutMode_KEYBOARD = [[FMCLayoutMode alloc] initWithValue:@"KEYBOARD"];
    }
    return FMCLayoutMode_KEYBOARD;
}

@end
