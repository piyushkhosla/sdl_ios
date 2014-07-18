//  FMCHmiZoneCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCHmiZoneCapabilities : FMCEnum {}

+(FMCHmiZoneCapabilities*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCHmiZoneCapabilities*) FRONT;
+(FMCHmiZoneCapabilities*) BACK;

@end
