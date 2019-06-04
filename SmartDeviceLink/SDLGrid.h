//
//  SDLGrid.h
//  SmartDeviceLink
//

#import "SDLRPCMessage.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Describes a location (origin coordinates and span) of a vehicle component..
 *
 * @since SDL 5.x
 */

@interface SDLGrid : SDLRPCStruct

- (instancetype)initWithColumn:(UInt8)column row:(UInt8)row;

- (instancetype)initWithColumn:(UInt8)column row:(UInt8)row level:(UInt8)level colspan:(UInt8)colspan rowspan:(UInt8)rowspan levelspan:(UInt8)levelspan;

/**
 * number of columns
 *
 * Required, Integer, -1 - 100
 */
@property (strong, nonatomic) NSNumber<SDLInt> *col;

/**
 * number of row
 *
 * Required, Integer, -1 - 100
 */
@property (strong, nonatomic) NSNumber<SDLInt> *row;

/**
 * number of level
 *
 * Optional, Integer, -1 - 100
 */
@property (nullable, strong, nonatomic) NSNumber<SDLInt> *level;

/**
 * column span
 *
 * Optional, Integer, -1 - 100
 */
@property (nullable, strong, nonatomic) NSNumber<SDLInt> *colspan;

/**
 * row span
 *
 * Optional, Integer, -1 - 100
 */
@property (nullable, strong, nonatomic) NSNumber<SDLInt> *rowspan;

/**
 * level span
 *
 * Optional, Integer, -1 - 100
 */
@property (nullable, strong, nonatomic) NSNumber<SDLInt> *levelspan;


@end

NS_ASSUME_NONNULL_END
