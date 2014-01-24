//  FMCAppHMIType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Enumeration listing possible app hmi types.
 *
 * This enum is avaliable since <font color=red><b>AppLink 2.0</b></font>
 */
@interface FMCAppHMIType : FMCEnum {}

/**
 * @abstract Convert String to AppHMIType
 * @param value NSString
 * @result FMCAppHMIType
 */
+(FMCAppHMIType*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCAppHMIType
 @result return an array that store all possible FMCAppHMIType
 */
+(NSMutableArray*) values;

/**
 * @abstract  The App will have default rights.
 * @result FMCAppHMIType with value <font color=gray><i>DEFAULT</i></font>
 */
+(FMCAppHMIType*) DEFAULT;
/**
 * @abstract  Communication type of App
 * @result FMCAppHMIType with value <font color=gray><i>COMMUNICATION</i></font>
 */
+(FMCAppHMIType*) COMMUNICATION;
/**
 * @abstract  App dealing with Media
 * @result FMCAppHMIType with value <font color=gray><i>MEDIA</i></font>
 */
+(FMCAppHMIType*) MEDIA;
/**
 * @abstract  Messaging App
 * @result FMCAppHMIType with value <font color=gray><i>MESSAGING</i></font>
 */
+(FMCAppHMIType*) MESSAGING;
/**
 * @abstract  Navigation App
 * @result FMCAppHMIType with value <font color=gray><i>NAVIGATION</i></font>
 */
+(FMCAppHMIType*) NAVIGATION;
/**
 * @abstract  Information App
 * @result FMCAppHMIType with value <font color=gray><i>INFORMATION</i></font>
 */
+(FMCAppHMIType*) INFORMATION;
/**
 * @abstract  App dealing with social media
 * @result FMCAppHMIType with value <font color=gray><i>SOCIA</i></font>
 */
+(FMCAppHMIType*) SOCIAL;
/*!
 @abstract  To Be Continued
 */
+(FMCAppHMIType*) BACKGROUND_PROCESS;
/**
 * @abstract  App only for Testing purposes
 * @result FMCAppHMIType with value <font color=gray><i>TESTING</i></font>
 */
+(FMCAppHMIType*) TESTING;
/**
 * @abstract  System App
 * @result FMCAppHMIType with value <font color=gray><i>SYSTEM</i></font>
 */
+(FMCAppHMIType*) SYSTEM;

@end
