//  FMCVehicleDataStatus.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCVehicleDataStatus.h>

FMCVehicleDataStatus* FMCVehicleDataStatus_NO_DATA_EXISTS = nil;
FMCVehicleDataStatus* FMCVehicleDataStatus_OFF = nil;
FMCVehicleDataStatus* FMCVehicleDataStatus_ON = nil;

NSMutableArray* FMCVehicleDataStatus_values = nil; 

@implementation FMCVehicleDataStatus

+(FMCVehicleDataStatus*) valueOf:(NSString*) value {                       
	for (FMCVehicleDataStatus* item in FMCVehicleDataStatus.values) {    
		if ([item.value isEqualToString:value]) { 
			return item; 
		} 
	} 
	return nil; 
}

+(NSMutableArray *) values {           
	if (FMCVehicleDataStatus_values == nil) {                               
		FMCVehicleDataStatus_values = [[NSMutableArray alloc] initWithObjects: 
                                    FMCVehicleDataStatus.NO_DATA_EXISTS,
                                    FMCVehicleDataStatus.OFF,
                                    FMCVehicleDataStatus.ON,
									nil];
	} 
	return FMCVehicleDataStatus_values; 
}

+(FMCVehicleDataStatus*) NO_DATA_EXISTS {
	if (FMCVehicleDataStatus_NO_DATA_EXISTS == nil) {
		FMCVehicleDataStatus_NO_DATA_EXISTS = [[FMCVehicleDataStatus alloc] initWithValue:@"NO_DATA_EXISTS"];
	} 
	return FMCVehicleDataStatus_NO_DATA_EXISTS;  
}

+(FMCVehicleDataStatus*) OFF {
	if (FMCVehicleDataStatus_OFF == nil) {
		FMCVehicleDataStatus_OFF = [[FMCVehicleDataStatus alloc] initWithValue:@"OFF"];
	}
	return FMCVehicleDataStatus_OFF;
}

+(FMCVehicleDataStatus*) ON {
	if (FMCVehicleDataStatus_ON == nil) {
		FMCVehicleDataStatus_ON = [[FMCVehicleDataStatus alloc] initWithValue:@"ON"];
	}
	return FMCVehicleDataStatus_ON;
}

@end


