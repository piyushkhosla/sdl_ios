//
//  SDLDateTime.h
//

#import "SDLRPCMessage.h"

/**
 * Note that this structure accepts time only in 24 Hr format
 *
 **/
@interface SDLDateTime : SDLRPCStruct {
}

/**
 * Constructs a newly allocated SDLDateTime object 
 */
- (instancetype)init;

/**
 * Constructs a newly allocated SDLDateTime object indicated by the dictionary parameter
 * @param dict The dictionary to use
 */
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

/**
 * @abstract Seconds part of time
 *
 * Required, Integer 0 - 999
 */
@property (strong) NSNumber *milliSeconds;

/**
 * @abstract Seconds part of time
 *
 * Required, Integer 0 - 59
 */
@property (strong) NSNumber *second;

/**
 * @abstract Minutes part of time
 *
 * Required, Integer 0 - 59
 */
@property (strong) NSNumber *minute;

/**
 * @abstract Hour part of time
 *
 * Required, Integer 0 - 23
 */
@property (strong) NSNumber *hour;

/**
 * @abstract Day of the month
 *
 * Required, Integer 1 - 31
 */
@property (strong) NSNumber *day;

/**
 * @abstract Month of the year
 *
 * Required, Integer 1 - 12
 */
@property (strong) NSNumber *month;

/**
 * @abstract The year in YYYY format
 *
 * Required, Max Value 4095
 */
@property (strong) NSNumber *year;

/**
 * @abstract Time zone offset in Hours wrt UTC
 *
 * Required, Integer -12 - 14
 */
@property (strong) NSNumber *tz_hour;

/**
 * @abstract Time zone offset in Min wrt UTC
 *
 * Required, Integer 0 - 59
 */
@property (strong) NSNumber *tz_minute;

@end
