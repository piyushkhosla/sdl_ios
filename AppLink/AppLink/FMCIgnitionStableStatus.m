//  FMCIgnitionStableStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCIgnitionStableStatus.h>   

FMCIgnitionStableStatus* FMCIgnitionStableStatus_IGNITION_SWITCH_NOT_STABLE = nil;
FMCIgnitionStableStatus* FMCIgnitionStableStatus_IGNITION_SWITCH_STABLE = nil;
FMCIgnitionStableStatus* FMCIgnitionStableStatus_MISSING_FROM_TRANSMITTER = nil;

NSMutableArray* FMCIgnitionStableStatus_values = nil; 

@implementation FMCIgnitionStableStatus

+(FMCIgnitionStableStatus*) valueOf:(NSString*) value {                       
	for (FMCIgnitionStableStatus* item in FMCIgnitionStableStatus.values) {    
		if ([item.value isEqualToString:value]) { 
			return item; 
		} 
	} 
	return nil; 
}

+(NSMutableArray *) values {           
	if (FMCIgnitionStableStatus_values == nil) {                               
		FMCIgnitionStableStatus_values = [[NSMutableArray alloc] initWithObjects: 
                                    FMCIgnitionStableStatus.IGNITION_SWITCH_NOT_STABLE,
                                    FMCIgnitionStableStatus.IGNITION_SWITCH_STABLE,
                                    FMCIgnitionStableStatus.MISSING_FROM_TRANSMITTER,
									nil];                        
	} 
	return FMCIgnitionStableStatus_values; 
}

+(FMCIgnitionStableStatus*) IGNITION_SWITCH_NOT_STABLE {
	if (FMCIgnitionStableStatus_IGNITION_SWITCH_NOT_STABLE == nil) {
		FMCIgnitionStableStatus_IGNITION_SWITCH_NOT_STABLE = [[FMCIgnitionStableStatus alloc] initWithValue:@"IGNITION_SWITCH_NOT_STABLE"];
	} 
	return FMCIgnitionStableStatus_IGNITION_SWITCH_NOT_STABLE;  
}

+(FMCIgnitionStableStatus*) IGNITION_SWITCH_STABLE {
	if (FMCIgnitionStableStatus_IGNITION_SWITCH_STABLE == nil) {
		FMCIgnitionStableStatus_IGNITION_SWITCH_STABLE = [[FMCIgnitionStableStatus alloc] initWithValue:@"IGNITION_SWITCH_STABLE"];
	}
	return FMCIgnitionStableStatus_IGNITION_SWITCH_STABLE;
}

+(FMCIgnitionStableStatus*) MISSING_FROM_TRANSMITTER {
	if (FMCIgnitionStableStatus_MISSING_FROM_TRANSMITTER == nil) {
		FMCIgnitionStableStatus_MISSING_FROM_TRANSMITTER = [[FMCIgnitionStableStatus alloc] initWithValue:@"MISSING_FROM_TRANSMITTER"];
	}
	return FMCIgnitionStableStatus_MISSING_FROM_TRANSMITTER;
}

@end


