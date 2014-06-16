//  FMCSoftButtonType.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCSoftButtonType.h>

FMCSoftButtonType* FMCSoftButtonType_TEXT = nil;
FMCSoftButtonType* FMCSoftButtonType_IMAGE = nil;
FMCSoftButtonType* FMCSoftButtonType_BOTH = nil;

NSMutableArray* FMCSoftButtonType_values = nil;

@implementation FMCSoftButtonType

+(FMCSoftButtonType*) valueOf:(NSString*) value {
    for (FMCSoftButtonType* item in FMCSoftButtonType.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCSoftButtonType_values == nil) {
        FMCSoftButtonType_values = [[NSMutableArray alloc] initWithObjects:
                FMCSoftButtonType.TEXT,
                FMCSoftButtonType.IMAGE,
                FMCSoftButtonType.BOTH,
                nil];
    }
    return FMCSoftButtonType_values;
}

+(FMCSoftButtonType*) TEXT {
    if (FMCSoftButtonType_TEXT == nil) {
        FMCSoftButtonType_TEXT = [[FMCSoftButtonType alloc] initWithValue:@"TEXT"];
    }
    return FMCSoftButtonType_TEXT;
}

+(FMCSoftButtonType*) IMAGE {
    if (FMCSoftButtonType_IMAGE == nil) {
        FMCSoftButtonType_IMAGE = [[FMCSoftButtonType alloc] initWithValue:@"IMAGE"];
    }
    return FMCSoftButtonType_IMAGE;
}

+(FMCSoftButtonType*) BOTH {
    if (FMCSoftButtonType_BOTH == nil) {
        FMCSoftButtonType_BOTH = [[FMCSoftButtonType alloc] initWithValue:@"BOTH"];
    }
    return FMCSoftButtonType_BOTH;
}

@end
