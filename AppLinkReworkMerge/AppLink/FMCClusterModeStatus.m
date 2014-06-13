//  FMCClusterModeStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCClusterModeStatus.h>

#import <AppLink/FMCNames.h>

@implementation FMCClusterModeStatus

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setPowerModeActive:(NSNumber*) powerModeActive {
    if (powerModeActive != nil) {
        [store setObject:powerModeActive forKey:NAMES_powerModeActive];
    } else {
        [store removeObjectForKey:NAMES_powerModeActive];
    }
}

-(NSNumber*) powerModeActive {
    return [store objectForKey:NAMES_powerModeActive];
}

-(void) setPowerModeQualificationStatus:(FMCPowerModeQualificationStatus*) powerModeQualificationStatus {
    if (powerModeQualificationStatus != nil) {
        [store setObject:powerModeQualificationStatus forKey:NAMES_powerModeQualificationStatus];
    } else {
        [store removeObjectForKey:NAMES_powerModeQualificationStatus];
    }
}

-(FMCPowerModeQualificationStatus*) powerModeQualificationStatus {
    NSObject* obj = [store objectForKey:NAMES_powerModeQualificationStatus];
    if ([obj isKindOfClass:FMCPowerModeQualificationStatus.class]) {
        return (FMCPowerModeQualificationStatus*)obj;
    } else {
        return [FMCPowerModeQualificationStatus valueOf:(NSString*)obj];
    }
}

-(void) setCarModeStatus:(FMCCarModeStatus*) carModeStatus {
    if (carModeStatus != nil) {
        [store setObject:carModeStatus forKey:NAMES_carModeStatus];
    } else {
        [store removeObjectForKey:NAMES_carModeStatus];
    }
}

-(FMCCarModeStatus*) carModeStatus {
    NSObject* obj = [store objectForKey:NAMES_carModeStatus];
    if ([obj isKindOfClass:FMCCarModeStatus.class]) {
        return (FMCCarModeStatus*)obj;
    } else {
        return [FMCCarModeStatus valueOf:(NSString*)obj];
    }
}

-(void) setPowerModeStatus:(FMCPowerModeStatus*) powerModeStatus {
    if (powerModeStatus != nil) {
        [store setObject:powerModeStatus forKey:NAMES_powerModeStatus];
    } else {
        [store removeObjectForKey:NAMES_powerModeStatus];
    }
}

-(FMCPowerModeStatus*) powerModeStatus {
    NSObject* obj = [store objectForKey:NAMES_powerModeStatus];
    if ([obj isKindOfClass:FMCPowerModeStatus.class]) {
        return (FMCPowerModeStatus*)obj;
    } else {
        return [FMCPowerModeStatus valueOf:(NSString*)obj];
    }
}

@end
