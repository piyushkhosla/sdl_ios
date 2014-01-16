//  FMCWarningLightStatus.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCWarningLightStatus.h>

FMCWarningLightStatus* FMCWarningLightStatus_OFF = nil;
FMCWarningLightStatus* FMCWarningLightStatus_ON = nil;
FMCWarningLightStatus* FMCWarningLightStatus_FLASH = nil;
FMCWarningLightStatus* FMCWarningLightStatus_NOT_USED = nil;

NSMutableArray* FMCWarningLightStatus_values = nil; 

@implementation FMCWarningLightStatus

+(FMCWarningLightStatus*) valueOf:(NSString*) value {                       
	for (FMCWarningLightStatus* item in FMCWarningLightStatus.values) {    
		if ([item.value isEqualToString:value]) { 
			return item; 
		} 
	} 
	return nil; 
}

+(NSMutableArray *) values {           
	if (FMCWarningLightStatus_values == nil) {                               
		FMCWarningLightStatus_values = [[NSMutableArray alloc] initWithObjects:
                                        FMCWarningLightStatus.OFF,
                                        FMCWarningLightStatus.ON,
                                        FMCWarningLightStatus.FLASH,
                                        FMCWarningLightStatus.NOT_USED,
                                        nil];
	} 
	return FMCWarningLightStatus_values; 
}

+(FMCWarningLightStatus*) OFF {
	if (FMCWarningLightStatus_OFF == nil) {
		FMCWarningLightStatus_OFF = [[FMCWarningLightStatus alloc] initWithValue:@"OFF"];
	} 
	return FMCWarningLightStatus_OFF;  
}

+(FMCWarningLightStatus*) ON {
	if (FMCWarningLightStatus_ON == nil) {
		FMCWarningLightStatus_ON = [[FMCWarningLightStatus alloc] initWithValue:@"ON"];
	}
	return FMCWarningLightStatus_ON;
}

+(FMCWarningLightStatus*) FLASH {
	if (FMCWarningLightStatus_FLASH == nil) {
		FMCWarningLightStatus_FLASH = [[FMCWarningLightStatus alloc] initWithValue:@"FLASH"];
	}
	return FMCWarningLightStatus_FLASH;
}

+(FMCWarningLightStatus*) NOT_USED {
	if (FMCWarningLightStatus_NOT_USED == nil) {
		FMCWarningLightStatus_NOT_USED = [[FMCWarningLightStatus alloc] initWithValue:@"NOT_USED"];
	}
	return FMCWarningLightStatus_NOT_USED;
}

@end


