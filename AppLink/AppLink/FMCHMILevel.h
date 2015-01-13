//  FMCHMILevel.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Specifies current level of the HMI. An HMI level indicates the degree of user interaction possible through the HMI (e.g. TTS only, display only, VR, etc.). The HMI level varies for an application based on the type of display (i.e. Nav or non-Nav) and the user directing "focus" to other applications (e.g. phone, other mobile applications, etc.)
 * <p>
 * This enum is avaliable since <font color=red><b> AppLink 1.0 </b></font>
 */
@interface FMCHMILevel : FMCEnum {}

/*!
 @abstract return HMILevel status (FULL, LIMITED, BACKGROUND, NONE)
 @param value NSString
 @result return current HMI level
 */
+(FMCHMILevel*) valueOf:(NSString*) value;
/*!
 @abstract store all possible FMCHMILevel values
 @result return an array with all possible HMILevel values inside
 */
+(NSMutableArray*) values;

/**
 * @abstract The application has full use of the SYNC HMI. The app may output via TTS, display, or streaming audio and may gather input via VR, Menu, and button presses
 * @result return the HMILevel with value of <font color=gray><i> HMI_FULL </i></font>
 */
+(FMCHMILevel*) HMI_FULL;
/**
 * @abstract This HMI Level is only defined for a media application using an HMI with an 8 inch touchscreen (Nav) system. The application's <i>Show</i> text is displayed and it receives button presses from media-oriented buttons (SEEKRIGHT, SEEKLEFT, TUNEUP, TUNEDOWN, PRESET_0-9)
 * @result return the HMILevel with value of <font color=gray><i> HMI_LIMITED </i></font>
 */
+(FMCHMILevel*) HMI_LIMITED;
/**
 * @abstract App cannot interact with user via TTS, VR, Display or Button Presses. App can perform the following operations:<br/>
 * @discussion <ul>
 * <li>Operation : AddCommand</li>
 * <li>Operation : DeleteCommand</li>
 * <li>Operation : AddSubMenu</li>
 * <li>Operation : DeleteSubMenu</li>
 * <li>Operation : CreateInteractionChoiceSet</li>
 * <li>Operation : DeleteInteractionChoiceSet</li>
 * <li>Operation : SubscribeButton</li>
 * <li>Operation : UnsubscribeButton</li>
 * <li>Operation : Show</li>
 * <li>Operation : UnregisterAppInterface</li>
 * <li>Operation : ResetGlobalProperties</li>
 * <li>Operation : SetGlobalProperties</li>
 * </ul> 
 * @result return the HMILevel with value of <font color=gray><i> HMI_BACKGROUND </i></font>
 */
+(FMCHMILevel*) HMI_BACKGROUND;
/**
 * @abstract Application has been discovered by SYNC, but application cannot send any requests or receive any notifications<br/>
 * @discussion An HMILevel of NONE can also mean that the user has exited the application by saying "exit appname" or selecting "exit" from the application's menu. When this happens, the application still has an active interface registration with SYNC and all SYNC resources the application has created (e.g. Choice Sets, subscriptions, etc.) still exist. But while the HMILevel is NONE, the application cannot send any messages to SYNC, except <i>UnregisterAppInterface</i></li>
 * @result return the HMILevel with value of <font color=gray><i> HMI_NONE </i></font>
 */
+(FMCHMILevel*) HMI_NONE;

@end
