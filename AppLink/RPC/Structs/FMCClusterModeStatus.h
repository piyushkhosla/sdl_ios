//  FMCClusterModeStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/RPC/Enums/FMCPowerModeQualificationStatus.h>
#import <AppLink/RPC/Enums/FMCCarModeStatus.h>
#import <AppLink/RPC/Enums/FMCPowerModeStatus.h>

@interface FMCClusterModeStatus : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSNumber* powerModeActive;
@property(assign) FMCPowerModeQualificationStatus* powerModeQualificationStatus;
@property(assign) FMCCarModeStatus* carModeStatus;
@property(assign) FMCPowerModeStatus* powerModeStatus;

@end
