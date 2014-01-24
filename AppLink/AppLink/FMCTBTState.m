//  FMCTBTState.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCTBTState.h>   

FMCTBTState* FMCTBTState_ROUTE_UPDATE_REQUEST = nil;    
FMCTBTState* FMCTBTState_ROUTE_ACCEPTED = nil;
FMCTBTState* FMCTBTState_ROUTE_REFUSED = nil;    
FMCTBTState* FMCTBTState_ROUTE_CANCELLED = nil;
FMCTBTState* FMCTBTState_ETA_REQUEST = nil;
FMCTBTState* FMCTBTState_NEXT_TURN_REQUEST = nil;
FMCTBTState* FMCTBTState_ROUTE_STATUS_REQUEST = nil;
FMCTBTState* FMCTBTState_ROUTE_SUMMARY_REQUEST = nil;
FMCTBTState* FMCTBTState_TRIP_STATUS_REQUEST = nil;
FMCTBTState* FMCTBTState_ROUTE_UPDATE_REQUEST_TIMEOUT = nil;
NSMutableArray* FMCTBTState_values = nil; 

@implementation FMCTBTState

+(FMCTBTState*) valueOf:(NSString*) value {                       
	for (FMCTBTState* item in FMCTBTState.values) {    
		if ([item.value isEqualToString:value]) { 
			return item; 
		} 
	} 
	return nil; 
}

+(NSMutableArray *) values {           
	if (FMCTBTState_values == nil) {                               
		FMCTBTState_values = [[NSMutableArray alloc] initWithObjects: 
									FMCTBTState.ROUTE_UPDATE_REQUEST,   
									FMCTBTState.ROUTE_ACCEPTED, 
									FMCTBTState.ROUTE_REFUSED,     
									FMCTBTState.ROUTE_CANCELLED, 
                                    FMCTBTState_ETA_REQUEST,
                                    FMCTBTState_NEXT_TURN_REQUEST,
                                    FMCTBTState_ROUTE_STATUS_REQUEST,
                                    FMCTBTState_ROUTE_SUMMARY_REQUEST,
                                    FMCTBTState_TRIP_STATUS_REQUEST,
                                    FMCTBTState_ROUTE_UPDATE_REQUEST_TIMEOUT,
									nil];                        
	} 
	return FMCTBTState_values; 
}

+(FMCTBTState*) ROUTE_UPDATE_REQUEST {                                                                        	
	if (FMCTBTState_ROUTE_UPDATE_REQUEST == nil) {
		FMCTBTState_ROUTE_UPDATE_REQUEST = [[FMCTBTState alloc] initWithValue:@"ROUTE_UPDATE_REQUEST"];
	} 
	return FMCTBTState_ROUTE_UPDATE_REQUEST;  
}

+(FMCTBTState*) ROUTE_ACCEPTED {                                                                        	
	if (FMCTBTState_ROUTE_ACCEPTED == nil) {  
		FMCTBTState_ROUTE_ACCEPTED = [[FMCTBTState alloc] initWithValue:@"ROUTE_ACCEPTED"]; 
	} 
	return FMCTBTState_ROUTE_ACCEPTED;    
}

+(FMCTBTState*) ROUTE_REFUSED {                                                                        	
	if (FMCTBTState_ROUTE_REFUSED == nil) {   
		FMCTBTState_ROUTE_REFUSED = [[FMCTBTState alloc] initWithValue:@"ROUTE_REFUSED"];
	} 
	return FMCTBTState_ROUTE_REFUSED;
}

+(FMCTBTState*) ROUTE_CANCELLED {                                                                        	
	if (FMCTBTState_ROUTE_CANCELLED  == nil) {
		FMCTBTState_ROUTE_CANCELLED  = [[FMCTBTState alloc] initWithValue:@"ROUTE_CANCELLED "];
	} 
	return FMCTBTState_ROUTE_CANCELLED;  
}

+(FMCTBTState*) ETA_REQUEST {
	if (FMCTBTState_ETA_REQUEST  == nil) {
		FMCTBTState_ETA_REQUEST  = [[FMCTBTState alloc] initWithValue:@"ETA_REQUEST "];
	}
	return FMCTBTState_ETA_REQUEST;
}
+(FMCTBTState*) NEXT_TURN_REQUEST {
	if (FMCTBTState_NEXT_TURN_REQUEST  == nil) {
		FMCTBTState_NEXT_TURN_REQUEST  = [[FMCTBTState alloc] initWithValue:@"NEXT_TURN_REQUEST "];
	}
	return FMCTBTState_NEXT_TURN_REQUEST;
}
+(FMCTBTState*) ROUTE_STATUS_REQUEST {
	if (FMCTBTState_ROUTE_STATUS_REQUEST  == nil) {
		FMCTBTState_ROUTE_STATUS_REQUEST  = [[FMCTBTState alloc] initWithValue:@"ROUTE_STATUS_REQUEST "];
	}
	return FMCTBTState_ROUTE_STATUS_REQUEST;
}
+(FMCTBTState*) ROUTE_SUMMARY_REQUEST {
	if (FMCTBTState_ROUTE_SUMMARY_REQUEST  == nil) {
		FMCTBTState_ROUTE_SUMMARY_REQUEST  = [[FMCTBTState alloc] initWithValue:@"ROUTE_SUMMARY_REQUEST "];
	}
	return FMCTBTState_ROUTE_SUMMARY_REQUEST;
}
+(FMCTBTState*) TRIP_STATUS_REQUEST {
	if (FMCTBTState_TRIP_STATUS_REQUEST  == nil) {
		FMCTBTState_TRIP_STATUS_REQUEST  = [[FMCTBTState alloc] initWithValue:@"TRIP_STATUS_REQUEST "];
	}
	return FMCTBTState_TRIP_STATUS_REQUEST;
}
+(FMCTBTState*) ROUTE_UPDATE_REQUEST_TIMEOUT {
	if (FMCTBTState_ROUTE_UPDATE_REQUEST_TIMEOUT  == nil) {
		FMCTBTState_ROUTE_UPDATE_REQUEST_TIMEOUT  = [[FMCTBTState alloc] initWithValue:@"ROUTE_UPDATE_REQUEST_TIMEOUT "];
	}
	return FMCTBTState_ROUTE_UPDATE_REQUEST_TIMEOUT;
}

@end


