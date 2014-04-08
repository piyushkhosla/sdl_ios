//  FMCCarModeStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCCarModeStatus : FMCEnum {}

+(FMCCarModeStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCCarModeStatus*) NORMAL;
+(FMCCarModeStatus*) FACTORY;
+(FMCCarModeStatus*) TRANSPORT;
+(FMCCarModeStatus*) CRASH;

@end
