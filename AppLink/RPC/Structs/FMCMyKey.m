//  FMCMyKey.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Structs/FMCMyKey.h>

#import <AppLink/FMCNames.h>

@implementation FMCMyKey

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setE911Override:(FMCVehicleDataStatus*) e911Override {
    if (e911Override != nil) {
        [store setObject:e911Override forKey:NAMES_e911Override];
    } else {
        [store removeObjectForKey:NAMES_e911Override];
    }
}

-(FMCVehicleDataStatus*) e911Override {
    NSObject* obj = [store objectForKey:NAMES_e911Override];
    if ([obj isKindOfClass:FMCVehicleDataStatus.class]) {
        return (FMCVehicleDataStatus*)obj;
    } else {
        return [FMCVehicleDataStatus valueOf:(NSString*)obj];
    }
}

@end
