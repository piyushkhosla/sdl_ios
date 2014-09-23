//
//  FMCLockScreenStatus.h
//  AppLink
//

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCLockScreenStatus : FMCEnum

+ (FMCLockScreenStatus *)valueOf:(NSString *)value;
+ (NSMutableArray *)values;

+ (FMCLockScreenStatus *)OFF;
+ (FMCLockScreenStatus *)OPTIONAL;
+ (FMCLockScreenStatus *)REQUIRED;

@end
