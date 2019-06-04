//
//  SDLGetInteriorVehicleDataConsent.h
//  SmartDeviceLink
//

#import "SDLRPCRequest.h"
#import "SDLModuleType.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * HMI is expected to display a permission prompt to the driver showing the RC module and app details (for example, app's name).
 * The driver is expected to have an ability to grant or deny the permission.
 *
 */

@interface SDLGetInteriorVehicleDataConsent : SDLRPCRequest

- (instancetype)initWithModuleIds:(NSArray<NSString *> *)moduleIds moduleType:(SDLModuleType)moduleType;

/**
 *  Ids of a module of same type, published by System Capability.
 *
 *  Array, Required
 */
@property (strong, nonatomic) NSArray<NSString *> *moduleIds;

/**
 * The module type that the app requests to control.
 *
 */
@property (strong, nonatomic) SDLModuleType moduleType;


@end

NS_ASSUME_NONNULL_END
