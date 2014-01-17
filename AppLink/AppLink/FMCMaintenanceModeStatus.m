//  FMCMaintenanceModeStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCMaintenanceModeStatus.h>

FMCMaintenanceModeStatus* FMCMaintenanceModeStatus_NORMAL = nil;
FMCMaintenanceModeStatus* FMCMaintenanceModeStatus_NEAR = nil;
FMCMaintenanceModeStatus* FMCMaintenanceModeStatus_ACTIVE = nil;
FMCMaintenanceModeStatus* FMCMaintenanceModeStatus_FEATURE_NOT_PRESENT = nil;

NSMutableArray* FMCMaintenanceModeStatus_values = nil; 

@implementation FMCMaintenanceModeStatus

+(FMCMaintenanceModeStatus*) valueOf:(NSString*) value {                       
	for (FMCMaintenanceModeStatus* item in FMCMaintenanceModeStatus.values) {    
		if ([item.value isEqualToString:value]) { 
			return item; 
		} 
	} 
	return nil; 
}

+(NSMutableArray *) values {           
	if (FMCMaintenanceModeStatus_values == nil) {                               
		FMCMaintenanceModeStatus_values = [[NSMutableArray alloc] initWithObjects: 
                                    FMCMaintenanceModeStatus.NORMAL,
                                    FMCMaintenanceModeStatus.NEAR,
                                    FMCMaintenanceModeStatus.ACTIVE,
                                    FMCMaintenanceModeStatus.FEATURE_NOT_PRESENT,
									nil];
	} 
	return FMCMaintenanceModeStatus_values; 
}

+(FMCMaintenanceModeStatus*) NORMAL {
	if (FMCMaintenanceModeStatus_NORMAL == nil) {
		FMCMaintenanceModeStatus_NORMAL = [[FMCMaintenanceModeStatus alloc] initWithValue:@"NORMAL"];
	} 
	return FMCMaintenanceModeStatus_NORMAL;  
}

+(FMCMaintenanceModeStatus*) NEAR {
	if (FMCMaintenanceModeStatus_NEAR == nil) {
		FMCMaintenanceModeStatus_NEAR = [[FMCMaintenanceModeStatus alloc] initWithValue:@"NEAR"];
	}
	return FMCMaintenanceModeStatus_NEAR;
}

+(FMCMaintenanceModeStatus*) ACTIVE {
	if (FMCMaintenanceModeStatus_ACTIVE == nil) {
		FMCMaintenanceModeStatus_ACTIVE = [[FMCMaintenanceModeStatus alloc] initWithValue:@"ACTIVE"];
	}
	return FMCMaintenanceModeStatus_ACTIVE;
}

+(FMCMaintenanceModeStatus*) FEATURE_NOT_PRESENT {
	if (FMCMaintenanceModeStatus_FEATURE_NOT_PRESENT == nil) {
		FMCMaintenanceModeStatus_FEATURE_NOT_PRESENT = [[FMCMaintenanceModeStatus alloc] initWithValue:@"FEATURE_NOT_PRESENT"];
	}
	return FMCMaintenanceModeStatus_FEATURE_NOT_PRESENT;
}

@end


