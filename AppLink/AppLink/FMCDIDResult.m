//  FMCDIDResult.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCDIDResult.h>

#import <AppLink/FMCNames.h>

@implementation FMCDIDResult

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
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

-(void) setDidLocation:(NSNumber*) didLocation {
    if (didLocation != nil) {
        [store setObject:didLocation forKey:NAMES_didLocation];
    } else {
        [store removeObjectForKey:NAMES_didLocation];
    }
}

-(NSNumber*) didLocation {
    return [store objectForKey:NAMES_didLocation];
}

-(void) setData:(NSString*) data {
    if (data != nil) {
        [store setObject:data forKey:NAMES_data];
    } else {
        [store removeObjectForKey:NAMES_data];
    }
}

-(NSString*) data {
    return [store objectForKey:NAMES_data];
}

@end
