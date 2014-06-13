//  FMCEmergencyEventType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCEmergencyEventType : FMCEnum {}

+(FMCEmergencyEventType*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCEmergencyEventType*) NO_EVENT;
+(FMCEmergencyEventType*) FRONTAL;
+(FMCEmergencyEventType*) SIDE;
+(FMCEmergencyEventType*) REAR;
+(FMCEmergencyEventType*) ROLLOVER;
+(FMCEmergencyEventType*) NOT_SUPPORTED;
+(FMCEmergencyEventType*) FAULT;

@end
