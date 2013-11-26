//  FMCDIDResult.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

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
    return [store objectForKey:NAMES_resultCode];
}

-(void) setData:(NSMutableArray*) data {
    if (data != nil) {
        [store setObject:data forKey:NAMES_data];
    } else {
        [store removeObjectForKey:NAMES_data];
    }
}

-(NSMutableArray*) data {
    return [store objectForKey:NAMES_data];
}

@end
