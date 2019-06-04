//
//  SDLGetInteriorVehicleDataConsentResponse.h
//  SmartDeviceLink
//

#import "SDLRPCResponse.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDLGetInteriorVehicleDataConsentResponse : SDLRPCResponse

/**
 * This array has the same size as "moduleIds" in the request; each element corresponding to one moduleId
 * "true" - if the driver grants the permission for controlling the named app;
 * "false" - in case the driver denies the permission for controlling the named app.

 * Required, Boolean
 */
@property (strong, nonatomic) NSArray <NSNumber<SDLBool> *> *allowed;

@end

NS_ASSUME_NONNULL_END
