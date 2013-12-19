//  FMCDeleteCommand.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

/**
 * Removes a command from the Command Menu
 * <p>
 * <b>HMI Status Requirements:</b><br/>
 * HMILevel: FULL, LIMITED or BACKGROUND<br/>
 * AudioStreamingState: N/A<br/>
 * SystemContext: Should not be attempted when VRSESSION or MENU
 * </p>
 *
 * Since <b>AppLink 1.0</b><br>
 * see FMCAddCommand FMCAddSubMenu FMCDeleteSubMenu
 */
@interface FMCDeleteCommand : FMCRPCRequest {}

/**
 * Constructs a new FMCDeleteCommand object
 */
-(id) init;
/**
 * Constructs a new FMCDeleteCommand object indicated by the NSMutableDictionary
 * parameter
 * <p>
 *
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract the Command ID that identifies the Command to be deleted from Command Menu
 * @discussion an NSNumber value representing Command ID
 *            <p>
 *            <b>Notes: </b>Min Value: 0; Max Value: 2000000000
 */
@property(assign) NSNumber* cmdID;

@end
