//  FMCAddCommand.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCImage.h>
#import <AppLink/FMCMenuParams.h>

/**
 *
 * This class will add a command to the application's Command Menu FMCMenuParams<br>
 * <b>Note:</b> A command will be added to the end of the list of elements in
 * the Command Menu under the following conditions:
 * <li>When a FMCCommand is added with no FMCMenuParams value provided</li>
 * <li>When a FMCMenuParams value is provided with a FMCMenuParam.position value
 * greater than or equal to the number of menu items currently defined in the
 * menu specified by the FMCMenuParam.parentID value</li>
 * <br/>
 * The set of choices which the application builds using FMCAddCommand can be a
 * mixture of:
 * <li>Choices having only VR synonym definitions, but no FMCMenuParams definitions
 * </li>
 * <li>Choices having only FMCMenuParams definitions, but no VR synonym definitions
 * </li>
 * <li>Choices having both FMCMenuParams and VR synonym definitions</li>
 *
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUD</b>
 * </p>
 * Since <b>AppLink 1.0</b><br>
 * see FMCDeleteCommand FMCAddSubMenu FMCDeleteSubMenu
 */
@interface FMCAddCommand : FMCRPCRequest {}

/**
 * Constructs a new FMCAddCommand object
 */
-(id) init;
/**
 * 
 * Constructs a new FMCAddCommand object indicated by the NSMutableDictionary
 * parameter
 * 
 *
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract an Unique Command ID that identifies the command
 * @discussion Is returned in an <i>FMCOnCommand</i> notification to identify the command
 * selected by the user
 * <p>
 * <b>Notes:</b> Min Value: 0; Max Value: 2000000000
 */
@property(assign) NSNumber* cmdID;
/**
 * @abstract a <I>FMCMenuParams</I> pointer which will defined the command and how
 * it is added to the Command Menu
 * @discussion  If provided, this will define the command and how it is added to the
 * Command Menu<br/>
 * If null, commands will not be accessible through the HMI application menu
 */
@property(assign) FMCMenuParams* menuParams;
/**
 * @abstract Voice Recognition Commands
 * @discussion If provided, defines one or more VR phrases the recognition of any of
 * which triggers the <i>FMCOnCommand</i> notification with this
 * cmdID<br/>
 * If null, commands will not be accessible by voice commands (when the user
 * hits push-to-talk)
 */
@property(assign) NSMutableArray* vrCommands;
/**
 * @abstract an Image obj representing the Image obj shown along with a command
 * @discussion If provided, defines the image to be be shown along with a  command
 * Notes:   If omitted on supported displays, no (or the
 *            default if applicable) icon will be displayed
 */
@property(assign) FMCImage* cmdIcon;

@end
