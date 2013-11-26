//  FMCVehicleDataNotificationStatus.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCVehicleDataNotificationStatus.h>   

FMCVehicleDataNotificationStatus* FMCVehicleDataNotificationStatus_NOT_SUPPORTED = nil;
FMCVehicleDataNotificationStatus* FMCVehicleDataNotificationStatus_NORMAL = nil;
FMCVehicleDataNotificationStatus* FMCVehicleDataNotificationStatus_ACTIVE = nil;

NSMutableArray* FMCVehicleDataNotificationStatus_values = nil; 

@implementation FMCVehicleDataNotificationStatus

+(FMCVehicleDataNotificationStatus*) valueOf:(NSString*) value {                       
	for (FMCVehicleDataNotificationStatus* item in FMCVehicleDataNotificationStatus.values) {    
		if ([item.value isEqualToString:value]) { 
			return item; 
		} 
	} 
	return nil; 
}

+(NSMutableArray *) values {           
	if (FMCVehicleDataNotificationStatus_values == nil) {                               
		FMCVehicleDataNotificationStatus_values = [[NSMutableArray alloc] initWithObjects: 
                                    FMCVehicleDataNotificationStatus.NOT_SUPPORTED,
                                    FMCVehicleDataNotificationStatus.NORMAL,
                                    FMCVehicleDataNotificationStatus.ACTIVE,
									nil];                        
	} 
	return FMCVehicleDataNotificationStatus_values; 
}

+(FMCVehicleDataNotificationStatus*) NOT_SUPPORTED {
	if (FMCVehicleDataNotificationStatus_NOT_SUPPORTED == nil) {
		FMCVehicleDataNotificationStatus_NOT_SUPPORTED = [[FMCVehicleDataNotificationStatus alloc] initWithValue:@"NOT_SUPPORTED"];
	} 
	return FMCVehicleDataNotificationStatus_NOT_SUPPORTED;  
}

+(FMCVehicleDataNotificationStatus*) NORMAL {
	if (FMCVehicleDataNotificationStatus_NORMAL == nil) {
		FMCVehicleDataNotificationStatus_NORMAL = [[FMCVehicleDataNotificationStatus alloc] initWithValue:@"NORMAL"];
	}
	return FMCVehicleDataNotificationStatus_NORMAL;
}

+(FMCVehicleDataNotificationStatus*) ACTIVE {
	if (FMCVehicleDataNotificationStatus_ACTIVE == nil) {
		FMCVehicleDataNotificationStatus_ACTIVE = [[FMCVehicleDataNotificationStatus alloc] initWithValue:@"ACTIVE"];
	}
	return FMCVehicleDataNotificationStatus_ACTIVE;
}

@end


