//  FMCVehicleDataResultCode.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCVehicleDataResultCode.h>   

FMCVehicleDataResultCode* FMCVehicleDataResultCode_SUCCESS = nil;
FMCVehicleDataResultCode* FMCVehicleDataResultCode_DISALLOWED = nil;
FMCVehicleDataResultCode* FMCVehicleDataResultCode_USER_DISALLOWED = nil;
FMCVehicleDataResultCode* FMCVehicleDataResultCode_INVALID_ID = nil;
FMCVehicleDataResultCode* FMCVehicleDataResultCode_VEHICLE_DATA_NOT_AVAILABLE = nil;
FMCVehicleDataResultCode* FMCVehicleDataResultCode_DATA_ALREADY_SUBSCRIBED = nil;
FMCVehicleDataResultCode* FMCVehicleDataResultCode_DATA_NOT_SUBSCRIBED = nil;
FMCVehicleDataResultCode* FMCVehicleDataResultCode_IGNORED = nil;

NSMutableArray* FMCVehicleDataResultCode_values = nil; 

@implementation FMCVehicleDataResultCode

+(FMCVehicleDataResultCode*) valueOf:(NSString*) value {                       
	for (FMCVehicleDataResultCode* item in FMCVehicleDataResultCode.values) {    
		if ([item.value isEqualToString:value]) { 
			return item; 
		} 
	} 
	return nil; 
}

+(NSMutableArray *) values {           
	if (FMCVehicleDataResultCode_values == nil) {                               
		FMCVehicleDataResultCode_values = [[NSMutableArray alloc] initWithObjects: 
                                    FMCVehicleDataResultCode.SUCCESS,
                                    FMCVehicleDataResultCode.DISALLOWED,
                                    FMCVehicleDataResultCode.USER_DISALLOWED,
                                    FMCVehicleDataResultCode.INVALID_ID,
                                    FMCVehicleDataResultCode.VEHICLE_DATA_NOT_AVAILABLE,
                                    FMCVehicleDataResultCode.DATA_ALREADY_SUBSCRIBED,
                                    FMCVehicleDataResultCode.DATA_NOT_SUBSCRIBED,
                                    FMCVehicleDataResultCode.IGNORED,
									nil];
	} 
	return FMCVehicleDataResultCode_values; 
}

+(FMCVehicleDataResultCode*) SUCCESS {                                                                        	
	if (FMCVehicleDataResultCode_SUCCESS == nil) {
		FMCVehicleDataResultCode_SUCCESS = [[FMCVehicleDataResultCode alloc] initWithValue:@"SUCCESS"];
	} 
	return FMCVehicleDataResultCode_SUCCESS;  
}

+(FMCVehicleDataResultCode*) DISALLOWED {
	if (FMCVehicleDataResultCode_DISALLOWED == nil) {
		FMCVehicleDataResultCode_DISALLOWED = [[FMCVehicleDataResultCode alloc] initWithValue:@"DISALLOWED"];
	}
	return FMCVehicleDataResultCode_DISALLOWED;
}

+(FMCVehicleDataResultCode*) USER_DISALLOWED {
	if (FMCVehicleDataResultCode_USER_DISALLOWED == nil) {
		FMCVehicleDataResultCode_USER_DISALLOWED = [[FMCVehicleDataResultCode alloc] initWithValue:@"USER_DISALLOWED"];
	}
	return FMCVehicleDataResultCode_USER_DISALLOWED;
}

+(FMCVehicleDataResultCode*) INVALID_ID {
	if (FMCVehicleDataResultCode_INVALID_ID == nil) {
		FMCVehicleDataResultCode_INVALID_ID = [[FMCVehicleDataResultCode alloc] initWithValue:@"INVALID_ID"];
	}
	return FMCVehicleDataResultCode_INVALID_ID;
}

+(FMCVehicleDataResultCode*) VEHICLE_DATA_NOT_AVAILABLE {
	if (FMCVehicleDataResultCode_VEHICLE_DATA_NOT_AVAILABLE == nil) {
		FMCVehicleDataResultCode_VEHICLE_DATA_NOT_AVAILABLE = [[FMCVehicleDataResultCode alloc] initWithValue:@"VEHICLE_DATA_NOT_AVAILABLE"];
	}
	return FMCVehicleDataResultCode_VEHICLE_DATA_NOT_AVAILABLE;
}

+(FMCVehicleDataResultCode*) DATA_ALREADY_SUBSCRIBED {
	if (FMCVehicleDataResultCode_DATA_ALREADY_SUBSCRIBED == nil) {
		FMCVehicleDataResultCode_DATA_ALREADY_SUBSCRIBED = [[FMCVehicleDataResultCode alloc] initWithValue:@"DATA_ALREADY_SUBSCRIBED"];
	}
	return FMCVehicleDataResultCode_DATA_ALREADY_SUBSCRIBED;
}

+(FMCVehicleDataResultCode*) DATA_NOT_SUBSCRIBED {
	if (FMCVehicleDataResultCode_DATA_NOT_SUBSCRIBED == nil) {
		FMCVehicleDataResultCode_DATA_NOT_SUBSCRIBED = [[FMCVehicleDataResultCode alloc] initWithValue:@"DATA_NOT_SUBSCRIBED"];
	}
	return FMCVehicleDataResultCode_DATA_NOT_SUBSCRIBED;
}

+(FMCVehicleDataResultCode*) IGNORED {
	if (FMCVehicleDataResultCode_IGNORED == nil) {
		FMCVehicleDataResultCode_IGNORED = [[FMCVehicleDataResultCode alloc] initWithValue:@"IGNORED"];
	}
	return FMCVehicleDataResultCode_IGNORED;
}

@end


