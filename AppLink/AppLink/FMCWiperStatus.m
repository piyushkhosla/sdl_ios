//  FMCWiperStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCWiperStatus.h>

FMCWiperStatus* FMCWiperStatus_OFF = nil;
FMCWiperStatus* FMCWiperStatus_AUTO_OFF = nil;
FMCWiperStatus* FMCWiperStatus_OFF_MOVING = nil;
FMCWiperStatus* FMCWiperStatus_MAN_INT_OFF = nil;
FMCWiperStatus* FMCWiperStatus_MAN_INT_ON = nil;
FMCWiperStatus* FMCWiperStatus_MAN_LOW = nil;
FMCWiperStatus* FMCWiperStatus_MAN_HIGH = nil;
FMCWiperStatus* FMCWiperStatus_MAN_FLICK = nil;
FMCWiperStatus* FMCWiperStatus_WASH = nil;
FMCWiperStatus* FMCWiperStatus_AUTO_LOW = nil;
FMCWiperStatus* FMCWiperStatus_AUTO_HIGH = nil;
FMCWiperStatus* FMCWiperStatus_COURTESYWIPE = nil;
FMCWiperStatus* FMCWiperStatus_AUTO_ADJUST = nil;
FMCWiperStatus* FMCWiperStatus_STALLED = nil;
FMCWiperStatus* FMCWiperStatus_NO_DATA_EXISTS = nil;

NSMutableArray* FMCWiperStatus_values = nil;

@implementation FMCWiperStatus

+(FMCWiperStatus*) valueOf:(NSString*) value {
    for (FMCWiperStatus* item in FMCWiperStatus.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCWiperStatus_values == nil) {
        FMCWiperStatus_values = [[NSMutableArray alloc] initWithObjects:
                FMCWiperStatus.OFF,
                FMCWiperStatus.AUTO_OFF,
                FMCWiperStatus.OFF_MOVING,
                FMCWiperStatus.MAN_INT_OFF,
                FMCWiperStatus.MAN_INT_ON,
                FMCWiperStatus.MAN_LOW,
                FMCWiperStatus.MAN_HIGH,
                FMCWiperStatus.MAN_FLICK,
                FMCWiperStatus.WASH,
                FMCWiperStatus.AUTO_LOW,
                FMCWiperStatus.AUTO_HIGH,
                FMCWiperStatus.COURTESYWIPE,
                FMCWiperStatus.AUTO_ADJUST,
                FMCWiperStatus.STALLED,
                FMCWiperStatus.NO_DATA_EXISTS,
                nil];
    }
    return FMCWiperStatus_values;
}

+(FMCWiperStatus*) OFF {
    if (FMCWiperStatus_OFF == nil) {
        FMCWiperStatus_OFF = [[FMCWiperStatus alloc] initWithValue:@"OFF"];
    }
    return FMCWiperStatus_OFF;
}

+(FMCWiperStatus*) AUTO_OFF {
    if (FMCWiperStatus_AUTO_OFF == nil) {
        FMCWiperStatus_AUTO_OFF = [[FMCWiperStatus alloc] initWithValue:@"AUTO_OFF"];
    }
    return FMCWiperStatus_AUTO_OFF;
}

+(FMCWiperStatus*) OFF_MOVING {
    if (FMCWiperStatus_OFF_MOVING == nil) {
        FMCWiperStatus_OFF_MOVING = [[FMCWiperStatus alloc] initWithValue:@"OFF_MOVING"];
    }
    return FMCWiperStatus_OFF_MOVING;
}

+(FMCWiperStatus*) MAN_INT_OFF {
    if (FMCWiperStatus_MAN_INT_OFF == nil) {
        FMCWiperStatus_MAN_INT_OFF = [[FMCWiperStatus alloc] initWithValue:@"MAN_INT_OFF"];
    }
    return FMCWiperStatus_MAN_INT_OFF;
}

+(FMCWiperStatus*) MAN_INT_ON {
    if (FMCWiperStatus_MAN_INT_ON == nil) {
        FMCWiperStatus_MAN_INT_ON = [[FMCWiperStatus alloc] initWithValue:@"MAN_INT_ON"];
    }
    return FMCWiperStatus_MAN_INT_ON;
}

+(FMCWiperStatus*) MAN_LOW {
    if (FMCWiperStatus_MAN_LOW == nil) {
        FMCWiperStatus_MAN_LOW = [[FMCWiperStatus alloc] initWithValue:@"MAN_LOW"];
    }
    return FMCWiperStatus_MAN_LOW;
}

+(FMCWiperStatus*) MAN_HIGH {
    if (FMCWiperStatus_MAN_HIGH == nil) {
        FMCWiperStatus_MAN_HIGH = [[FMCWiperStatus alloc] initWithValue:@"MAN_HIGH"];
    }
    return FMCWiperStatus_MAN_HIGH;
}

+(FMCWiperStatus*) MAN_FLICK {
    if (FMCWiperStatus_MAN_FLICK == nil) {
        FMCWiperStatus_MAN_FLICK = [[FMCWiperStatus alloc] initWithValue:@"MAN_FLICK"];
    }
    return FMCWiperStatus_MAN_FLICK;
}

+(FMCWiperStatus*) WASH {
    if (FMCWiperStatus_WASH == nil) {
        FMCWiperStatus_WASH = [[FMCWiperStatus alloc] initWithValue:@"WASH"];
    }
    return FMCWiperStatus_WASH;
}

+(FMCWiperStatus*) AUTO_LOW {
    if (FMCWiperStatus_AUTO_LOW == nil) {
        FMCWiperStatus_AUTO_LOW = [[FMCWiperStatus alloc] initWithValue:@"AUTO_LOW"];
    }
    return FMCWiperStatus_AUTO_LOW;
}

+(FMCWiperStatus*) AUTO_HIGH {
    if (FMCWiperStatus_AUTO_HIGH == nil) {
        FMCWiperStatus_AUTO_HIGH = [[FMCWiperStatus alloc] initWithValue:@"AUTO_HIGH"];
    }
    return FMCWiperStatus_AUTO_HIGH;
}

+(FMCWiperStatus*) COURTESYWIPE {
    if (FMCWiperStatus_COURTESYWIPE == nil) {
        FMCWiperStatus_COURTESYWIPE = [[FMCWiperStatus alloc] initWithValue:@"COURTESYWIPE"];
    }
    return FMCWiperStatus_COURTESYWIPE;
}

+(FMCWiperStatus*) AUTO_ADJUST {
    if (FMCWiperStatus_AUTO_ADJUST == nil) {
        FMCWiperStatus_AUTO_ADJUST = [[FMCWiperStatus alloc] initWithValue:@"AUTO_ADJUST"];
    }
    return FMCWiperStatus_AUTO_ADJUST;
}

+(FMCWiperStatus*) STALLED {
    if (FMCWiperStatus_STALLED == nil) {
        FMCWiperStatus_STALLED = [[FMCWiperStatus alloc] initWithValue:@"STALLED"];
    }
    return FMCWiperStatus_STALLED;
}

+(FMCWiperStatus*) NO_DATA_EXISTS {
    if (FMCWiperStatus_NO_DATA_EXISTS == nil) {
        FMCWiperStatus_NO_DATA_EXISTS = [[FMCWiperStatus alloc] initWithValue:@"NO_DATA_EXISTS"];
    }
    return FMCWiperStatus_NO_DATA_EXISTS;
}

@end
