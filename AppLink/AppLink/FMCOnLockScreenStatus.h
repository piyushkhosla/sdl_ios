//
//  FMCOnLockScreenStatus.h
//  AppLink
//

#import <AppLink/AppLink.h>
#import "FMCLockScreenStatus.h"

@interface FMCOnLockScreenStatus : FMCRPCNotification

- (id)init;
- (id)initWithDictionary:(NSMutableDictionary *)dict;

@property(strong) NSNumber *driverDistractionStatus;
@property(strong) NSNumber *userSelected;
@property(strong) FMCLockScreenStatus *lockScreenStatus;
@property(strong) FMCHMILevel *hmiLevel;

@end
