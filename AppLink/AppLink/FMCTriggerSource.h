//  FMCTriggerSource.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Indicates whether choice/command was selected via VR or via a menu selection
 * (using SEEKRIGHT/SEEKLEFT, TUNEUP, TUNEDOWN and OK buttons)
 *
 * Avaliable since <font color=red><b> AppLink 1.0 </b></font>
 *
 */
@interface FMCTriggerSource : FMCEnum {}

/**
 * Convert String to FMCTriggerSource
 * @param value String
 * @return FMCTriggerSource
 */
+(FMCTriggerSource*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCTriggerSource
 @result return an array that store all possible FMCTriggerSource
 */
+(NSMutableArray*) values;

/**
 * @abstract Selection made via menu (i.e. using SEEKRIGHT/SEEKLEFT, TUNEUP, TUNEDOWN
 * and OK buttons)
 * @result return FMCTriggerSource with value of <font color=gray><i> MENU </i></font>
 */
+(FMCTriggerSource*) TS_MENU;
/**
 * @abstract Selection made via VR session
 * @result return FMCTriggerSource with value of <font color=gray><i> VR </i></font>
 */
+(FMCTriggerSource*) TS_VR;

@end
