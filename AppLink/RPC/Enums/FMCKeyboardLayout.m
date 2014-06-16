//  FMCKeyboardLayout.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCKeyboardLayout.h>

FMCKeyboardLayout* FMCKeyboardLayout_QWERTY = nil;
FMCKeyboardLayout* FMCKeyboardLayout_QWERTZ = nil;
FMCKeyboardLayout* FMCKeyboardLayout_AZERTY = nil;

NSMutableArray* FMCKeyboardLayout_values = nil;

@implementation FMCKeyboardLayout

+(FMCKeyboardLayout*) valueOf:(NSString*) value {
    for (FMCKeyboardLayout* item in FMCKeyboardLayout.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCKeyboardLayout_values == nil) {
        FMCKeyboardLayout_values = [[NSMutableArray alloc] initWithObjects:
                FMCKeyboardLayout.QWERTY,
                FMCKeyboardLayout.QWERTZ,
                FMCKeyboardLayout.AZERTY,
                nil];
    }
    return FMCKeyboardLayout_values;
}

+(FMCKeyboardLayout*) QWERTY {
    if (FMCKeyboardLayout_QWERTY == nil) {
        FMCKeyboardLayout_QWERTY = [[FMCKeyboardLayout alloc] initWithValue:@"QWERTY"];
    }
    return FMCKeyboardLayout_QWERTY;
}

+(FMCKeyboardLayout*) QWERTZ {
    if (FMCKeyboardLayout_QWERTZ == nil) {
        FMCKeyboardLayout_QWERTZ = [[FMCKeyboardLayout alloc] initWithValue:@"QWERTZ"];
    }
    return FMCKeyboardLayout_QWERTZ;
}

+(FMCKeyboardLayout*) AZERTY {
    if (FMCKeyboardLayout_AZERTY == nil) {
        FMCKeyboardLayout_AZERTY = [[FMCKeyboardLayout alloc] initWithValue:@"AZERTY"];
    }
    return FMCKeyboardLayout_AZERTY;
}

@end
