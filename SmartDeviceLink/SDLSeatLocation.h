//
//  SDLSeatLocation.h
//  SmartDeviceLink
//

#import "SDLRPCMessage.h"

@class SDLGrid;

NS_ASSUME_NONNULL_BEGIN

/**
 * Describes the location of a seat.
 *
 * @since SDL 5.x
 */

@interface SDLSeatLocation : SDLRPCStruct

- (instancetype)initWithGrid:(SDLGrid *)grid;

/**
 * HMI shall include this parameter when publishing seat locations in capabilities. App shall include it even if it is optional.
 *
 * Optional, SDLGrid type object
 */
@property (nullable, strong, nonatomic) SDLGrid *grid;

@end

NS_ASSUME_NONNULL_END
