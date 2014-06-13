//  FMCEmergencyEventType.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCEmergencyEventType.h>

FMCEmergencyEventType* FMCEmergencyEventType_NO_EVENT = nil;
FMCEmergencyEventType* FMCEmergencyEventType_FRONTAL = nil;
FMCEmergencyEventType* FMCEmergencyEventType_SIDE = nil;
FMCEmergencyEventType* FMCEmergencyEventType_REAR = nil;
FMCEmergencyEventType* FMCEmergencyEventType_ROLLOVER = nil;
FMCEmergencyEventType* FMCEmergencyEventType_NOT_SUPPORTED = nil;
FMCEmergencyEventType* FMCEmergencyEventType_FAULT = nil;

NSMutableArray* FMCEmergencyEventType_values = nil;

@implementation FMCEmergencyEventType

+(FMCEmergencyEventType*) valueOf:(NSString*) value {
    for (FMCEmergencyEventType* item in FMCEmergencyEventType.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCEmergencyEventType_values == nil) {
        FMCEmergencyEventType_values = [[NSMutableArray alloc] initWithObjects:
                FMCEmergencyEventType.NO_EVENT,
                FMCEmergencyEventType.FRONTAL,
                FMCEmergencyEventType.SIDE,
                FMCEmergencyEventType.REAR,
                FMCEmergencyEventType.ROLLOVER,
                FMCEmergencyEventType.NOT_SUPPORTED,
                FMCEmergencyEventType.FAULT,
                nil];
    }
    return FMCEmergencyEventType_values;
}

+(FMCEmergencyEventType*) NO_EVENT {
    if (FMCEmergencyEventType_NO_EVENT == nil) {
        FMCEmergencyEventType_NO_EVENT = [[FMCEmergencyEventType alloc] initWithValue:@"NO_EVENT"];
    }
    return FMCEmergencyEventType_NO_EVENT;
}

+(FMCEmergencyEventType*) FRONTAL {
    if (FMCEmergencyEventType_FRONTAL == nil) {
        FMCEmergencyEventType_FRONTAL = [[FMCEmergencyEventType alloc] initWithValue:@"FRONTAL"];
    }
    return FMCEmergencyEventType_FRONTAL;
}

+(FMCEmergencyEventType*) SIDE {
    if (FMCEmergencyEventType_SIDE == nil) {
        FMCEmergencyEventType_SIDE = [[FMCEmergencyEventType alloc] initWithValue:@"SIDE"];
    }
    return FMCEmergencyEventType_SIDE;
}

+(FMCEmergencyEventType*) REAR {
    if (FMCEmergencyEventType_REAR == nil) {
        FMCEmergencyEventType_REAR = [[FMCEmergencyEventType alloc] initWithValue:@"REAR"];
    }
    return FMCEmergencyEventType_REAR;
}

+(FMCEmergencyEventType*) ROLLOVER {
    if (FMCEmergencyEventType_ROLLOVER == nil) {
        FMCEmergencyEventType_ROLLOVER = [[FMCEmergencyEventType alloc] initWithValue:@"ROLLOVER"];
    }
    return FMCEmergencyEventType_ROLLOVER;
}

+(FMCEmergencyEventType*) NOT_SUPPORTED {
    if (FMCEmergencyEventType_NOT_SUPPORTED == nil) {
        FMCEmergencyEventType_NOT_SUPPORTED = [[FMCEmergencyEventType alloc] initWithValue:@"NOT_SUPPORTED"];
    }
    return FMCEmergencyEventType_NOT_SUPPORTED;
}

+(FMCEmergencyEventType*) FAULT {
    if (FMCEmergencyEventType_FAULT == nil) {
        FMCEmergencyEventType_FAULT = [[FMCEmergencyEventType alloc] initWithValue:@"FAULT"];
    }
    return FMCEmergencyEventType_FAULT;
}

@end
