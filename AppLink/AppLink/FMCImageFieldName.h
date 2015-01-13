//  FMCImageFieldName.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/** The name that identifies the filed.
 *
 *
 * @Since AppLink 3.0
 *
 */
@interface FMCImageFieldName : FMCEnum {}

+(FMCImageFieldName*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

/** The image field for SoftButton
 *
 */
+(FMCImageFieldName*) softButtonImage;

/** The first image field for Choice.
 *
 */
+(FMCImageFieldName*) choiceImage;

/** The scondary image field for Choice.
 *
 */
+(FMCImageFieldName*) choiceSecondaryImage;

/** The image field for vrHelpItem.
 *
 */
+(FMCImageFieldName*) vrHelpItem;

/** The image field for Turn.
 *
 */

+(FMCImageFieldName*) turnIcon;

/** The image field for the menu icon in SetGlobalProperties.
 *
 */
+(FMCImageFieldName*) menuIcon;

/** The image filed for AddCommand.
 *
 */

+(FMCImageFieldName*) cmdIcon;

/** The iamage field for the app icon ( set by setAppIcon).
 *
 */
+(FMCImageFieldName*) appIcon;

/** The image filed for Show.
 *
 */
+(FMCImageFieldName*) graphic;

/** The primary image field for ShowConstant TBT.
 *
 */
+(FMCImageFieldName*) showConstantTBTIcon;

/** The secondary image field for ShowConstant TBT.
 *
 */
+(FMCImageFieldName*) showConstantTBTNextTurnIcon;

@end
