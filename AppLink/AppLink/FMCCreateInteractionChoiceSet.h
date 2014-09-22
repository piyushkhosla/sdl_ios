//  FMCCreateInteractionChoiceSet.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

/**
 * Creates a Choice Set which can be used in subsequent <i>
 * FMCPerformInteraction</i> Operations.
 * <p>
 * Function Group: Base
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUND</b>
 * </p>
 *
 * Since <b>AppLink 1.0</b></br>
 * see FMCDeleteInteractionChoiceSet FMCPerformInteraction
 */
@interface FMCCreateInteractionChoiceSet : FMCRPCRequest {}

/**
 * Constructs a new FMCCreateInteractionChoiceSet object
 */
-(id) init;
/**
 * Constructs a new FMCCreateInteractionChoiceSet object indicated by the
 * NSMutableDictionary parameter
 * <p>
 *
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract a unique ID that identifies the Choice Set
 * @discussion an NSNumber value representing the Choice Set ID<br>
 *            <b>Notes: </b>Min Value: 0; Max Value: 2000000000
 */
@property(strong) NSNumber* interactionChoiceSetID;
/**
 * @abstract FMCChoice Array of one or more elements
 * @discussion a Array of FMCChoice representing the array of one or more
 *            elements
 *            <p>
 *            <b>Notes: </b>Min Value: 1; Max Value: 100
 */
@property(strong) NSMutableArray* choiceSet;

@end
