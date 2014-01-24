//  FMCShowConstantTBT.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCImage.h>

/**
 * This RPC is used to update the user with navigation information for the
 * constantly shown screen (base screen), but also for the alert type screen
 * <p>
 * Function Group: Navigation
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUND</b>
 * <p>
 *
 * Since AppLink 2.0<br/>
 * See FMCAlertManeuver FMCUpdateTurnList
 */
@interface FMCShowConstantTBT : FMCRPCRequest {}

/**
 * @abstract Constructs a new FMCShowConstantTBT object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCShowConstantTBT object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract A text for navigation text field 1
 *
 * @discussion A String value representing a text for navigation text field 1
 *            <p>
 *            <b>Notes: </b>Maxlength=500
 */
@property(assign) NSString* navigationText1;
/**
 * @abstract A text for navigation text field 2
 *
 * @discussion A String value representing a text for navigation text field 2
 *            <p>
 *            <b>Notes: </b>Maxlength=500
 */
@property(assign) NSString* navigationText2;
/**
 * @abstract A text field for estimated time of arrival
 *
 * @discussion A String value representing a text field for estimated time of
 *            arrival
 *            <p>
 *            <b>Notes: </b>Maxlength=500
 */
@property(assign) NSString* eta;
/**
 * @abstract A text field for total distance
 *
 * @discussion A String value representing a text field for total distance
 *            <p>
 *            <b>Notes: </b>Maxlength=500
 */
@property(assign) NSString* totalDistance;
/**
 * @abstract An Image for turnicon
 *
 */
@property(assign) FMCImage* turnIcon;
/**
 * @abstract A Fraction of distance till next maneuver
 *
 * @discussion A float value representing a Fraction of distance till next
 *            maneuver
 *            <p>
 *            <b>Notes: </b>Minvalue=0; Maxvalue=1000000000
 */
@property(assign) NSNumber* distanceToManeuver;
/**
 * @abstract A Distance till next maneuver (starting from) from previous maneuver
 * @discussion A float value representing a Distance till next maneuver
 *            (starting from) from previous maneuver
 *            <p>
 *            <b>Notes: </b>Minvalue=0; Maxvalue=1000000000
 */
@property(assign) NSNumber* distanceToManeuverScale;
/**
 * @abstract A maneuver complete flag. If and when a maneuver has completed while
 * an AlertManeuver is active, the app must send this value set to TRUE in
 * order to clear the AlertManeuver overlay<br/>
 * If omitted the value will be assumed as FALSE
 */
@property(assign) NSNumber* maneuverComplete;
/**
 * @abstract Three dynamic SoftButtons available (first SoftButton is fixed to
 * "Turns"). If omitted on supported displays, the currently displayed
 * SoftButton values will not change
 * <p>
 * <b>Notes: </b>Minsize=0; Maxsize=3
 */
@property(assign) NSMutableArray* softButtons;

@end
