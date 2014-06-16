//  FMCECallInfo.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/RPC/Enums/FMCVehicleDataNotificationStatus.h>
#import <AppLink/RPC/Enums/FMCECallConfirmationStatus.h>

@interface FMCECallInfo : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCVehicleDataNotificationStatus* eCallNotificationStatus;
@property(assign) FMCVehicleDataNotificationStatus* auxECallNotificationStatus;
@property(assign) FMCECallConfirmationStatus* eCallConfirmationStatus;

@end
