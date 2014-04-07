//  FMCAudioStreamingState.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCAudioStreamingState.h>

FMCAudioStreamingState* FMCAudioStreamingState_AUDIBLE = nil;
FMCAudioStreamingState* FMCAudioStreamingState_ATTENUATED = nil;
FMCAudioStreamingState* FMCAudioStreamingState_NOT_AUDIBLE = nil;

NSMutableArray* FMCAudioStreamingState_values = nil;

@implementation FMCAudioStreamingState

+(FMCAudioStreamingState*) valueOf:(NSString*) value {
    for (FMCAudioStreamingState* item in FMCAudioStreamingState.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCAudioStreamingState_values == nil) {
        FMCAudioStreamingState_values = [[NSMutableArray alloc] initWithObjects:
                FMCAudioStreamingState.AUDIBLE,
                FMCAudioStreamingState.NOT_AUDIBLE,
                nil];
    }
    return FMCAudioStreamingState_values;
}

+(FMCAudioStreamingState*) AUDIBLE {
    if (FMCAudioStreamingState_AUDIBLE == nil) {
        FMCAudioStreamingState_AUDIBLE = [[FMCAudioStreamingState alloc] initWithValue:@"AUDIBLE"];
    }
    return FMCAudioStreamingState_AUDIBLE;
}

+(FMCAudioStreamingState*) ATTENUATED {
    if (FMCAudioStreamingState_ATTENUATED == nil) {
        FMCAudioStreamingState_ATTENUATED = [[FMCAudioStreamingState alloc] initWithValue:@"ATTENUATED"];
    }
    return FMCAudioStreamingState_ATTENUATED;
}

+(FMCAudioStreamingState*) NOT_AUDIBLE {
    if (FMCAudioStreamingState_NOT_AUDIBLE == nil) {
        FMCAudioStreamingState_NOT_AUDIBLE = [[FMCAudioStreamingState alloc] initWithValue:@"NOT_AUDIBLE"];
    }
    return FMCAudioStreamingState_NOT_AUDIBLE;
}

@end
