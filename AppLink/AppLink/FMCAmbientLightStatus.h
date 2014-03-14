//
//  FMCAmbientLightStatus.h
//  AppLink
//
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCAmbientLightStatus : FMCEnum

+ (NSMutableArray*)values;
+ (FMCAmbientLightStatus*)valueOf:(NSString*) value;
+ (FMCAmbientLightStatus*)NIGHT;
+ (FMCAmbientLightStatus*)TWILIGHT_1;
+ (FMCAmbientLightStatus*)TWILIGHT_2;
+ (FMCAmbientLightStatus*)TWILIGHT_3;
+ (FMCAmbientLightStatus*)TWILIGHT_4;
+ (FMCAmbientLightStatus*)DAY;
+ (FMCAmbientLightStatus*)UNKNOWN;
+ (FMCAmbientLightStatus*)INVALID;

@end

