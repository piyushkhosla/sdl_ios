//  FMCVehicleDataEventStatus.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCVehicleDataEventStatus.h>   

FMCVehicleDataEventStatus* FMCVehicleDataEventStatus_NO_EVENT = nil;
FMCVehicleDataEventStatus* FMCVehicleDataEventStatus_NO = nil;
FMCVehicleDataEventStatus* FMCVehicleDataEventStatus_YES = nil;
FMCVehicleDataEventStatus* FMCVehicleDataEventStatus_NOT_SUPPORTED = nil;
FMCVehicleDataEventStatus* FMCVehicleDataEventStatus_FAULT = nil;

NSMutableArray* FMCVehicleDataEventStatus_values = nil; 

@implementation FMCVehicleDataEventStatus

+(FMCVehicleDataEventStatus*) valueOf:(NSString*) value {                       
	for (FMCVehicleDataEventStatus* item in FMCVehicleDataEventStatus.values) {    
		if ([item.value isEqualToString:value]) { 
			return item; 
		} 
	} 
	return nil; 
}

+(NSMutableArray *) values {           
	if (FMCVehicleDataEventStatus_values == nil) {                               
		FMCVehicleDataEventStatus_values = [[NSMutableArray alloc] initWithObjects: 
                                    FMCVehicleDataEventStatus.NO_EVENT,
                                    FMCVehicleDataEventStatus._NO,
                                    FMCVehicleDataEventStatus._YES,
                                    FMCVehicleDataEventStatus.NOT_SUPPORTED,
                                    FMCVehicleDataEventStatus.FAULT,
									nil];
	} 
	return FMCVehicleDataEventStatus_values; 
}

+(FMCVehicleDataEventStatus*) NO_EVENT {
	if (FMCVehicleDataEventStatus_NO_EVENT == nil) {
		FMCVehicleDataEventStatus_NO_EVENT = [[FMCVehicleDataEventStatus alloc] initWithValue:@"NO_EVENT"];
	} 
	return FMCVehicleDataEventStatus_NO_EVENT;  
}

+(FMCVehicleDataEventStatus*) _NO {
	if (FMCVehicleDataEventStatus_NO == nil) {
		FMCVehicleDataEventStatus_NO = [[FMCVehicleDataEventStatus alloc] initWithValue:@"NO"];
	}
	return FMCVehicleDataEventStatus_NO;
}

+(FMCVehicleDataEventStatus*) _YES {
	if (FMCVehicleDataEventStatus_YES == nil) {
		FMCVehicleDataEventStatus_YES = [[FMCVehicleDataEventStatus alloc] initWithValue:@"YES"];
	}
	return FMCVehicleDataEventStatus_YES;
}

+(FMCVehicleDataEventStatus*) NOT_SUPPORTED {
	if (FMCVehicleDataEventStatus_NOT_SUPPORTED == nil) {
		FMCVehicleDataEventStatus_NOT_SUPPORTED = [[FMCVehicleDataEventStatus alloc] initWithValue:@"NOT_SUPPORTED"];
	}
	return FMCVehicleDataEventStatus_NOT_SUPPORTED;
}

+(FMCVehicleDataEventStatus*) FAULT {
	if (FMCVehicleDataEventStatus_FAULT == nil) {
		FMCVehicleDataEventStatus_FAULT = [[FMCVehicleDataEventStatus alloc] initWithValue:@"FAULT"];
	}
	return FMCVehicleDataEventStatus_FAULT;
}

@end

