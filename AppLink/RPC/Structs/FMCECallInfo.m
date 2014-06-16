//  FMCECallInfo.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Structs/FMCECallInfo.h>

#import <AppLink/FMCNames.h>

@implementation FMCECallInfo

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setECallNotificationStatus:(FMCVehicleDataNotificationStatus*) eCallNotificationStatus {
    if (eCallNotificationStatus != nil) {
        [store setObject:eCallNotificationStatus forKey:NAMES_eCallNotificationStatus];
    } else {
        [store removeObjectForKey:NAMES_eCallNotificationStatus];
    }
}

-(FMCVehicleDataNotificationStatus*) eCallNotificationStatus {
    NSObject* obj = [store objectForKey:NAMES_eCallNotificationStatus];
    if ([obj isKindOfClass:FMCVehicleDataNotificationStatus.class]) {
        return (FMCVehicleDataNotificationStatus*)obj;
    } else {
        return [FMCVehicleDataNotificationStatus valueOf:(NSString*)obj];
    }
}

-(void) setAuxECallNotificationStatus:(FMCVehicleDataNotificationStatus*) auxECallNotificationStatus {
    if (auxECallNotificationStatus != nil) {
        [store setObject:auxECallNotificationStatus forKey:NAMES_auxECallNotificationStatus];
    } else {
        [store removeObjectForKey:NAMES_auxECallNotificationStatus];
    }
}

-(FMCVehicleDataNotificationStatus*) auxECallNotificationStatus {
    NSObject* obj = [store objectForKey:NAMES_auxECallNotificationStatus];
    if ([obj isKindOfClass:FMCVehicleDataNotificationStatus.class]) {
        return (FMCVehicleDataNotificationStatus*)obj;
    } else {
        return [FMCVehicleDataNotificationStatus valueOf:(NSString*)obj];
    }
}

-(void) setECallConfirmationStatus:(FMCECallConfirmationStatus*) eCallConfirmationStatus {
    if (eCallConfirmationStatus != nil) {
        [store setObject:eCallConfirmationStatus forKey:NAMES_eCallConfirmationStatus];
    } else {
        [store removeObjectForKey:NAMES_eCallConfirmationStatus];
    }
}

-(FMCECallConfirmationStatus*) eCallConfirmationStatus {
    NSObject* obj = [store objectForKey:NAMES_eCallConfirmationStatus];
    if ([obj isKindOfClass:FMCECallConfirmationStatus.class]) {
        return (FMCECallConfirmationStatus*)obj;
    } else {
        return [FMCECallConfirmationStatus valueOf:(NSString*)obj];
    }
}

@end
