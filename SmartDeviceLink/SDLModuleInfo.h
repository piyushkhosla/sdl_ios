//
//  SDLModuleInfo.h
//  SmartDeviceLink
//

#import "SDLRPCMessage.h"

@class SDLGrid;

NS_ASSUME_NONNULL_BEGIN

/**
 * Information about a RC module.
 *
 * @since SDL 5.x
 */

@interface SDLModuleInfo : SDLRPCStruct

- (instancetype)initWithModuleId:(NSString *)moduleId;

- (instancetype)initWithModuleId:(NSString *)moduleId location:(SDLGrid *)location serviceArea:(SDLGrid *)serviceArea allowMultipleAccess:(BOOL)allowMultipleAccess;

/**
 * uuid of a module. "moduleId + moduleType" uniquely identify a module.
 *
 * Required, max length 100 characters
 */
@property (strong, nonatomic) NSString *moduleId;

/**
 * Location of a module.
 *
 * Optional, SDLGrid type object
 */
@property (nullable, strong, nonatomic) SDLGrid *location;

/**
 * uuid of a module. "moduleId + moduleType" uniquely identify a module.
 *
 * Required, max length 100 characters
 */
@property (nullable, strong, nonatomic) SDLGrid *serviceArea;

/**
 *  Allow multiple users/apps to access the module or not.
 */
@property (nullable, strong, nonatomic) NSNumber<SDLBool> *allowMultipleAccess;

@end

NS_ASSUME_NONNULL_END
