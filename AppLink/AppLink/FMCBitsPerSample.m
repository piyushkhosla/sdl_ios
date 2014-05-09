//  FMCBitsPerSample.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCBitsPerSample.h>

FMCBitsPerSample* FMCBitsPerSample_8_BIT = nil;
FMCBitsPerSample* FMCBitsPerSample_16_BIT = nil;

NSMutableArray* FMCBitsPerSample_values = nil;

@implementation FMCBitsPerSample

+(FMCBitsPerSample*) valueOf:(NSString*) value {
    for (FMCBitsPerSample* item in FMCBitsPerSample.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCBitsPerSample_values == nil) {
        FMCBitsPerSample_values = [[NSMutableArray alloc] initWithObjects:
                FMCBitsPerSample._8_BIT,
                FMCBitsPerSample._16_BIT,
                nil];
    }
    return FMCBitsPerSample_values;
}

+(FMCBitsPerSample*) _8_BIT {
    if (FMCBitsPerSample_8_BIT == nil) {
        FMCBitsPerSample_8_BIT = [[FMCBitsPerSample alloc] initWithValue:@"8_BIT"];
    }
    return FMCBitsPerSample_8_BIT;
}

+(FMCBitsPerSample*) _16_BIT {
    if (FMCBitsPerSample_16_BIT == nil) {
        FMCBitsPerSample_16_BIT = [[FMCBitsPerSample alloc] initWithValue:@"16_BIT"];
    }
    return FMCBitsPerSample_16_BIT;
}

@end
