//
//  FMCOnLockScreenStatus.m
//  AppLink
//

#import "FMCOnLockScreenStatus.h"

@implementation FMCOnLockScreenStatus

- (id)init {
    if (self = [super initWithName:@"OnLockScreenStatus"]) {

    }
    return self;
}

- (id)initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {

    }
    return self;
}

- (void)setLockScreenStatus:(FMCLockScreenStatus*)lockScreenStatus {
    if (lockScreenStatus != nil) {
        [parameters setObject:lockScreenStatus forKey:@"OnLockScreenStatus"];
    } else {
        [parameters removeObjectForKey:@"OnLockScreenStatus"];
    }
}

- (FMCLockScreenStatus *)lockScreenStatus {
    NSObject* obj = [parameters objectForKey:@"OnLockScreenStatus"];
    if ([obj isKindOfClass:FMCLockScreenStatus.class]) {
        return (FMCLockScreenStatus*)obj;
    } else {
        return [FMCLockScreenStatus valueOf:(NSString*)obj];
    }
}

- (void)setHmiLevel:(FMCHMILevel *)hmiLevel {
    if (hmiLevel != nil) {
        [parameters setObject:hmiLevel forKey:@"hmilevel"];
    } else {
        [parameters removeObjectForKey:@"hmilevel"];
    }
}

- (FMCHMILevel *)hmiLevel {
    NSObject* obj = [parameters objectForKey:@"hmilevel"];
    if ([obj isKindOfClass:FMCLockScreenStatus.class]) {
        return (FMCHMILevel *)obj;
    } else {
        return [FMCHMILevel valueOf:(NSString*)obj];
    }
}

- (void)setUserSelected:(NSNumber *)userSelected {
    if (userSelected != nil) {
        [parameters setObject:userSelected forKey:@"userselected"];
    } else {
        [parameters removeObjectForKey:@"userselected"];
    }
}

- (NSNumber *)userSelected {
    return [parameters objectForKey:@"userselected"];
}

- (void)setDriverDistractionStatus:(NSNumber *)driverDistractionStatus {
    if (driverDistractionStatus != nil) {
        [parameters setObject:driverDistractionStatus forKey:@"driverdistractionstatus"];
    } else {
        [parameters removeObjectForKey:@"driverdistractionstatus"];
    }
}

- (NSNumber *)driverDistractionStatus {
    return [parameters objectForKey:@"driverdistractionstatus"];
}

@end
