//  FMCMediaClockFormat.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCMediaClockFormat.h>

FMCMediaClockFormat* FMCMediaClockFormat_CLOCK1 = nil;
FMCMediaClockFormat* FMCMediaClockFormat_CLOCK2 = nil;
FMCMediaClockFormat* FMCMediaClockFormat_CLOCK3 = nil;
FMCMediaClockFormat* FMCMediaClockFormat_CLOCKTEXT1 = nil;
FMCMediaClockFormat* FMCMediaClockFormat_CLOCKTEXT2 = nil;
FMCMediaClockFormat* FMCMediaClockFormat_CLOCKTEXT3 = nil;
FMCMediaClockFormat* FMCMediaClockFormat_CLOCKTEXT4 = nil;

NSMutableArray* FMCMediaClockFormat_values = nil;
@implementation FMCMediaClockFormat

+(FMCMediaClockFormat*) valueOf:(NSString*) value {
    for (FMCMediaClockFormat* item in FMCMediaClockFormat.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCMediaClockFormat_values == nil) {
        FMCMediaClockFormat_values = [[NSMutableArray alloc] initWithObjects:
                                     FMCMediaClockFormat.CLOCK1,
                                     FMCMediaClockFormat.CLOCK2,
                                     FMCMediaClockFormat.CLOCK3,
                                     FMCMediaClockFormat.CLOCKTEXT1,
                                     FMCMediaClockFormat.CLOCKTEXT2,
                                     FMCMediaClockFormat.CLOCKTEXT3,
                                     FMCMediaClockFormat.CLOCKTEXT4,
                                     nil];
    }
    return FMCMediaClockFormat_values;
}

+(FMCMediaClockFormat*) CLOCK1 {
    if (FMCMediaClockFormat_CLOCK1 == nil) {
        FMCMediaClockFormat_CLOCK1 = [[FMCMediaClockFormat alloc] initWithValue:@"CLOCK1"];
    }
    return FMCMediaClockFormat_CLOCK1;
}

+(FMCMediaClockFormat*) CLOCK2 {
    if (FMCMediaClockFormat_CLOCK2 == nil) {
        FMCMediaClockFormat_CLOCK2 = [[FMCMediaClockFormat alloc] initWithValue:@"CLOCK2"];
    }
    return FMCMediaClockFormat_CLOCK2;
}

+(FMCMediaClockFormat*) CLOCK3 {
    if (FMCMediaClockFormat_CLOCK3 == nil) {
        FMCMediaClockFormat_CLOCK3 = [[FMCMediaClockFormat alloc] initWithValue:@"CLOCK3"];
    }
    return FMCMediaClockFormat_CLOCK2;
}

+(FMCMediaClockFormat*) CLOCKTEXT1 {
    if (FMCMediaClockFormat_CLOCKTEXT1 == nil) {
        FMCMediaClockFormat_CLOCKTEXT1 = [[FMCMediaClockFormat alloc] initWithValue:@"CLOCKTEXT1"];
    }
    return FMCMediaClockFormat_CLOCKTEXT1;
}

+(FMCMediaClockFormat*) CLOCKTEXT2 {
    if (FMCMediaClockFormat_CLOCKTEXT2 == nil) {
        FMCMediaClockFormat_CLOCKTEXT2 = [[FMCMediaClockFormat alloc] initWithValue:@"CLOCKTEXT2"];
    }
    return FMCMediaClockFormat_CLOCKTEXT2;
}

+(FMCMediaClockFormat*) CLOCKTEXT3 {
    if (FMCMediaClockFormat_CLOCKTEXT3 == nil) {
        FMCMediaClockFormat_CLOCKTEXT3 = [[FMCMediaClockFormat alloc] initWithValue:@"CLOCKTEXT3"];
    }
    return FMCMediaClockFormat_CLOCKTEXT3;
}

+(FMCMediaClockFormat*) CLOCKTEXT4 {
    if (FMCMediaClockFormat_CLOCKTEXT4 == nil) {
        FMCMediaClockFormat_CLOCKTEXT4 = [[FMCMediaClockFormat alloc] initWithValue:@"CLOCKTEXT4"];
    }
    return FMCMediaClockFormat_CLOCKTEXT4;
}

@end
