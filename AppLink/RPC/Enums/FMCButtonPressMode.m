//  FMCButtonPressMode.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCButtonPressMode.h>

FMCButtonPressMode* FMCButtonPressMode_LONG = nil;
FMCButtonPressMode* FMCButtonPressMode_SHORT = nil;

NSMutableArray* FMCButtonPressMode_values = nil;

@implementation FMCButtonPressMode

+(FMCButtonPressMode*) valueOf:(NSString*) value {
    for (FMCButtonPressMode* item in FMCButtonPressMode.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCButtonPressMode_values == nil) {
        FMCButtonPressMode_values = [[NSMutableArray alloc] initWithObjects:
                FMCButtonPressMode.LONG,
                FMCButtonPressMode.SHORT,
                nil];
    }
    return FMCButtonPressMode_values;
}

+(FMCButtonPressMode*) LONG {
    if (FMCButtonPressMode_LONG == nil) {
        FMCButtonPressMode_LONG = [[FMCButtonPressMode alloc] initWithValue:@"LONG"];
    }
    return FMCButtonPressMode_LONG;
}

+(FMCButtonPressMode*) SHORT {
    if (FMCButtonPressMode_SHORT == nil) {
        FMCButtonPressMode_SHORT = [[FMCButtonPressMode alloc] initWithValue:@"SHORT"];
    }
    return FMCButtonPressMode_SHORT;
}

@end
