//
//  SDLRadioState.h
//

#import "SDLEnum.h"

@interface SDLRadioState : SDLEnum

/**
 * @abstract get SDLRadioState according value string
 *
 * @param value The value of the string to get an object for
 *
 * @return SDLRadioState object
 */
+ (SDLRadioState *)valueOf:(NSString *)value;

/**
 * @abstract declare an array to store all possible SDLRadioState values
 *
 * @return the array
 */
+ (NSArray *)values;

/**
 *  @abstract Represents Radio state as ACQUIRING
 *
 *  @return SDLRadioState: *ACQUIRING*
 */
+ (SDLRadioState *)ACQUIRING;

/**
 *  @abstract Represents Radio state as ACQUIRED
 *
 *  @return SDLRadioState: *ACQUIRED*
 */
+ (SDLRadioState *)ACQUIRED;

/**
 *  @abstract Represents Radio state as MULTICAST
 *
 *  @return SDLRadioState: *MULTICAST*
 */
+ (SDLRadioState *)MULTICAST;

/**
 *  @abstract Represents Radio state as NOT_FOUND
 *
 *  @return SDLRadioState: *NOT_FOUND*
 */
+ (SDLRadioState *)NOT_FOUND;

@end
