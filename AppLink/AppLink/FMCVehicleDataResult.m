//  FMCVehicleDataResult.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCVehicleDataResult.h>

#import <AppLink/FMCNames.h>

@implementation FMCVehicleDataResult

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setDataType:(FMCVehicleDataType*) dataType {
    if (dataType != nil) {
        [store setObject:dataType forKey:NAMES_dataType];
    } else {
        [store removeObjectForKey:NAMES_dataType];
    }
}

-(FMCVehicleDataType*) dataType {
    return [store objectForKey:NAMES_dataType];
}

-(void) setResultCode:(FMCVehicleDataResultCode*) resultCode {
    if (resultCode != nil) {
        [store setObject:resultCode forKey:NAMES_resultCode];
    } else {
        [store removeObjectForKey:NAMES_resultCode];
    }
}

-(FMCVehicleDataResultCode*) resultCode {
    return [store objectForKey:NAMES_resultCode];
}

@end
