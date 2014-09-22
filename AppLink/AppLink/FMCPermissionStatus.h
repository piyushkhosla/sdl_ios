//  FMCPermissionStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Enumeration that describes possible permission states of a policy table entry.
 *
 * Avaliable since <font color=red><b> AppLink 2.0 </b></font>
 */
@interface FMCPermissionStatus : FMCEnum {}

/*!
 @abstract FMCPermissionStatus 
 @param value NSString
 @result return a FMCPermissionStatus object
 */
+(FMCPermissionStatus*) valueOf:(NSString*) value;
/*!
 @abstract declare an array to store all possible FMCPermissionStatus values
 @result return the array
 */
+(NSMutableArray*) values;                                
+(NSMutableArray*) values;

/*!
 @abstract permission : allowed
 @result return permission status : <font color=gray><i> ALLOWED </i></font>
 */
+(FMCPermissionStatus*) ALLOWED;
/*!
 @abstract permission : disallowed
 @result return permission status : <font color=gray><i> DISALLOWED </i></font>
 */
+(FMCPermissionStatus*) DISALLOWED;
/*!
 @abstract permission : user disallowed
 @result return permission status : <font color=gray><i> USER_DISALLOWED </i></font>
 */
+(FMCPermissionStatus*) USER_DISALLOWED;
/*!
 @abstract permission : user consent pending
 @result return permission status : <font color=gray><i> USER_CONSENT_PENDING </i></font>
 */
+(FMCPermissionStatus*) USER_CONSENT_PENDING;

@end
