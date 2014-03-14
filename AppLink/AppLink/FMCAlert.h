//  FMCAlert.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

/**
 * Provides information to the user using either TTS, the Display or both and
 * can include a system-generated alert tone
 * <p>
 * <ul>
 * <li>The displayed portion of the FMCAlert, if any, will persist until the
 * specified timeout has elapsed, or the FMCAlert is preempted</li>
 * <li>An FMCAlert will preempt (abort) any AppLink Operation that is in-progress,
 * except an already-in-progress FMCAlert</li>
 * <li>An FMCAlert cannot be preempted by any AppLink Operation</li>
 * <li>An FMCAlert can be preempted by a user action (button push)</li>
 * <li>An FMCAlert will fail if it is issued while another FMCAlert is in progress</li>
 * <li>Although each Alert parameter is optional, in fact each FMCAlert request
 * must supply at least one of the following parameters:<br/>
 * <ul>
 * <li>alertText1</li>
 * <li>alertText2</li>
 * <li>alertText3</li>
 * <li>ttsChunks</li>
 * </ul>
 * </li>
 * </ul>
 * <br/>
 * <b>HMILevel needs to be FULL or LIMITED.</b><br/>
 * <b>If the app has been granted function group Notification the FMCHMILevel can
 * also be BACKGROUND</b><br/>
 *
 * Since <b>AppLink 1.0<b><br>
 * see FMCShow FMCSpeak
 */
@interface FMCAlert : FMCRPCRequest {}

/**
 * Constructs a new FMCAlert object
 */
-(id) init;
/**
 * Constructs a new FMCAlert object indicated by the NSMutableDictionary parameter
 * <p>
 *
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract the String to be displayed in the first field of the display during
 * the FMCAlert
 * @discussion 
 *            <b>Notes: </b><br/>
 *            <ul>
 *            <li>Length is limited to what is indicated in <i>
 *            FMCRegisterAppInterface</i> response</li>
 *            <li>If omitted, top display line will be cleared</li>
 *            <li>Text is always centered</li>
 *            </ul>
 */
@property(assign) NSString* alertText1;
/**
 * @abstract the String to be displayed in the second field of the display during
 * the Alert
 * @discussion <b>Notes: </b><br/>
 *            <ul>
 *            <li>Only permitted if HMI supports a second display line</li>
 *            <li>Length is limited to what is indicated in <i>
 *            FMCRegisterAppInterface</i> response</li>
 *            <li>If omitted, second display line will be cleared</li>
 *            <li>Text is always centered</li>
 *            </ul>
 */
@property(assign) NSString* alertText2;
/**
 * @abstract the String to be displayed in the third field of the display during
 * the FMCAlert
 * @discussion <b>Notes: </b><br/>
 *            <ul>
 *            <li>Only permitted if HMI supports a third display line</li>
 *            <li>Length is limited to what is indicated in <i>
 *            FMCRegisterAppInterface</i> response</li>
 *            <li>If omitted, third display line will be cleared</li>
 *            <li>Text is always centered</li>
 *            </ul>
 */
@property(assign) NSString* alertText3;
/**
 * @abstract a NSMutableArray which, taken together, specify what is to be
 * spoken to the user
 * @discussion <b>Notes: </b>Array must have a least one element
 */
@property(assign) NSMutableArray* ttsChunks;
/**
 * @abstract the duration of the displayed portion of the alert, in milliseconds.
 * After this amount of time has passed, the display fields alertText1 and
 * alertText2 will revert to what was displayed in those fields before the
 * alert began
 * @discussion the NSNumber values representing the duration time, in
 *            milliseconds
 *            <p>
 *            <b>Notes: </b><br/>
 *            <ul>
 *            <li>Min Value: 3000; Max Value: 10000</li>
 *            <li>If omitted, the default is 5000 milliseconds</li>
 *            </ul>
 */
@property(assign) NSNumber* duration;
/**
 * @abstract whether the alert tone should be played before the TTS (if any) is
 * spoken
 * @discussion a value which specifies whether the alert tone should
 *            be played before the TTS (if any) is spoken
 *            <p>
 *            <b>Notes: </b>If omitted, default is true
 */
@property(assign) NSNumber* playTone;
/**
 * @abstract the SoftButtons Array
 * @discussion <b>Notes: </b><br/>
 *            <ul>
 *            <li>If omitted on supported displays, the alert will not have
 *            any SoftButton</li>
 *            <li>ArrayMin: 0</li>
 *            <li>ArrayMax: 4</li>
 *            </ul>
 * @since AppLink 2.0
 */
@property(assign) NSNumber* progressIndicator;
@property(assign) NSMutableArray* softButtons;

@end
