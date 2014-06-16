//  FMCSamplingRate.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCSamplingRate.h>

FMCSamplingRate* FMCSamplingRate_8KHZ = nil;
FMCSamplingRate* FMCSamplingRate_16KHZ = nil;
FMCSamplingRate* FMCSamplingRate_22KHZ = nil;
FMCSamplingRate* FMCSamplingRate_44KHZ = nil;

NSMutableArray* FMCSamplingRate_values = nil;

@implementation FMCSamplingRate

+(FMCSamplingRate*) valueOf:(NSString*) value {
    for (FMCSamplingRate* item in FMCSamplingRate.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCSamplingRate_values == nil) {
        FMCSamplingRate_values = [[NSMutableArray alloc] initWithObjects:
                FMCSamplingRate._8KHZ,
                FMCSamplingRate._16KHZ,
                FMCSamplingRate._22KHZ,
                FMCSamplingRate._44KHZ,
                nil];
    }
    return FMCSamplingRate_values;
}

+(FMCSamplingRate*) _8KHZ {
    if (FMCSamplingRate_8KHZ == nil) {
        FMCSamplingRate_8KHZ = [[FMCSamplingRate alloc] initWithValue:@"8KHZ"];
    }
    return FMCSamplingRate_8KHZ;
}

+(FMCSamplingRate*) _16KHZ {
    if (FMCSamplingRate_16KHZ == nil) {
        FMCSamplingRate_16KHZ = [[FMCSamplingRate alloc] initWithValue:@"16KHZ"];
    }
    return FMCSamplingRate_16KHZ;
}

+(FMCSamplingRate*) _22KHZ {
    if (FMCSamplingRate_22KHZ == nil) {
        FMCSamplingRate_22KHZ = [[FMCSamplingRate alloc] initWithValue:@"22KHZ"];
    }
    return FMCSamplingRate_22KHZ;
}

+(FMCSamplingRate*) _44KHZ {
    if (FMCSamplingRate_44KHZ == nil) {
        FMCSamplingRate_44KHZ = [[FMCSamplingRate alloc] initWithValue:@"44KHZ"];
    }
    return FMCSamplingRate_44KHZ;
}

@end
