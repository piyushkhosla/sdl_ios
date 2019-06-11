//  SDLLightControlCapabilities.h
//

#import "SDLRPCMessage.h"

@class SDLLightCapabilities;
@class SDLModuleInfo;

NS_ASSUME_NONNULL_BEGIN

@interface SDLLightControlCapabilities : SDLRPCStruct

/**
 Constructs a newly allocated SDLLightControlCapabilities object with given parameters


 @param moduleName friendly name of the light control module
 @param supportedLights array of available LightCapabilities
 @return An instance of the SDLLightControlCapabilities class
 */
- (instancetype)initWithModuleName:(NSString *)moduleName supportedLights:(NSArray<SDLLightCapabilities *> *)supportedLights __deprecated_msg("initWithModuleName:distanceUnitAvailable:temperatureUnitAvailable:displayModeUnitAvailable:moduleInfo: instead");

/**
 Constructs a newly allocated SDLLightControlCapabilities object with given parameters


 @param moduleName friendly name of the light control module
 @param supportedLights array of available LightCapabilities
 @param moduleInfo Information about a RC module, including its id.
 @return An instance of the SDLLightControlCapabilities class
 */
- (instancetype)initWithModuleName:(NSString *)moduleName supportedLights:(NSArray<SDLLightCapabilities *> *)supportedLights moduleInfo:(SDLModuleInfo *)moduleInfo;

/**
 * @abstract  The short friendly name of the light control module.
 * It should not be used to identify a module by mobile application.
 *
 * Required, Max String length 100 chars
 */
@property (strong, nonatomic) NSString *moduleName;

/**
 * @abstract  An array of available LightCapabilities that are controllable.
 *
 * Required, NSArray of type SDLLightCapabilities minsize="1" maxsize="100"
 */
@property (strong, nonatomic) NSArray<SDLLightCapabilities *> *supportedLights;

/**
 * @abstract Information about a RC module, including its id.
 *
 * Optional, SDLModuleInf o
 */
@property (nullable, strong, nonatomic) SDLModuleInfo *moduleInfo;


@end

NS_ASSUME_NONNULL_END
