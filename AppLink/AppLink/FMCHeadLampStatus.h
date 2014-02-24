//  FMCHeadLampStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>
#import <AppLink/FMCAmbientLightStatus.h>

@interface FMCHeadLampStatus : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSNumber* lowBeamsOn;
@property(assign) NSNumber* highBeamsOn;
@property(assign) FMCAmbientLightStatus* ambientLightSensorStatus;

@end
