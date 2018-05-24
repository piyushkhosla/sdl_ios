//  SDLAddSubMenu.h


#import "SDLRPCRequest.h"

@class SDLMenuParams;

/**
 * Add a SDLSubMenu to the Command Menu
 * <p>
 * A SDLSubMenu can only be added to the Top Level Menu (i.e.a SDLSubMenu cannot be
 * added to a SDLSubMenu), and may only contain commands as children
 * <p>
 * <p>
 * <b>HMILevel needs to be FULL, LIMITED or BACKGROUD</b>
 * </p>
 *
 * Since <b>SmartDeviceLink 1.0</b><br>
 * see SDLDeleteSubMenu SDLAddCommand SDLDeleteCommand
 */

NS_ASSUME_NONNULL_BEGIN

@interface SDLAddSubMenu : SDLRPCRequest

- (instancetype)initWithMenuParams:(SDLMenuParams *)menuParams;

- (instancetype)initWithId:(UInt32)menuId menuName:(NSString *)menuName __deprecated_msg("Use initWithMenuParams: menuParams:");

- (instancetype)initWithId:(UInt32)menuId menuName:(NSString *)menuName position:(UInt8)position __deprecated_msg("Use initWithMenuParams: menuParams:");

/**
 * a Menu ID that identifies a sub menu
 * @discussion This value is used in
 * <i>SDLAddCommand</i> to which SDLSubMenu is the parent of the command being added
 * <p>
 */
@property (strong, nonatomic) NSNumber<SDLInt> *menuID;

/**
 * a position of menu
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
@property (nullable, strong, nonatomic) NSNumber<SDLInt> *position __deprecated_msg("Deprecated parameter. Please use .menuParams.menuName instead.");

/**
 * a menuName which is displayed representing this submenu item
 * @discussion NSString which will be displayed representing this submenu item
 */
@property (strong, nonatomic) NSString *menuName __deprecated_msg("Deprecated parameter. Please use .menuParams.position instead.");

/**
 * @abstract A new parameter containing the data of the menu entry.
 *  */
@property (strong, nonatomic) SDLMenuParams *menuParams;

@end

NS_ASSUME_NONNULL_END
