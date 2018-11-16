//
//  SDLShowAppMenu.h
//  SmartDeviceLink
//

#import "SDLRPCRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDLShowAppMenu : SDLRPCRequest

- (instancetype)initWithMenuID:(UInt32)menuId;

/**
 * If omitted the HMI opens the apps menu.
 * If set to a sub-menu ID the HMI opens the
 * corresponding sub-menu
 * previously added using `AddSubMenu`.
 */
@property (strong, nonatomic) NSNumber<SDLInt> *menuID;

@end
NS_ASSUME_NONNULL_END
