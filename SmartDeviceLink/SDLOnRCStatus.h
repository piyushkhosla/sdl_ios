//  SDLOnRCStatus.h
//

#import <SmartDeviceLink/SmartDeviceLink.h>

@class SDLModuleData;

/**
 * OnRCStatus notifications to all registered mobile applications and the HMI whenever
 * (1) SDL allocates a module to an application or
 * (2) it de-allocates a module from an application, or
 * (3) an application registers with SDL
 *
 */

NS_ASSUME_NONNULL_BEGIN

@interface SDLOnRCStatus : SDLRPCNotification

/**
 * @abstract Contains a list (zero or more) of module types that
 * are allocated to the application.
 *
 * Required, Array of SDLModuleData, Array size 0 - 100
 *
 * @see SDLPermissionItem
 */
@property (strong, nonatomic) NSArray<SDLModuleData *> *allocatedModules;

/**
 * @abstract Contains a list (zero or more) of module types that are free to access for the application.
 *
 * Required, Array of SDLModuleData, Array size 0 - 100
 *
 * @see SDLPermissionItem
 */
@property (strong, nonatomic) NSArray<SDLModuleData *> *freeModules;

NS_ASSUME_NONNULL_END

@end
