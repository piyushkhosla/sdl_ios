//
//  SDLAppCapability.h
//  SmartDeviceLink
//

#import "SDLRPCRequest.h"
#import "SDLAppCapabilityType.h"

@class SDLVideoStreamingCapability;

NS_ASSUME_NONNULL_BEGIN

@interface SDLAppCapability : SDLRPCStruct

/**
 *  Convenience init.
 *
 *  @param appCapabilityType          app Capability Type
 *  @return                     A SDLAppCapability object
 */
- (instancetype)initWithAppCapabilityType:(SDLAppCapabilityType)appCapabilityType NS_DESIGNATED_INITIALIZER;

/**
 *  Convenience init for all parameters.
 *
 *  @param appCapabilityType          app Capability Type
 *  @param videoStreamingCapability   supported capabilities for app Capability Type
 *  @return                         A SDLAppCapability object
 */
- (instancetype)initWithAppCapabilityType:(SDLAppCapabilityType)appCapabilityType videoStreamingCapability:(SDLVideoStreamingCapability *)videoStreamingCapability;

/**
 *  Used as a descriptor of what data to expect in this struct.
 *  The corresponding param to this enum should be included and the only other param included.
 *
 *  SDLAppCapabilityType, Required
 */
@property (strong, nonatomic) SDLAppCapabilityType appCapabilityType;

/**
 *  Describes supported capabilities for video streaming
 *
 *  VideoStreamingCapability, optional
 */
@property (nullable, strong, nonatomic) SDLVideoStreamingCapability *videoStreamingCapability;

@end

NS_ASSUME_NONNULL_END
