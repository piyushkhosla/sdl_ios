//  FMCLayoutMode.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCLayoutMode.h>

FMCLayoutMode* FMCLayoutMode_ICONS_ONLY = nil;
FMCLayoutMode* FMCLayoutMode_ICONS_WITH_SEARCH = nil;
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
                FMCLayoutMode.ICONS_ONLY,
                FMCLayoutMode.ICONS_WITH_SEARCH,
                FMCLayoutMode.LIST_ONLY,
                FMCLayoutMode.LIST_WITH_SEARCH,
                FMCLayoutMode.KEYBOARD,
                nil];
    }
    return FMCLayoutMode_values;
}

+(FMCLayoutMode*) ICONS_ONLY {
    if (FMCLayoutMode_ICONS_ONLY == nil) {
        FMCLayoutMode_ICONS_ONLY = [[FMCLayoutMode alloc] initWithValue:@"ICONS_ONLY"];
    }
    return FMCLayoutMode_ICONS_ONLY;
}

+(FMCLayoutMode*) ICONS_WITH_SEARCH {
    if (FMCLayoutMode_ICONS_WITH_SEARCH == nil) {
        FMCLayoutMode_ICONS_WITH_SEARCH = [[FMCLayoutMode alloc] initWithValue:@"ICONS_WITH_SEARCH"];
    }
    return FMCLayoutMode_ICONS_WITH_SEARCH;
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
