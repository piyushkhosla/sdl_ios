//  FMCAddSubMenu.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

/**
 * Add a FMCSubMenu to the Command Menu
 * <p>
 * A FMCSubMenu can only be added to the Top Level Menu (i.e.a FMCSubMenu cannot be
 * added to a FMCSubMenu), and may only contain commands as children
 * <p>
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUD</b>
 * </p>
 *
 * Since <b>AppLink 1.0</b><br>
 * see FMCDeleteSubMenu FMCAddCommand FMCDeleteCommand
 */
@interface FMCAddSubMenu : FMCRPCRequest {}

/**
 * Constructs a new FMCAddSubMenu object
 */
-(id) init;
/**
 * Constructs a new FMCAddSubMenu object indicated by the NSMutableDictionary parameter
 * <p>
 *
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

/**
 * @abstract a Menu ID that identifies a sub menu
 * @discussion This value is used in
 * <i>FMCAddCommand</i> to which FMCSubMenu is the parent of the command being added
 * <p>
 */
@property(strong) NSNumber* menuID;
/**
 * @abstract a position of menu
 * @discussion An NSNumber pointer representing the position within the items
 *            of the top level Command Menu. 0 will insert at the front, 1
 *            will insert after the first existing element, etc. Position of
 *            any submenu will always be located before the return and exit
 *            options
 *            <p>
 *            <b>Notes: </b><br/>
 *            <ul>
 *            <li>
 *            Min Value: 0; Max Value: 1000</li>
 *            <li>If position is greater or equal than the number of items
 *            on top level, the sub menu will be appended by the end</li>
 *            <li>If this parameter is omitted, the entry will be added at
 *            the end of the list</li>
 *            </ul>
 */
@property(strong) NSNumber* position;
/**
 * @abstract a menuName which is displayed representing this submenu item
 * @discussion NSString which will be displayed representing this submenu item
 */
@property(strong) NSString* menuName;

@end
