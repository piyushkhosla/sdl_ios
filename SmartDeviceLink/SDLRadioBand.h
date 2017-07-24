//
//  SDLRadioBand.h
//

#import "SDLEnum.h"

@interface SDLRadioBand : SDLEnum

/**
 * @abstract get SDLRadioBand according value string
 *
 * @param value The value of the string to get an object for
 *
 * @return SDLRadioBand object
 */
+ (SDLRadioBand *)valueOf:(NSString *)value;

/**
 * @abstract declare an array to store all possible SDLRadioBand values
 *
 * @return the array
 */
+ (NSArray *)values;

/**
 *  @abstract Represents AM radio band
 *
 *  @return SDLRadioBand: *AM*
 */
+ (SDLRadioBand *)AM;

/**
 *  @abstract Represents FM radio band
 *
 *  @return SDLRadioBand: *FM*
 */
+ (SDLRadioBand *)FM;
/**
 *  @abstract Represents XM radio band
 *
 *  @return SDLRadioBand: *XM*
 */
+ (SDLRadioBand *)XM;


@end
