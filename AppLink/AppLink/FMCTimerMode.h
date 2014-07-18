//  FMCTimerMode.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCTimerMode : FMCEnum {}

+(FMCTimerMode*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCTimerMode*) UP;
+(FMCTimerMode*) DOWN;
+(FMCTimerMode*) NONE;

@end
