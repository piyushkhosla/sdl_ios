//  FMCKeypressMode.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>
/** Enumeration listing possible keyboard events.
 * <p>
 * <b>Note:</b> Depending on keypressMode value (from keyboardProperties structure of UI.SetGlobalProperties),<br>HMI must send the onKeyboardInput notification with the following data:<br>
 SINGLE_KEYPRESS,QUEUE_KEYPRESSES,RESEND_CURRENT_ENTRY.
 * @Since AppLink 3.0
 *
 */
@interface FMCKeypressMode : FMCEnum {}

+(FMCKeypressMode*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

/** SINGLE_KEYPRESS:<br>Each and every User`s keypress must be reported (new notification for every newly entered single symbol).
 *
 */
+(FMCKeypressMode*) SINGLE_KEYPRESS;

/** QUEUE_KEYPRESSES:<br>The whole entry is reported only after the User submits it (by ‘Search’ button click displayed on touchscreen keyboard)
 *
 */
+(FMCKeypressMode*) QUEUE_KEYPRESSES;

/** RESEND_CURRENT_ENTRY:<br>The whole entry must be reported each and every time the User makes a new keypress<br> (new notification with all previously entered symbols and a newly entered one appended).
 *
 */
+(FMCKeypressMode*) RESEND_CURRENT_ENTRY;

@end
