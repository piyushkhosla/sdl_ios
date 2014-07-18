//  FMCPRNDL.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCPRNDL.h>

FMCPRNDL* FMCPRNDL_PARK = nil;
FMCPRNDL* FMCPRNDL_REVERSE = nil;
FMCPRNDL* FMCPRNDL_NEUTRAL = nil;
FMCPRNDL* FMCPRNDL_DRIVE = nil;
FMCPRNDL* FMCPRNDL_SPORT = nil;
FMCPRNDL* FMCPRNDL_LOWGEAR = nil;
FMCPRNDL* FMCPRNDL_FIRST = nil;
FMCPRNDL* FMCPRNDL_SECOND = nil;
FMCPRNDL* FMCPRNDL_THIRD = nil;
FMCPRNDL* FMCPRNDL_FOURTH = nil;
FMCPRNDL* FMCPRNDL_FIFTH = nil;
FMCPRNDL* FMCPRNDL_SIXTH = nil;
FMCPRNDL* FMCPRNDL_SEVENTH = nil;
FMCPRNDL* FMCPRNDL_EIGHTH = nil;
FMCPRNDL* FMCPRNDL_UNKNOWN = nil;
FMCPRNDL* FMCPRNDL_FAULT = nil;

NSMutableArray* FMCPRNDL_values = nil;

@implementation FMCPRNDL

+(FMCPRNDL*) valueOf:(NSString*) value {
    for (FMCPRNDL* item in FMCPRNDL.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCPRNDL_values == nil) {
        FMCPRNDL_values = [[NSMutableArray alloc] initWithObjects:
                FMCPRNDL.PARK,
                FMCPRNDL.REVERSE,
                FMCPRNDL.NEUTRAL,
                FMCPRNDL.DRIVE,
                FMCPRNDL.SPORT,
                FMCPRNDL.LOWGEAR,
                FMCPRNDL.FIRST,
                FMCPRNDL.SECOND,
                FMCPRNDL.THIRD,
                FMCPRNDL.FOURTH,
                FMCPRNDL.FIFTH,
                FMCPRNDL.SIXTH,
                FMCPRNDL.SEVENTH,
                FMCPRNDL.EIGHTH,
                FMCPRNDL.UNKNOWN,
                FMCPRNDL.FAULT,
                nil];
    }
    return FMCPRNDL_values;
}

+(FMCPRNDL*) PARK {
    if (FMCPRNDL_PARK == nil) {
        FMCPRNDL_PARK = [[FMCPRNDL alloc] initWithValue:@"PARK"];
    }
    return FMCPRNDL_PARK;
}

+(FMCPRNDL*) REVERSE {
    if (FMCPRNDL_REVERSE == nil) {
        FMCPRNDL_REVERSE = [[FMCPRNDL alloc] initWithValue:@"REVERSE"];
    }
    return FMCPRNDL_REVERSE;
}

+(FMCPRNDL*) NEUTRAL {
    if (FMCPRNDL_NEUTRAL == nil) {
        FMCPRNDL_NEUTRAL = [[FMCPRNDL alloc] initWithValue:@"NEUTRAL"];
    }
    return FMCPRNDL_NEUTRAL;
}

+(FMCPRNDL*) DRIVE {
    if (FMCPRNDL_DRIVE == nil) {
        FMCPRNDL_DRIVE = [[FMCPRNDL alloc] initWithValue:@"DRIVE"];
    }
    return FMCPRNDL_DRIVE;
}

+(FMCPRNDL*) SPORT {
    if (FMCPRNDL_SPORT == nil) {
        FMCPRNDL_SPORT = [[FMCPRNDL alloc] initWithValue:@"SPORT"];
    }
    return FMCPRNDL_SPORT;
}

+(FMCPRNDL*) LOWGEAR {
    if (FMCPRNDL_LOWGEAR == nil) {
        FMCPRNDL_LOWGEAR = [[FMCPRNDL alloc] initWithValue:@"LOWGEAR"];
    }
    return FMCPRNDL_LOWGEAR;
}

+(FMCPRNDL*) FIRST {
    if (FMCPRNDL_FIRST == nil) {
        FMCPRNDL_FIRST = [[FMCPRNDL alloc] initWithValue:@"FIRST"];
    }
    return FMCPRNDL_FIRST;
}

+(FMCPRNDL*) SECOND {
    if (FMCPRNDL_SECOND == nil) {
        FMCPRNDL_SECOND = [[FMCPRNDL alloc] initWithValue:@"SECOND"];
    }
    return FMCPRNDL_SECOND;
}

+(FMCPRNDL*) THIRD {
    if (FMCPRNDL_THIRD == nil) {
        FMCPRNDL_THIRD = [[FMCPRNDL alloc] initWithValue:@"THIRD"];
    }
    return FMCPRNDL_THIRD;
}

+(FMCPRNDL*) FOURTH {
    if (FMCPRNDL_FOURTH == nil) {
        FMCPRNDL_FOURTH = [[FMCPRNDL alloc] initWithValue:@"FOURTH"];
    }
    return FMCPRNDL_FOURTH;
}

+(FMCPRNDL*) FIFTH {
    if (FMCPRNDL_FIFTH == nil) {
        FMCPRNDL_FIFTH = [[FMCPRNDL alloc] initWithValue:@"FIFTH"];
    }
    return FMCPRNDL_FIFTH;
}

+(FMCPRNDL*) SIXTH {
    if (FMCPRNDL_SIXTH == nil) {
        FMCPRNDL_SIXTH = [[FMCPRNDL alloc] initWithValue:@"SIXTH"];
    }
    return FMCPRNDL_SIXTH;
}

+(FMCPRNDL*) SEVENTH {
    if (FMCPRNDL_SEVENTH == nil) {
        FMCPRNDL_SEVENTH = [[FMCPRNDL alloc] initWithValue:@"SEVENTH"];
    }
    return FMCPRNDL_SEVENTH;
}

+(FMCPRNDL*) EIGHTH {
    if (FMCPRNDL_EIGHTH == nil) {
        FMCPRNDL_EIGHTH = [[FMCPRNDL alloc] initWithValue:@"EIGHTH"];
    }
    return FMCPRNDL_EIGHTH;
}

+(FMCPRNDL*) UNKNOWN {
    if (FMCPRNDL_UNKNOWN == nil) {
        FMCPRNDL_UNKNOWN = [[FMCPRNDL alloc] initWithValue:@"UNKNOWN"];
    }
    return FMCPRNDL_UNKNOWN;
}

+(FMCPRNDL*) FAULT {
    if (FMCPRNDL_FAULT == nil) {
        FMCPRNDL_FAULT = [[FMCPRNDL alloc] initWithValue:@"FAULT"];
    }
    return FMCPRNDL_FAULT;
}

@end
