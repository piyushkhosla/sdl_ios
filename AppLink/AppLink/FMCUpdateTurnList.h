//  FMCUpdateTurnList.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

/**
 * Updates the list of next maneuvers, which can be requested by the user
 * pressing the softbutton "Turns" on the Navigation base screen. Three
 * softbuttons are predefined by the system: Up, Down, Close
 * <p>
 * Function Group: Navigation
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUND</b>
 * <p>
 *
 * Since AppLink 2.0
 * See FMCShowConstantTBT
 */
@interface FMCUpdateTurnList : FMCRPCRequest {}

/**
 * @abstract Constructs a new FMCUpdateTurnList object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCUpdateTurnList object indicated by the NSMutableDictionary parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract A list of turns to be shown to the user
 * @discussion A Vector<Turn> value representing a list of turns to be shown
 *            to the user
 *            <p>
 *            <b>Notes: </b>Minsize=1; Maxsize=100
 */
@property(assign) NSMutableArray* turnList;
@property(assign) NSMutableArray* softButtons;

@end
