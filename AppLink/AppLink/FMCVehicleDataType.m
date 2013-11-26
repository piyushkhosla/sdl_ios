//  FMCVehicleDataType.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCVehicleDataType.h>   

FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_GPS = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_SPEED = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_RPM = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_FUELLEVEL = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_FUELLEVEL_STATE = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_FUELCONSUMPTION = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_EXTERNTEMP = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_VIN = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_PRNDL = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_TIREPRESSURE = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_ODOMETER = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_BELTSTATUS = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_BODYINFO = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_DEVICESTATUS = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_BRAKING = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_WIPERSTATUS = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_HEADLAMPSTATUS = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_BATTVOLTAGE = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_ENGINETORQUE = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_ACCPEDAL = nil;
FMCVehicleDataType* FMCVehicleDataType_VEHICLEDATA_STEERINGWHEEL = nil;

NSMutableArray* FMCVehicleDataType_values = nil; 

@implementation FMCVehicleDataType

+(FMCVehicleDataType*) valueOf:(NSString*) value {                       
	for (FMCVehicleDataType* item in FMCVehicleDataType.values) {    
		if ([item.value isEqualToString:value]) { 
			return item; 
		} 
	} 
	return nil; 
}

+(NSMutableArray *) values {           
	if (FMCVehicleDataType_values == nil) {                               
		FMCVehicleDataType_values = [[NSMutableArray alloc] initWithObjects: 
                                    FMCVehicleDataType.VEHICLEDATA_GPS,
                                    FMCVehicleDataType.VEHICLEDATA_SPEED,
                                    FMCVehicleDataType.VEHICLEDATA_RPM,
                                    FMCVehicleDataType.VEHICLEDATA_FUELLEVEL,
                                    FMCVehicleDataType.VEHICLEDATA_FUELLEVEL_STATE,
                                    FMCVehicleDataType.VEHICLEDATA_FUELCONSUMPTION,
                                    FMCVehicleDataType.VEHICLEDATA_EXTERNTEMP,
                                    FMCVehicleDataType.VEHICLEDATA_VIN,
                                    FMCVehicleDataType.VEHICLEDATA_PRNDL,
                                    FMCVehicleDataType.VEHICLEDATA_TIREPRESSURE,
                                    FMCVehicleDataType.VEHICLEDATA_ODOMETER,
                                    FMCVehicleDataType.VEHICLEDATA_BELTSTATUS,
                                    FMCVehicleDataType.VEHICLEDATA_BODYINFO,
                                    FMCVehicleDataType.VEHICLEDATA_DEVICESTATUS,
                                    FMCVehicleDataType.VEHICLEDATA_BRAKING,
                                    FMCVehicleDataType.VEHICLEDATA_WIPERSTATUS,
                                    FMCVehicleDataType.VEHICLEDATA_HEADLAMPSTATUS,
                                    FMCVehicleDataType.VEHICLEDATA_BATTVOLTAGE,
                                    FMCVehicleDataType.VEHICLEDATA_ENGINETORQUE,
                                    FMCVehicleDataType.VEHICLEDATA_ACCPEDAL,
                                    FMCVehicleDataType.VEHICLEDATA_STEERINGWHEEL,
									nil];
	} 
	return FMCVehicleDataType_values;
}

+(FMCVehicleDataType*) VEHICLEDATA_GPS {
	if (FMCVehicleDataType_VEHICLEDATA_GPS == nil) {
		FMCVehicleDataType_VEHICLEDATA_GPS = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_GPS"];
	} 
	return FMCVehicleDataType_VEHICLEDATA_GPS;  
}

+(FMCVehicleDataType*) VEHICLEDATA_SPEED {
	if (FMCVehicleDataType_VEHICLEDATA_SPEED == nil) {
		FMCVehicleDataType_VEHICLEDATA_SPEED = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_SPEED"];
	}
	return FMCVehicleDataType_VEHICLEDATA_SPEED;
}

+(FMCVehicleDataType*) VEHICLEDATA_RPM {
	if (FMCVehicleDataType_VEHICLEDATA_RPM == nil) {
		FMCVehicleDataType_VEHICLEDATA_RPM = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_RPM"];
	}
	return FMCVehicleDataType_VEHICLEDATA_RPM;
}

+(FMCVehicleDataType*) VEHICLEDATA_FUELLEVEL {
	if (FMCVehicleDataType_VEHICLEDATA_FUELLEVEL == nil) {
		FMCVehicleDataType_VEHICLEDATA_FUELLEVEL = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_FUELLEVEL"];
	}
	return FMCVehicleDataType_VEHICLEDATA_FUELLEVEL;
}

+(FMCVehicleDataType*) VEHICLEDATA_FUELLEVEL_STATE {
	if (FMCVehicleDataType_VEHICLEDATA_FUELLEVEL_STATE == nil) {
		FMCVehicleDataType_VEHICLEDATA_FUELLEVEL_STATE = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_FUELLEVEL_STATE"];
	}
	return FMCVehicleDataType_VEHICLEDATA_FUELLEVEL_STATE;
}

+(FMCVehicleDataType*) VEHICLEDATA_FUELCONSUMPTION {
	if (FMCVehicleDataType_VEHICLEDATA_FUELCONSUMPTION == nil) {
		FMCVehicleDataType_VEHICLEDATA_FUELCONSUMPTION = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_FUELCONSUMPTION"];
	}
	return FMCVehicleDataType_VEHICLEDATA_FUELCONSUMPTION;
}

