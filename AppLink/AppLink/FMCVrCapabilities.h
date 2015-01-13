//  FMCVrCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * The VR capabilities of the connected SYNC platform.
 *
 */
@interface FMCVrCapabilities : FMCEnum {}

/**
 * Convert String to FMCVrCapabilities
 * @param value String
 * @return FMCVrCapabilities
 */
+(FMCVrCapabilities*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCVrCapabilities
 @result return an array that store all possible FMCVrCapabilities
 */
+(NSMutableArray*) values;

/**
 * @abstract The SYNC platform is capable of recognizing spoken text in the current
 * language.
 * @result return an FMCVrCapabilities instance pointer with value of <font color=gray><i> TEXT </i></font>
 * @since <font color=red><b> AppLink 1.0 </b></font>
 */
+(FMCVrCapabilities*) TEXT;

@end
