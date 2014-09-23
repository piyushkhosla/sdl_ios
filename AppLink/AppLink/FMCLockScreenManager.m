//
//  FMCLockScreenManager.m
//  AppLink
//

#import <AppLink/FMCLockScreenManager.h>

@interface FMCLockScreenManager ()

@property (assign, nonatomic) BOOL bHaveDDStatus;

@end


@implementation FMCLockScreenManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _bUserSelected = NO;
        _bDriverDistractionStatus = NO;
        _bHaveDDStatus = NO;
    }
    return self;
}

- (void)setBDriverDistractionStatus:(BOOL)bDriverDistractionStatus
{
    _bDriverDistractionStatus = bDriverDistractionStatus;
    _bHaveDDStatus = YES;
}

- (void)setHmiLevel:(FMCHMILevel *)hmiLevel
{
    if (_hmiLevel != hmiLevel) {
        _hmiLevel = hmiLevel;
    }

    if ([FMCHMILevel.HMI_FULL.value isEqualToString:hmiLevel.value] || [FMCHMILevel.HMI_LIMITED.value isEqualToString:hmiLevel.value]) {
        _bUserSelected = YES;
    } else if ([FMCHMILevel.HMI_NONE.value isEqualToString:hmiLevel.value]) {
        _bUserSelected = NO;
    }
}

- (FMCOnLockScreenStatus *)lockScreenStatusNotification {
    FMCOnLockScreenStatus *notification = [FMCOnLockScreenStatus new];
    notification.driverDistractionStatus = [NSNumber numberWithBool:_bDriverDistractionStatus];
    notification.hmiLevel = _hmiLevel;
    NSNumber *userSelected = [NSNumber numberWithBool:_bUserSelected];
    notification.userSelected = userSelected;
    notification.lockScreenStatus = [self lockScreenStatus];
    return notification;
}

- (FMCLockScreenStatus *)lockScreenStatus
{
    if (_hmiLevel == nil || _hmiLevel == [FMCHMILevel HMI_NONE]) {
        return [FMCLockScreenStatus OFF];
    } else if (_hmiLevel == [FMCHMILevel HMI_BACKGROUND]) {
        if (!_bHaveDDStatus)
        {
            //we don't have driver distraction, lockscreen is entirely based on userselection
            if (_bUserSelected)
                return [FMCLockScreenStatus REQUIRED];
            else
                return [FMCLockScreenStatus OFF];
        }
        else if (_bHaveDDStatus && _bUserSelected)
        {
            return [FMCLockScreenStatus REQUIRED];
        }
        else if (!_bHaveDDStatus && _bUserSelected)
        {
            return [FMCLockScreenStatus OPTIONAL];
        }
        else
        {
            return [FMCLockScreenStatus OFF];
        }
    } else if (_hmiLevel == [FMCHMILevel HMI_FULL] || _hmiLevel == [FMCHMILevel HMI_LIMITED]) {
        if (_bHaveDDStatus && !_bDriverDistractionStatus) {
            return [FMCLockScreenStatus OPTIONAL];
        } else {
            return [FMCLockScreenStatus REQUIRED];
        }

    } else {
        return [FMCLockScreenStatus OFF];
    }
}

@end
