//  FMCTextFieldName.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/**
 * Names of the text fields that can appear on a SYNC display.
 *
 * Avaliable since <font color=red><b> AppLink 1.0 </b></font>
 */
@interface FMCTextFieldName : FMCEnum {}

/**
 * Convert String to FMCTextFieldName
 * @param value String
 * @return FMCTextFieldName
 */
+(FMCTextFieldName*) valueOf:(NSString*) value;
/*!
 @abstract Store the enumeration of all possible FMCTextFieldName
 @result return an array that store all possible FMCTextFieldName
 */
+(NSMutableArray*) values;

/**
 * @abstract The first line of the first set of main fields of the persistent display. Applies to <i>Show</i>.
 * @result return a FMCTextFieldName with value of <font color=gray><i> mainField1 </i></font>
 */
+(FMCTextFieldName*) mainField1;
/**
 * @abstract The second line of the first set of main fields of the persistent display. Applies to <i>Show</i>.
 * @result return a FMCTextFieldName with value of <font color=gray><i> mainField2 </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCTextFieldName*) mainField2;
/**
 * @abstract The first line of the second set of main fields of the persistent display. Applies to <i>Show</i>.
 * @result return a FMCTextFieldName with value of <font color=gray><i> mainField3 </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCTextFieldName*) mainField3;
/**
 * @abstract The second line of the second set of main fields of the persistent display. Applies to <i>Show</i>.
 * @result return a FMCTextFieldName with value of <font color=gray><i> mainField4 </i></font>
 */
+(FMCTextFieldName*) mainField4;
/**
 * @abstract The status bar on the NGN display. Applies to <i>Show</i>.
 * @result return a FMCTextFieldName with value of <font color=gray><i> statusBar </i></font>
 */
+(FMCTextFieldName*) statusBar;
/**
 * @abstract Text value for MediaClock field. Must be properly formatted according to MediaClockFormat. Applies to <i>Show</i>.
 * @discussion This field is commonly used to show elapsed or remaining time in an audio track or audio capture.
 * @result return a FMCTextFieldName with value of <font color=gray><i> mediaClock </i></font>
 */
+(FMCTextFieldName*) mediaClock;
/**
 * @abstract The track field of NGN type ACMs. This field is only available for media applications on a NGN display. Applies to <i>Show</i>.
 * @discussion This field is commonly used to show the current track number
 * @result return a FMCTextFieldName with value of <font color=gray><i> mediaTrack </i></font>
 */
+(FMCTextFieldName*) mediaTrack;
/**
 * @abstract The first line of the alert text field. Applies to <i>Alert</i>.
 * @result return a FMCTextFieldName with value of <font color=gray><i> alertText1 </i></font>
 */
+(FMCTextFieldName*) alertText1;
/**
 * @abstract The second line of the alert text field. Applies to <i>Alert</i>.
 * @result return a FMCTextFieldName with value of <font color=gray><i> alertText2 </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCTextFieldName*) alertText2;
/**
 * @abstract The third line of the alert text field. Applies to <i>Alert</i>.
 * @result return a FMCTextFieldName with value of <font color=gray><i> alertText3 </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCTextFieldName*) alertText3;
/**
 * @abstract Long form body of text that can include newlines and tabs. Applies to ScrollableMessage (TBD)
 * @result return a FMCTextFieldName with value of <font color=gray><i> scrollableMessageBody </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCTextFieldName*) scrollableMessageBody;
/**
 * @abstract First line suggestion for a user response (in the case of VR enabled interaction).
 * @result return a FMCTextFieldName with value of <font color=gray><i> initialInteractionText </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCTextFieldName*) initialInteractionText;
/**
 * @abstract First line of navigation text.
 * @result return a FMCTextFieldName with value of <font color=gray><i> navigationText1 </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCTextFieldName*) navigationText1;
/**
 * @abstract Second  line of navigation text.
 * @result return a FMCTextFieldName with value of <font color=gray><i> navigationText2 </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCTextFieldName*) navigationText2;
/**
 * @abstract Estimated Time of Arrival time for navigation.
 * @result return a FMCTextFieldName with value of <font color=gray><i> ETA </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCTextFieldName*) ETA;
/**
 * @abstract Total distance to destination for navigation.
 * @result return a FMCTextFieldName with value of <font color=gray><i> totalDistance </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCTextFieldName*) totalDistance;
/**
 * @abstract First line of text for audio pass thru.
 * @result return a FMCTextFieldName with value of <font color=gray><i> audioPassThruDisplayText1 </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCTextFieldName*) audioPassThruDisplayText1;
/**
 * @abstract Second line of text for audio pass thru.
 * @result return a FMCTextFieldName with value of <font color=gray><i> audioPassThruDisplayText2 </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCTextFieldName*) audioPassThruDisplayText2;
/**
 * @abstract Header text for slider.
 * @result return a FMCTextFieldName with value of <font color=gray><i> sliderHeader </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCTextFieldName*) sliderHeader;
/**
 * @abstract Footer text for slider
 * @result return a FMCTextFieldName with value of <font color=gray><i> sliderFooter </i></font>
 * @since <font color=red><b> AppLink 2.0 </b></font>
 */
+(FMCTextFieldName*) sliderFooter;
+(FMCTextFieldName*) menuName;
+(FMCTextFieldName*) secondaryText;
+(FMCTextFieldName*) tertiaryText;
+(FMCTextFieldName*) menuTitle;

@end
