//  FMCKeyboardLayout.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/** Enumeration listing possible keyboard layouts
*
*<b>Since</b> AppLink 3.0
*
*/
@interface FMCKeyboardLayout : FMCEnum {}

+(FMCKeyboardLayout*) valueOf:(NSString*) value;
+(NSMutableArray*) values;
/** QWERTY layout (the name comes from the first six keys<br> appearing on the top left letter row of the keyboard and read from left to right)
 *
 */
+(FMCKeyboardLayout*) QWERTY;

/** QWERTZ layout (the name comes from the first six keys<br> appearing on the top left letter row of the keyboard and read from left to right)
 *
 */
+(FMCKeyboardLayout*) QWERTZ;

/** AZERTY layout (the name comes from the first six keys<br> appearing on the top left letter row of the keyboard and read from left to right)
 *
 */

+(FMCKeyboardLayout*) AZERTY;

@end
