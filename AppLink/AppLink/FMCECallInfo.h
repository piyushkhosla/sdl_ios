//  FMCECallInfo.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCVehicleDataNotificationStatus.h>
#import <AppLink/FMCECallConfirmationStatus.h>

@interface FMCECallInfo : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCVehicleDataNotificationStatus* eCallNotificationStatus;
@property(strong) FMCVehicleDataNotificationStatus* auxECallNotificationStatus;
@property(strong) FMCECallConfirmationStatus* eCallConfirmationStatus;

@end
