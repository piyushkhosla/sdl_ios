//
//  SDLSeatLocationCapability.h
//  SmartDeviceLink
//

#import "SDLRPCMessage.h"

@class SDLSeatLocation;

NS_ASSUME_NONNULL_BEGIN

/**
 * Contains information about the locations of each seat.
 *
 * @since SDL 5.x
 */

@interface SDLSeatLocationCapability : SDLRPCStruct

- (instancetype)initWithColumn:(UInt8)column row:(UInt8)row level:(UInt8)level seats:(NSArray<SDLSeatLocation *> *)seats;

/**
 * number of columns
 *
 * Optional, Integer, -1 - 100
 */
@property (nullable, strong, nonatomic) NSNumber<SDLInt> *col;

/**
 * number of row
 *
 * Optional, Integer, -1 - 100
 */
@property (nullable, strong, nonatomic) NSNumber<SDLInt> *row;

/**
 * number of level
 *
 * Optional, Integer, -1 - 100
 */
@property (nullable, strong, nonatomic) NSNumber<SDLInt> *level;

/**
 * Contains a list of SeatLocation in the vehicle, the first element is the driver's seat
 *
 * Optional, Array
 */
@property (nullable, strong, nonatomic) NSArray<SDLSeatLocation *> *seats;

@end

NS_ASSUME_NONNULL_END
