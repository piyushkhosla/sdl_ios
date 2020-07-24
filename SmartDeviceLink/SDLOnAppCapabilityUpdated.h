//
//  SDLOnAppCapabilityUpdated.h
//  SmartDeviceLink
//

#import <SmartDeviceLink/SmartDeviceLink.h>
@class SDLAppCapability;

/**
 * Notifies an application that  a specific app capability has changed..
 *
 * @since SDL 6.6
 */
NS_ASSUME_NONNULL_BEGIN

@interface SDLOnAppCapabilityUpdated : SDLRPCNotification

/**
 *  The app capability that has been updated
 *
 *  SDLAppServiceData, Required
 */
@property (strong, nonatomic) SDLAppCapability *appCapability;

/**
 * Convenience init for required parameters
 *
 *  @param appCapability    The app capability that has been updated
 *  @return                    A SDLOnSystemCapabilityUpdated object
 */
- (instancetype)initWithAppCapability:(SDLAppCapability *)appCapability;


@end

NS_ASSUME_NONNULL_END