+(FMCVehicleDataType*) VEHICLEDATA_EXTERNTEMP {
	if (FMCVehicleDataType_VEHICLEDATA_EXTERNTEMP == nil) {
		FMCVehicleDataType_VEHICLEDATA_EXTERNTEMP = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_EXTERNTEMP"];
	}
	return FMCVehicleDataType_VEHICLEDATA_EXTERNTEMP;
}

+(FMCVehicleDataType*) VEHICLEDATA_VIN {
	if (FMCVehicleDataType_VEHICLEDATA_VIN == nil) {
		FMCVehicleDataType_VEHICLEDATA_VIN = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_VIN"];
	}
	return FMCVehicleDataType_VEHICLEDATA_VIN;
}

+(FMCVehicleDataType*) VEHICLEDATA_PRNDL {
	if (FMCVehicleDataType_VEHICLEDATA_PRNDL == nil) {
		FMCVehicleDataType_VEHICLEDATA_PRNDL = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_PRNDL"];
	}
	return FMCVehicleDataType_VEHICLEDATA_PRNDL;
}

+(FMCVehicleDataType*) VEHICLEDATA_TIREPRESSURE {
	if (FMCVehicleDataType_VEHICLEDATA_TIREPRESSURE == nil) {
		FMCVehicleDataType_VEHICLEDATA_TIREPRESSURE = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_TIREPRESSURE"];
	}
	return FMCVehicleDataType_VEHICLEDATA_TIREPRESSURE;
}

+(FMCVehicleDataType*) VEHICLEDATA_ODOMETER {
	if (FMCVehicleDataType_VEHICLEDATA_ODOMETER == nil) {
		FMCVehicleDataType_VEHICLEDATA_ODOMETER = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_ODOMETER"];
	}
	return FMCVehicleDataType_VEHICLEDATA_ODOMETER;
}

+(FMCVehicleDataType*) VEHICLEDATA_BELTSTATUS {
	if (FMCVehicleDataType_VEHICLEDATA_BELTSTATUS == nil) {
		FMCVehicleDataType_VEHICLEDATA_BELTSTATUS = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_BELTSTATUS"];
	}
	return FMCVehicleDataType_VEHICLEDATA_BELTSTATUS;
}

+(FMCVehicleDataType*) VEHICLEDATA_BODYINFO {
	if (FMCVehicleDataType_VEHICLEDATA_BODYINFO == nil) {
		FMCVehicleDataType_VEHICLEDATA_BODYINFO = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_BODYINFO"];
	}
	return FMCVehicleDataType_VEHICLEDATA_BODYINFO;
}

+(FMCVehicleDataType*) VEHICLEDATA_DEVICESTATUS {
	if (FMCVehicleDataType_VEHICLEDATA_DEVICESTATUS == nil) {
		FMCVehicleDataType_VEHICLEDATA_DEVICESTATUS = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_DEVICESTATUS"];
	}
	return FMCVehicleDataType_VEHICLEDATA_DEVICESTATUS;
}

+(FMCVehicleDataType*) VEHICLEDATA_BRAKING {
	if (FMCVehicleDataType_VEHICLEDATA_BRAKING == nil) {
		FMCVehicleDataType_VEHICLEDATA_BRAKING = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_BRAKING"];
	}
	return FMCVehicleDataType_VEHICLEDATA_BRAKING;
}

+(FMCVehicleDataType*) VEHICLEDATA_WIPERSTATUS {
	if (FMCVehicleDataType_VEHICLEDATA_WIPERSTATUS == nil) {
		FMCVehicleDataType_VEHICLEDATA_WIPERSTATUS = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_WIPERSTATUS"];
	}
	return FMCVehicleDataType_VEHICLEDATA_WIPERSTATUS;
}

+(FMCVehicleDataType*) VEHICLEDATA_HEADLAMPSTATUS {
	if (FMCVehicleDataType_VEHICLEDATA_HEADLAMPSTATUS == nil) {
		FMCVehicleDataType_VEHICLEDATA_HEADLAMPSTATUS = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_HEADLAMPSTATUS"];
	}
	return FMCVehicleDataType_VEHICLEDATA_HEADLAMPSTATUS;
}

+(FMCVehicleDataType*) VEHICLEDATA_BATTVOLTAGE {
	if (FMCVehicleDataType_VEHICLEDATA_BATTVOLTAGE == nil) {
		FMCVehicleDataType_VEHICLEDATA_BATTVOLTAGE = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_BATTVOLTAGE"];
	}
	return FMCVehicleDataType_VEHICLEDATA_BATTVOLTAGE;
}

+(FMCVehicleDataType*) VEHICLEDATA_ENGINETORQUE {
	if (FMCVehicleDataType_VEHICLEDATA_ENGINETORQUE == nil) {
		FMCVehicleDataType_VEHICLEDATA_ENGINETORQUE = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_ENGINETORQUE"];
	}
	return FMCVehicleDataType_VEHICLEDATA_ENGINETORQUE;
}

+(FMCVehicleDataType*) VEHICLEDATA_ACCPEDAL {
	if (FMCVehicleDataType_VEHICLEDATA_ACCPEDAL == nil) {
		FMCVehicleDataType_VEHICLEDATA_ACCPEDAL = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_ACCPEDAL"];
	}
	return FMCVehicleDataType_VEHICLEDATA_ACCPEDAL;
}

+(FMCVehicleDataType*) VEHICLEDATA_STEERINGWHEEL {
	if (FMCVehicleDataType_VEHICLEDATA_STEERINGWHEEL == nil) {
		FMCVehicleDataType_VEHICLEDATA_STEERINGWHEEL = [[FMCVehicleDataType alloc] initWithValue:@"VEHICLEDATA_STEERINGWHEEL"];
	}
	return FMCVehicleDataType_VEHICLEDATA_STEERINGWHEEL;
}

@end


