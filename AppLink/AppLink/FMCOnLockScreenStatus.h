//
//  FMCOnLockScreenStatus.h
//  AppLink
//

#import <AppLink/AppLink.h>
#import "FMCLockScreenStatus.h"
/**
 * 	As per Ford Motor Company’s driver distraction rules, any AppLink application is required to implement a lockscreen that must be enforced while the application is active on the system while the vehicle is in motion.
 *
 *	This lockscreen must perform the following:
 *	Limit all application control usability from the mobile device with a full-screen static image overlay or separate view.
 *	For simplicity, the OnLockScreenStatus RPC will be provided via the onOnLockScreenNotification call back. The call back will include the LockScreenStatus enum which indicates if the lockscreen is required, optional or not required.
 *	The call back also includes details regarding the current HMI_Status level, driver distraction status and user selection status of the application.
 */
@interface FMCOnLockScreenStatus : FMCRPCNotification

- (id)init;
- (id)initWithDictionary:(NSMutableDictionary *)dict;
/**
 * <p>Get the current driver distraction status(i.e. whether driver distraction rules are in effect, or not)</p>
 * @return String
 */
@property(strong) NSNumber *driverDistractionStatus;
/**
 * <p>Get user selection status for the application (has the app been selected via hmi or voice command)</p>
 * @return Boolean the current user selection status
 */

@property(strong) NSNumber *userSelected;
/**
 * <p>Get the {@linkplain LockScreenStatus} enumeration, indicating if the lockscreen should be required, optional or off </p>
 * @return {@linkplain LockScreenStatus}
 */
@property(strong) FMCLockScreenStatus *lockScreenStatus;
/**
 * <p>Get HMILevel in effect for the application</p>
 * @return {@linkplain HMILevel} the current HMI Level in effect for the application
 */
@property(strong) FMCHMILevel *hmiLevel;

@end
