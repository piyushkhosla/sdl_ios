//  FMCCompassDirection.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCCompassDirection.h>   

FMCCompassDirection* FMCCompassDirection_NORTH = nil;
FMCCompassDirection* FMCCompassDirection_NORTHWEST = nil;
FMCCompassDirection* FMCCompassDirection_WEST = nil;
FMCCompassDirection* FMCCompassDirection_SOUTHWEST = nil;
FMCCompassDirection* FMCCompassDirection_SOUTH = nil;
FMCCompassDirection* FMCCompassDirection_SOUTHEAST = nil;
FMCCompassDirection* FMCCompassDirection_EAST = nil;
FMCCompassDirection* FMCCompassDirection_NORTHEAST = nil;

NSMutableArray* FMCCompassDirection_values = nil; 

@implementation FMCCompassDirection

+(FMCCompassDirection*) valueOf:(NSString*) value {                       
	for (FMCCompassDirection* item in FMCCompassDirection.values) {    
		if ([item.value isEqualToString:value]) { 
			return item; 
		} 
	} 
	return nil; 
}

+(NSMutableArray *) values {           
	if (FMCCompassDirection_values == nil) {                               
		FMCCompassDirection_values = [[NSMutableArray alloc] initWithObjects: 
                                    FMCCompassDirection.NORTH,
                                    FMCCompassDirection.NORTHWEST,
                                    FMCCompassDirection.WEST,
                                    FMCCompassDirection.SOUTHWEST,
                                    FMCCompassDirection.SOUTH,
                                    FMCCompassDirection.SOUTHEAST,
                                    FMCCompassDirection.EAST,
                                    FMCCompassDirection.NORTHEAST,
									nil];                        
	} 
	return FMCCompassDirection_values; 
}

+(FMCCompassDirection*) NORTH {                                                                        	
	if (FMCCompassDirection_NORTH == nil) {
		FMCCompassDirection_NORTH = [[FMCCompassDirection alloc] initWithValue:@"NORTH"];
	} 
	return FMCCompassDirection_NORTH;  
}

+(FMCCompassDirection*) NORTHWEST {
	if (FMCCompassDirection_NORTHWEST == nil) {
		FMCCompassDirection_NORTHWEST = [[FMCCompassDirection alloc] initWithValue:@"NORTHWEST"];
	}
	return FMCCompassDirection_NORTHWEST;
}

+(FMCCompassDirection*) WEST {
	if (FMCCompassDirection_WEST == nil) {
		FMCCompassDirection_WEST = [[FMCCompassDirection alloc] initWithValue:@"WEST"];
	}
	return FMCCompassDirection_WEST;
}

+(FMCCompassDirection*) SOUTHWEST {
	if (FMCCompassDirection_SOUTHWEST == nil) {
		FMCCompassDirection_SOUTHWEST = [[FMCCompassDirection alloc] initWithValue:@"SOUTHWEST"];
	}
	return FMCCompassDirection_SOUTHWEST;
}

+(FMCCompassDirection*) SOUTH {
	if (FMCCompassDirection_SOUTH == nil) {
		FMCCompassDirection_SOUTH = [[FMCCompassDirection alloc] initWithValue:@"SOUTH"];
	}
	return FMCCompassDirection_SOUTH;
}

+(FMCCompassDirection*) SOUTHEAST {
	if (FMCCompassDirection_SOUTHEAST == nil) {
		FMCCompassDirection_SOUTHEAST = [[FMCCompassDirection alloc] initWithValue:@"SOUTHEAST"];
	}
	return FMCCompassDirection_SOUTHEAST;
}

+(FMCCompassDirection*) EAST {
	if (FMCCompassDirection_EAST == nil) {
		FMCCompassDirection_EAST = [[FMCCompassDirection alloc] initWithValue:@"EAST"];
	}
	return FMCCompassDirection_EAST;
}

+(FMCCompassDirection*) NORTHEAST {
	if (FMCCompassDirection_NORTHEAST == nil) {
		FMCCompassDirection_NORTHEAST = [[FMCCompassDirection alloc] initWithValue:@"NORTHEAST"];
	}
	return FMCCompassDirection_NORTHEAST;
}

@end
