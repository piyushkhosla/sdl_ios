//  FMCPowerModeStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCPowerModeStatus : FMCEnum {}

+(FMCPowerModeStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCPowerModeStatus*) KEY_OUT;
+(FMCPowerModeStatus*) KEY_RECENTLY_OUT;
+(FMCPowerModeStatus*) KEY_APPROVED_0;
+(FMCPowerModeStatus*) POST_ACCESORY_0;
+(FMCPowerModeStatus*) ACCESORY_1;
+(FMCPowerModeStatus*) POST_IGNITION_1;
+(FMCPowerModeStatus*) IGNITION_ON_2;
+(FMCPowerModeStatus*) RUNNING_2;
+(FMCPowerModeStatus*) CRANK_3;

@end
