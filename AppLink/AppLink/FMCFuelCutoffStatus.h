//  FMCFuelCutoffStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCFuelCutoffStatus : FMCEnum {}

+(FMCFuelCutoffStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCFuelCutoffStatus*) TERMINATE_FUEL;
+(FMCFuelCutoffStatus*) NORMAL_OPERATION;
+(FMCFuelCutoffStatus*) FAULT;

@end
