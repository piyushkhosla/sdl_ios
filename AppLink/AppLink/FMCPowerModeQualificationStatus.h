//  FMCPowerModeQualificationStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCPowerModeQualificationStatus : FMCEnum {}

+(FMCPowerModeQualificationStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCPowerModeQualificationStatus*) POWER_MODE_UNDEFINED;
+(FMCPowerModeQualificationStatus*) POWER_MODE_EVALUATION_IN_PROGRESS;
+(FMCPowerModeQualificationStatus*) NOT_DEFINED;
+(FMCPowerModeQualificationStatus*) POWER_MODE_OK;

@end
