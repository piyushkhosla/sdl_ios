//  FMCAmbientLightStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCAmbientLightStatus : FMCEnum {}

+(FMCAmbientLightStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCAmbientLightStatus*) NIGHT;
+(FMCAmbientLightStatus*) TWILIGHT_1;
+(FMCAmbientLightStatus*) TWILIGHT_2;
+(FMCAmbientLightStatus*) TWILIGHT_3;
+(FMCAmbientLightStatus*) TWILIGHT_4;
+(FMCAmbientLightStatus*) DAY;
+(FMCAmbientLightStatus*) UNKNOWN;
+(FMCAmbientLightStatus*) INVALID;

@end
