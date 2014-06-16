//  FMCTouchType.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCTouchType.h>

FMCTouchType* FMCTouchType_BEGIN = nil;
FMCTouchType* FMCTouchType_MOVE = nil;
FMCTouchType* FMCTouchType_END = nil;

NSMutableArray* FMCTouchType_values = nil;

@implementation FMCTouchType

+(FMCTouchType*) valueOf:(NSString*) value {
    for (FMCTouchType* item in FMCTouchType.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCTouchType_values == nil) {
        FMCTouchType_values = [[NSMutableArray alloc] initWithObjects:
                FMCTouchType.BEGIN,
                FMCTouchType.MOVE,
                FMCTouchType.END,
                nil];
    }
    return FMCTouchType_values;
}

+(FMCTouchType*) BEGIN {
    if (FMCTouchType_BEGIN == nil) {
        FMCTouchType_BEGIN = [[FMCTouchType alloc] initWithValue:@"BEGIN"];
    }
    return FMCTouchType_BEGIN;
}

+(FMCTouchType*) MOVE {
    if (FMCTouchType_MOVE == nil) {
        FMCTouchType_MOVE = [[FMCTouchType alloc] initWithValue:@"MOVE"];
    }
    return FMCTouchType_MOVE;
}

+(FMCTouchType*) END {
    if (FMCTouchType_END == nil) {
        FMCTouchType_END = [[FMCTouchType alloc] initWithValue:@"END"];
    }
    return FMCTouchType_END;
}

@end
