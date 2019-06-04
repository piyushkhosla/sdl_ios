//
//  SDLReleaseInteriorVehicleDataModule.h
//  SmartDeviceLink
//

#import "SDLRPCRequest.h"

#import "SDLModuleType.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDLReleaseInteriorVehicleDataModule : SDLRPCRequest

- (instancetype)initWithModuleType:(SDLModuleType)moduleType;

- (instancetype)initWithModuleType:(SDLModuleType)moduleType ModuleId:(nullable NSString *)moduleID;

/**
 * The module type that the app requests to control.
 *
 */
@property (strong, nonatomic) SDLModuleType moduleType;

/**
 *  Id of a module, published by System Capability.
 *
 *  NSString, Required  Max length 100 chars.
 */
@property (strong, nonatomic, nullable) NSString *moduleId;


@end

NS_ASSUME_NONNULL_END
