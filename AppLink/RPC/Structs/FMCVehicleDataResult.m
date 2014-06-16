//  FMCVehicleDataResult.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Structs/FMCVehicleDataResult.h>

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
    NSObject* obj = [store objectForKey:NAMES_dataType];
    if ([obj isKindOfClass:FMCVehicleDataType.class]) {
        return (FMCVehicleDataType*)obj;
    } else {
        return [FMCVehicleDataType valueOf:(NSString*)obj];
    }
}

-(void) setResultCode:(FMCVehicleDataResultCode*) resultCode {
    if (resultCode != nil) {
        [store setObject:resultCode forKey:NAMES_resultCode];
    } else {
        [store removeObjectForKey:NAMES_resultCode];
    }
}

-(FMCVehicleDataResultCode*) resultCode {
    NSObject* obj = [store objectForKey:NAMES_resultCode];
    if ([obj isKindOfClass:FMCVehicleDataResultCode.class]) {
        return (FMCVehicleDataResultCode*)obj;
    } else {
        return [FMCVehicleDataResultCode valueOf:(NSString*)obj];
    }
}

@end
