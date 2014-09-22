//
//  FMCLockScreenManager.h
//  AppLink
//

#import <Foundation/Foundation.h>
#import "FMCHMILevel.h"
#import "FMCLockScreenStatus.h"
#import "FMCOnLockScreenStatus.h"

@interface FMCLockScreenManager : NSObject

@property (assign, nonatomic) BOOL bUserSelected;
@property (assign, nonatomic) BOOL bDriverDistractionStatus;
@property (strong, nonatomic) FMCHMILevel *hmiLevel;
@property (strong, nonatomic, readonly) FMCLockScreenStatus *lockScreenStatus;
@property (strong, nonatomic, readonly) FMCOnLockScreenStatus *lockScreenStatusNotification;

@end
