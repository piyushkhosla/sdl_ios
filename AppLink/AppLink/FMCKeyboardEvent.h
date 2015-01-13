//  FMCKeyboardEvent.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/** Enumeration listing possible keyboard events.
 *
 * @Since AppLink 3.0
 *
 */
@interface FMCKeyboardEvent : FMCEnum {}

+(FMCKeyboardEvent*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

/** The use has pressed the keyboard key (applies to both SINGLE_KEYPRESS and RESEND_CURRENT_ENTRY modes).
 *
 */
+(FMCKeyboardEvent*) KEYPRESS;

/** The User has finished entering text from the keyboard and submitted the entry.
 *
 */

+(FMCKeyboardEvent*) ENTRY_SUBMITTED;

/** The User has pressed the HMI-defined "Cancel" button.
 *
 */
+(FMCKeyboardEvent*) ENTRY_CANCELLED;


/** The User has not finished entering text and the keyboard is aborted with the event of higher priority.
 *
 */

+(FMCKeyboardEvent*) ENTRY_ABORTED;

@end
