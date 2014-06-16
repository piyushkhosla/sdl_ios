//  FMCInteractionMode.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCInteractionMode.h>

FMCInteractionMode* FMCInteractionMode_MANUAL_ONLY = nil;
FMCInteractionMode* FMCInteractionMode_VR_ONLY = nil;
FMCInteractionMode* FMCInteractionMode_BOTH = nil;

NSMutableArray* FMCInteractionMode_values = nil;

@implementation FMCInteractionMode

+(FMCInteractionMode*) valueOf:(NSString*) value {
    for (FMCInteractionMode* item in FMCInteractionMode.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCInteractionMode_values == nil) {
        FMCInteractionMode_values = [[NSMutableArray alloc] initWithObjects:
                FMCInteractionMode.MANUAL_ONLY,
                FMCInteractionMode.VR_ONLY,
                FMCInteractionMode.BOTH,
                nil];
    }
    return FMCInteractionMode_values;
}

+(FMCInteractionMode*) MANUAL_ONLY {
    if (FMCInteractionMode_MANUAL_ONLY == nil) {
        FMCInteractionMode_MANUAL_ONLY = [[FMCInteractionMode alloc] initWithValue:@"MANUAL_ONLY"];
    }
    return FMCInteractionMode_MANUAL_ONLY;
}

+(FMCInteractionMode*) VR_ONLY {
    if (FMCInteractionMode_VR_ONLY == nil) {
        FMCInteractionMode_VR_ONLY = [[FMCInteractionMode alloc] initWithValue:@"VR_ONLY"];
    }
    return FMCInteractionMode_VR_ONLY;
}

+(FMCInteractionMode*) BOTH {
    if (FMCInteractionMode_BOTH == nil) {
        FMCInteractionMode_BOTH = [[FMCInteractionMode alloc] initWithValue:@"BOTH"];
    }
    return FMCInteractionMode_BOTH;
}

@end
