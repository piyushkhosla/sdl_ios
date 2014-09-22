//
//  FMCLockScreenStatus.h
//  AppLink
//

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>


@interface FMCLockScreenStatus : FMCEnum

+ (FMCLockScreenStatus *)valueOf:(NSString *)value;
+ (NSMutableArray *)values;
/**
 * LockScreen is Not Required
 */

+ (FMCLockScreenStatus *)OFF;
/**
 * LockScreen is Optional
 */
+ (FMCLockScreenStatus *)OPTIONAL;

/**
 * LockScreen is Not Required
 */
+ (FMCLockScreenStatus *)REQUIRED;

@end
