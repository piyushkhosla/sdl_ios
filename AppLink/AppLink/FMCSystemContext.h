//  FMCSystemContext.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Indicates whether or not a user-initiated interaction is in progress, and if
 * so, in what mode (i.e. MENU or VR).
 *
 * Avaliable since <font color=red><b> AppLink 1.0 </b></font>
 */
@interface FMCSystemContext : FMCEnum {}

/**
 * Convert String to FMCSystemContext
 * @param value String
 * @return FMCSystemContext
 */
+(FMCSystemContext*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCSystemContext
 @result return an array that store all possible FMCSystemContext
 */
+(NSMutableArray*) values;

/**
 * @abstract No user interaction (user-initiated or app-initiated) is in progress.
 * @result FMCSystemContext object of value <font color=gray><i> MAIN </i></font>
 * @since <font color=red><b> AppLink 1.0 </b></font>
 */
+(FMCSystemContext*) MAIN;
/**
 * @abstract VR-oriented, user-initiated or app-initiated interaction is in-progress.
 * @result FMCSystemContext object of value <font color=gray><i> VRSESSION </i></font>
 * @since <font color=red><b> AppLink 1.0 </b></font>
 */
+(FMCSystemContext*) VRSESSION;
/**
 * @abstract Menu-oriented, user-initiated or app-initiated interaction is
 * in-progress.
 * @result FMCSystemContext object of value <font color=gray><i> MENU </i></font>
 * @since <font color=red><b> AppLink 1.0 </b></font>
 */
+(FMCSystemContext*) MENU;
/**
 * @abstract The app's display HMI is currently being obscured by either a system or
 * other app's overlay.
 * @result FMCSystemContext object of value <font color=gray><i> HMI_OBSCURED </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCSystemContext*) HMI_OBSCURED;
/**
 * @abstract Broadcast only to whichever app has an alert currently being displayed.
 * @result FMCSystemContext object of value <font color=gray><i> ALERT </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCSystemContext*) ALERT;

@end
