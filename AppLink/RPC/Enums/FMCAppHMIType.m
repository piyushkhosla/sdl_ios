//  FMCAppHMIType.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Enums/FMCAppHMIType.h>

FMCAppHMIType* FMCAppHMIType_DEFAULT = nil;
FMCAppHMIType* FMCAppHMIType_COMMUNICATION = nil;
FMCAppHMIType* FMCAppHMIType_MEDIA = nil;
FMCAppHMIType* FMCAppHMIType_MESSAGING = nil;
FMCAppHMIType* FMCAppHMIType_NAVIGATION = nil;
FMCAppHMIType* FMCAppHMIType_INFORMATION = nil;
FMCAppHMIType* FMCAppHMIType_SOCIAL = nil;
FMCAppHMIType* FMCAppHMIType_BACKGROUND_PROCESS = nil;
FMCAppHMIType* FMCAppHMIType_TESTING = nil;
FMCAppHMIType* FMCAppHMIType_SYSTEM = nil;

NSMutableArray* FMCAppHMIType_values = nil;

@implementation FMCAppHMIType

+(FMCAppHMIType*) valueOf:(NSString*) value {
    for (FMCAppHMIType* item in FMCAppHMIType.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCAppHMIType_values == nil) {
        FMCAppHMIType_values = [[NSMutableArray alloc] initWithObjects:
                FMCAppHMIType.DEFAULT,
                FMCAppHMIType.COMMUNICATION,
                FMCAppHMIType.MEDIA,
                FMCAppHMIType.MESSAGING,
                FMCAppHMIType.NAVIGATION,
                FMCAppHMIType.INFORMATION,
                FMCAppHMIType.SOCIAL,
                FMCAppHMIType.BACKGROUND_PROCESS,
                FMCAppHMIType.TESTING,
                FMCAppHMIType.SYSTEM,
                nil];
    }
    return FMCAppHMIType_values;
}

+(FMCAppHMIType*) DEFAULT {
    if (FMCAppHMIType_DEFAULT == nil) {
        FMCAppHMIType_DEFAULT = [[FMCAppHMIType alloc] initWithValue:@"DEFAULT"];
    }
    return FMCAppHMIType_DEFAULT;
}

+(FMCAppHMIType*) COMMUNICATION {
    if (FMCAppHMIType_COMMUNICATION == nil) {
        FMCAppHMIType_COMMUNICATION = [[FMCAppHMIType alloc] initWithValue:@"COMMUNICATION"];
    }
    return FMCAppHMIType_COMMUNICATION;
}

+(FMCAppHMIType*) MEDIA {
    if (FMCAppHMIType_MEDIA == nil) {
        FMCAppHMIType_MEDIA = [[FMCAppHMIType alloc] initWithValue:@"MEDIA"];
    }
    return FMCAppHMIType_MEDIA;
}

+(FMCAppHMIType*) MESSAGING {
    if (FMCAppHMIType_MESSAGING == nil) {
        FMCAppHMIType_MESSAGING = [[FMCAppHMIType alloc] initWithValue:@"MESSAGING"];
    }
    return FMCAppHMIType_MESSAGING;
}

+(FMCAppHMIType*) NAVIGATION {
    if (FMCAppHMIType_NAVIGATION == nil) {
        FMCAppHMIType_NAVIGATION = [[FMCAppHMIType alloc] initWithValue:@"NAVIGATION"];
    }
    return FMCAppHMIType_NAVIGATION;
}

+(FMCAppHMIType*) INFORMATION {
    if (FMCAppHMIType_INFORMATION == nil) {
        FMCAppHMIType_INFORMATION = [[FMCAppHMIType alloc] initWithValue:@"INFORMATION"];
    }
    return FMCAppHMIType_INFORMATION;
}

+(FMCAppHMIType*) SOCIAL {
    if (FMCAppHMIType_SOCIAL == nil) {
        FMCAppHMIType_SOCIAL = [[FMCAppHMIType alloc] initWithValue:@"SOCIAL"];
    }
    return FMCAppHMIType_SOCIAL;
}

+(FMCAppHMIType*) BACKGROUND_PROCESS {
    if (FMCAppHMIType_BACKGROUND_PROCESS == nil) {
        FMCAppHMIType_BACKGROUND_PROCESS = [[FMCAppHMIType alloc] initWithValue:@"BACKGROUND_PROCESS"];
    }
    return FMCAppHMIType_BACKGROUND_PROCESS;
}

+(FMCAppHMIType*) TESTING {
    if (FMCAppHMIType_TESTING == nil) {
        FMCAppHMIType_TESTING = [[FMCAppHMIType alloc] initWithValue:@"TESTING"];
    }
    return FMCAppHMIType_TESTING;
}

+(FMCAppHMIType*) SYSTEM {
    if (FMCAppHMIType_SYSTEM == nil) {
        FMCAppHMIType_SYSTEM = [[FMCAppHMIType alloc] initWithValue:@"SYSTEM"];
    }
    return FMCAppHMIType_SYSTEM;
}

@end
