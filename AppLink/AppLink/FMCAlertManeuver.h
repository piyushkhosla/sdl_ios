//  FMCAlertManeuver.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

/**
 * This will bring up an alert with information related to the next navigation
 * maneuver including potential voice navigation instructions. Shown information
 * will be taken from the FMCShowConstantTBT function
 * <p>
 * Function Group: Navigation
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUND</b>
 * <p>
 *
 * Since <b>AppLink 2.0</b><br>
 * see FMCShowConstantTBT
 */
@interface FMCAlertManeuver : FMCRPCRequest {}

/**
 * Constructs a new FMCAlertManeuver object
 */
-(id) init;
/**
 * Constructs a new FMCAlertManeuver object indicated by the NSMutableDictionary
 * parameter
 * <p>
 *
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract an array of text chunks of type FMCTTSChunk
 * @discussion a Array of FMCTTSChunk  value representing an array of text chunks
 *            of type FMCTTSChunk
 *            <p>
 *            <b>Notes: </b>Minsize=1; Maxsize=100
 */
@property(assign) NSMutableArray* ttsChunks;
/**
 * @abstract soft buttons showed along with the lert
 * @discussion an array of FMCSoftButton value. If omitted on supported displays, only the system
 * defined "Close" FMCSoftButton will be displayed
 * <b>Notes: </b>Minsize=0; Maxsize=3
 */
@property(assign) NSMutableArray* softButtons;

@end
