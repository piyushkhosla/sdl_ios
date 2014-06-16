//  FMCKeypressMode.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCKeypressMode.h>

FMCKeypressMode* FMCKeypressMode_SINGLE_KEYPRESS = nil;
FMCKeypressMode* FMCKeypressMode_QUEUE_KEYPRESSES = nil;
FMCKeypressMode* FMCKeypressMode_RESEND_CURRENT_ENTRY = nil;

NSMutableArray* FMCKeypressMode_values = nil;

@implementation FMCKeypressMode

+(FMCKeypressMode*) valueOf:(NSString*) value {
    for (FMCKeypressMode* item in FMCKeypressMode.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCKeypressMode_values == nil) {
        FMCKeypressMode_values = [[NSMutableArray alloc] initWithObjects:
                FMCKeypressMode.SINGLE_KEYPRESS,
                FMCKeypressMode.QUEUE_KEYPRESSES,
                FMCKeypressMode.RESEND_CURRENT_ENTRY,
                nil];
    }
    return FMCKeypressMode_values;
}

+(FMCKeypressMode*) SINGLE_KEYPRESS {
    if (FMCKeypressMode_SINGLE_KEYPRESS == nil) {
        FMCKeypressMode_SINGLE_KEYPRESS = [[FMCKeypressMode alloc] initWithValue:@"SINGLE_KEYPRESS"];
    }
    return FMCKeypressMode_SINGLE_KEYPRESS;
}

+(FMCKeypressMode*) QUEUE_KEYPRESSES {
    if (FMCKeypressMode_QUEUE_KEYPRESSES == nil) {
        FMCKeypressMode_QUEUE_KEYPRESSES = [[FMCKeypressMode alloc] initWithValue:@"QUEUE_KEYPRESSES"];
    }
    return FMCKeypressMode_QUEUE_KEYPRESSES;
}

+(FMCKeypressMode*) RESEND_CURRENT_ENTRY {
    if (FMCKeypressMode_RESEND_CURRENT_ENTRY == nil) {
        FMCKeypressMode_RESEND_CURRENT_ENTRY = [[FMCKeypressMode alloc] initWithValue:@"RESEND_CURRENT_ENTRY"];
    }
    return FMCKeypressMode_RESEND_CURRENT_ENTRY;
}

@end
