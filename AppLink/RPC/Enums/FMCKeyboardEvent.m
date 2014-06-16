//  FMCKeyboardEvent.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCKeyboardEvent.h>

FMCKeyboardEvent* FMCKeyboardEvent_KEYPRESS = nil;
FMCKeyboardEvent* FMCKeyboardEvent_ENTRY_SUBMITTED = nil;
FMCKeyboardEvent* FMCKeyboardEvent_ENTRY_CANCELLED = nil;
FMCKeyboardEvent* FMCKeyboardEvent_ENTRY_ABORTED = nil;

NSMutableArray* FMCKeyboardEvent_values = nil;

@implementation FMCKeyboardEvent

+(FMCKeyboardEvent*) valueOf:(NSString*) value {
    for (FMCKeyboardEvent* item in FMCKeyboardEvent.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCKeyboardEvent_values == nil) {
        FMCKeyboardEvent_values = [[NSMutableArray alloc] initWithObjects:
                FMCKeyboardEvent.KEYPRESS,
                FMCKeyboardEvent.ENTRY_SUBMITTED,
                FMCKeyboardEvent.ENTRY_CANCELLED,
                FMCKeyboardEvent.ENTRY_ABORTED,
                nil];
    }
    return FMCKeyboardEvent_values;
}

+(FMCKeyboardEvent*) KEYPRESS {
    if (FMCKeyboardEvent_KEYPRESS == nil) {
        FMCKeyboardEvent_KEYPRESS = [[FMCKeyboardEvent alloc] initWithValue:@"KEYPRESS"];
    }
    return FMCKeyboardEvent_KEYPRESS;
}

+(FMCKeyboardEvent*) ENTRY_SUBMITTED {
    if (FMCKeyboardEvent_ENTRY_SUBMITTED == nil) {
        FMCKeyboardEvent_ENTRY_SUBMITTED = [[FMCKeyboardEvent alloc] initWithValue:@"ENTRY_SUBMITTED"];
    }
    return FMCKeyboardEvent_ENTRY_SUBMITTED;
}

+(FMCKeyboardEvent*) ENTRY_CANCELLED {
    if (FMCKeyboardEvent_ENTRY_CANCELLED == nil) {
        FMCKeyboardEvent_ENTRY_CANCELLED = [[FMCKeyboardEvent alloc] initWithValue:@"ENTRY_CANCELLED"];
    }
    return FMCKeyboardEvent_ENTRY_CANCELLED;
}

+(FMCKeyboardEvent*) ENTRY_ABORTED {
    if (FMCKeyboardEvent_ENTRY_ABORTED == nil) {
        FMCKeyboardEvent_ENTRY_ABORTED = [[FMCKeyboardEvent alloc] initWithValue:@"ENTRY_ABORTED"];
    }
    return FMCKeyboardEvent_ENTRY_ABORTED;
}

@end
