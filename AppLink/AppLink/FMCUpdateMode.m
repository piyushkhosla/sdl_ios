//  FMCUpdateMode.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCUpdateMode.h>

FMCUpdateMode* FMCUpdateMode_COUNTUP = nil;
FMCUpdateMode* FMCUpdateMode_COUNTDOWN = nil;
FMCUpdateMode* FMCUpdateMode_PAUSE = nil;
FMCUpdateMode* FMCUpdateMode_RESUME = nil;
FMCUpdateMode* FMCUpdateMode_CLEAR = nil;

NSMutableArray* FMCUpdateMode_values = nil;
@implementation FMCUpdateMode

+(FMCUpdateMode*) valueOf:(NSString*) value {
    for (FMCUpdateMode* item in FMCUpdateMode.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCUpdateMode_values == nil) {
        FMCUpdateMode_values = [[NSMutableArray alloc] initWithObjects:
                FMCUpdateMode.COUNTUP,
                FMCUpdateMode.COUNTDOWN,
                FMCUpdateMode.PAUSE,
                FMCUpdateMode.RESUME,
                FMCUpdateMode_CLEAR,
                nil];
    }
    return FMCUpdateMode_values;
}

+(FMCUpdateMode*) COUNTUP {
    	if (FMCUpdateMode_COUNTUP == nil) {
        		FMCUpdateMode_COUNTUP = [[FMCUpdateMode alloc] initWithValue:@"COUNTUP"];
    	}
    	return FMCUpdateMode_COUNTUP;
}

+(FMCUpdateMode*) COUNTDOWN {
    	if (FMCUpdateMode_COUNTDOWN == nil) {
        		FMCUpdateMode_COUNTDOWN = [[FMCUpdateMode alloc] initWithValue:@"COUNTDOWN"];
    	}
    	return FMCUpdateMode_COUNTDOWN;
}

+(FMCUpdateMode*) PAUSE {
    	if (FMCUpdateMode_PAUSE == nil) {
        		FMCUpdateMode_PAUSE = [[FMCUpdateMode alloc] initWithValue:@"PAUSE"];
    	}
    	return FMCUpdateMode_PAUSE;
}

+(FMCUpdateMode*) RESUME {
    	if (FMCUpdateMode_RESUME == nil) {
        		FMCUpdateMode_RESUME = [[FMCUpdateMode alloc] initWithValue:@"RESUME"];
    	}
    	return FMCUpdateMode_RESUME;
}

+(FMCUpdateMode*) CLEAR {
    if (FMCUpdateMode_CLEAR == nil) {
        FMCUpdateMode_CLEAR = [[FMCUpdateMode alloc] initWithValue:@"CLEAR"];
    }
    return FMCUpdateMode_CLEAR;
}

@end
