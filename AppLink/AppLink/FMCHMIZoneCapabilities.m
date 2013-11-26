//  FMCHMIZoneCapabilities.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCHMIZoneCapabilities.h>

FMCHMIZoneCapabilities* FMCHMIZoneCapabilities_FRONT = nil;
FMCHMIZoneCapabilities* FMCHMIZoneCapabilities_BACK = nil;

NSMutableArray* FMCHMIZoneCapabilities_values = nil;
@implementation FMCHMIZoneCapabilities

+(FMCHMIZoneCapabilities*) valueOf:(NSString*) value {
    for (FMCHMIZoneCapabilities* item in FMCHMIZoneCapabilities.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCHMIZoneCapabilities_values == nil) {
        FMCHMIZoneCapabilities_values = [[NSMutableArray alloc] initWithObjects:
                FMCHMIZoneCapabilities.FRONT,
                FMCHMIZoneCapabilities.BACK,
                nil];
    }
    return FMCHMIZoneCapabilities_values;
}

+(FMCHMIZoneCapabilities*) FRONT {
    	if (FMCHMIZoneCapabilities_FRONT == nil) {
        		FMCHMIZoneCapabilities_FRONT = [[FMCHMIZoneCapabilities alloc] initWithValue:@"FRONT"];
    	}
    	return FMCHMIZoneCapabilities_FRONT;
}

+(FMCHMIZoneCapabilities*) BACK {
    	if (FMCHMIZoneCapabilities_BACK == nil) {
        		FMCHMIZoneCapabilities_BACK = [[FMCHMIZoneCapabilities alloc] initWithValue:@"BACK"];
    	}
    	return FMCHMIZoneCapabilities_BACK;
}

@end
