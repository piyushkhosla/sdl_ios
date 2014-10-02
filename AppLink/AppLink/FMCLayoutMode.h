//  FMCLayoutMode.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>
/** For touchscreen interactions, the mode of how the choices are presented.
 *
 * <b>Since:</B> AppLink 3.0
 *
 */
@interface FMCLayoutMode : FMCEnum {}

+(FMCLayoutMode*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

/** This mode causes the interaction to display the previous set of choices as icons.
 *
 */
+(FMCLayoutMode*) ICON_ONLY;

/** This mode causes the interaction to display the previous set of choices as icons along with a search field in the HMI.
 *
 */
+(FMCLayoutMode*) ICON_WITH_SEARCH;

/** This mode causes the interaction to display the previous set of choices as a list.
 *
 */

+(FMCLayoutMode*) LIST_ONLY;

/** This mode causes the interaction to display the previous set of choices as a list along with a search field in the HMI.
 *
 */

+(FMCLayoutMode*) LIST_WITH_SEARCH;

/** This mode causes the interaction to immediately display a keyboard entry through the HMI.
 *
 */

+(FMCLayoutMode*) KEYBOARD;

@end
