//  FMCHeadLampStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Structs/FMCHeadLampStatus.h>

#import <AppLink/FMCNames.h>

@implementation FMCHeadLampStatus

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setLowBeamsOn:(NSNumber*) lowBeamsOn {
    if (lowBeamsOn != nil) {
        [store setObject:lowBeamsOn forKey:NAMES_lowBeamsOn];
    } else {
        [store removeObjectForKey:NAMES_lowBeamsOn];
    }
}

-(NSNumber*) lowBeamsOn {
    return [store objectForKey:NAMES_lowBeamsOn];
}

-(void) setHighBeamsOn:(NSNumber*) highBeamsOn {
    if (highBeamsOn != nil) {
        [store setObject:highBeamsOn forKey:NAMES_highBeamsOn];
    } else {
        [store removeObjectForKey:NAMES_highBeamsOn];
    }
}

-(NSNumber*) highBeamsOn {
    return [store objectForKey:NAMES_highBeamsOn];
}

-(void) setAmbientLightSensorStatus:(FMCAmbientLightStatus*) ambientLightSensorStatus {
    if (ambientLightSensorStatus != nil) {
        [store setObject:ambientLightSensorStatus forKey:NAMES_ambientLightSensorStatus];
    } else {
        [store removeObjectForKey:NAMES_ambientLightSensorStatus];
    }
}

-(FMCAmbientLightStatus*) ambientLightSensorStatus {
    NSObject* obj = [store objectForKey:NAMES_ambientLightSensorStatus];
    if ([obj isKindOfClass:FMCAmbientLightStatus.class]) {
        return (FMCAmbientLightStatus*)obj;
    } else {
        return [FMCAmbientLightStatus valueOf:(NSString*)obj];
    }
}

@end
