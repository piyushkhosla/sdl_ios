//
//  FMCLockScreenStatus.m
//  AppLink
//

#import <AppLink/FMCLockScreenStatus.h>

@implementation FMCLockScreenStatus

FMCLockScreenStatus* FMCLockScreenStatus_OFF = nil;
FMCLockScreenStatus* FMCLockScreenStatus_OPTIONAL = nil;
FMCLockScreenStatus* FMCLockScreenStatus_REQUIRED = nil;

NSMutableArray* FMCLockScreenStatus_values = nil;


+ (FMCLockScreenStatus *)valueOf:(NSString *)value
{
    for (FMCLockScreenStatus* item in FMCLockScreenStatus.values)
    {
        if ([item.value isEqualToString:value])
        {
            return item;
        }
    }
    return nil;
}

+ (NSMutableArray *)values
{
    if (FMCLockScreenStatus_values == nil)
    {
        FMCLockScreenStatus_values = [[NSMutableArray alloc] initWithObjects:
                                      FMCLockScreenStatus.OFF,
                                      FMCLockScreenStatus.OPTIONAL,
                                      FMCLockScreenStatus.REQUIRED,
                                      nil];
    }
    return FMCLockScreenStatus_values;
}

+ (FMCLockScreenStatus *)OFF
{
    if (FMCLockScreenStatus_OFF == nil) {
        FMCLockScreenStatus_OFF = [[FMCLockScreenStatus alloc] initWithValue:@"OFF"];
    }
    return FMCLockScreenStatus_OFF;
}

+ (FMCLockScreenStatus *)OPTIONAL
{
    if (FMCLockScreenStatus_OPTIONAL == nil) {
        FMCLockScreenStatus_OPTIONAL = [[FMCLockScreenStatus alloc] initWithValue:@"OPTIONAL"];
    }
    return FMCLockScreenStatus_OPTIONAL;
}

+ (FMCLockScreenStatus *)REQUIRED
{
    if (FMCLockScreenStatus_REQUIRED == nil) {
        FMCLockScreenStatus_REQUIRED = [[FMCLockScreenStatus alloc] initWithValue:@"REQUIRED"];
    }
    return FMCLockScreenStatus_REQUIRED;
}


@end
