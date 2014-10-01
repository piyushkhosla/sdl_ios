//  FMCECallConfirmationStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/** Reflects the status of the eCall Notification.
 *<b>Since</b> AppLink 2.0
 <p>
 */

@interface FMCECallConfirmationStatus : FMCEnum {}

+(FMCECallConfirmationStatus*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

/** No E-Call signal triggered.
 */

+(FMCECallConfirmationStatus*) NORMAL;

/** An E-Call is being in progress.
 */

+(FMCECallConfirmationStatus*) CALL_IN_PROGRESS;

/** CALL_CANCELLED	An E-Call was cancelled by the user.
 */

+(FMCECallConfirmationStatus*) CALL_CANCELLED;

/** The E-Call sequence is completed.
 */

+(FMCECallConfirmationStatus*) CALL_COMPLETED;

/** An E-Call could not be connected.
 */

+(FMCECallConfirmationStatus*) CALL_UNSUCCESSFUL;

/** E-Call is not configured on this vehicle.
 */

+(FMCECallConfirmationStatus*) ECALL_CONFIGURED_OFF;

/** E-Call is considered to be complete without Emergency Operator contact.
 */

+(FMCECallConfirmationStatus*) CALL_COMPLETE_DTMF_TIMEOUT;

@end
