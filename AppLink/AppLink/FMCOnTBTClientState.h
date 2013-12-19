//  FMCOnTBTClientState.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/FMCTBTState.h>

/**
 * <p>Notifies the application of the current TBT client status on the module.</p>
 *
 * <p></p>
 * <b>HMI Status Requirements:</b>
 * <ul>
 * HMILevel:
 * <ul><li>Can be sent with FULL, LIMITED or BACKGROUND</li></ul>
 * AudioStreamingState:
 * <ul><li>Any</li></ul>
 * SystemContext:
 * <ul><li>Any</li></ul>
 * </ul>
 * <p></p>
 * <b>Parameter List:</b>
 * <table  border="1" rules="all">
 * <tr>
 * <th>Name</th>
 * <th>Type</th>
 * <th>Description</th>
 * <th>Applink Ver Available</th>
 * </tr>
 * <tr>
 * <td>state</td>
 * <td>TBTState</td>
 * <td>Current State of TBT client.</td>
 * <td>AppLink 1.0</td>
 * </tr>
 * </table>
 * Since AppLink 1.0
 *
 */
@interface FMCOnTBTClientState: FMCRPCNotification {}

/**
 *@abstract Constructs a newly allocated FMCOnTBTClientState object
 */
-(id) init;
/**
 *@abstract Constructs a newly allocated FMCOnTBTClientState object indicated by the NSMutableDictionary parameter</p>
 *@param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract The current state of TBT client
 */
@property(assign) FMCTBTState* state;

@end

