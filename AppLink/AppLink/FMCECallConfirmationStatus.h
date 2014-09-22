//  FMCECallConfirmationStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCECallConfirmationStatus : FMCEnum {}

+(FMCECallConfirmationStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCECallConfirmationStatus*) NORMAL;
+(FMCECallConfirmationStatus*) CALL_IN_PROGRESS;
+(FMCECallConfirmationStatus*) CALL_CANCELLED;
+(FMCECallConfirmationStatus*) CALL_COMPLETED;
+(FMCECallConfirmationStatus*) CALL_UNSUCCESSFUL;
+(FMCECallConfirmationStatus*) ECALL_CONFIGURED_OFF;
+(FMCECallConfirmationStatus*) CALL_COMPLETE_DTMF_TIMEOUT;

@end
