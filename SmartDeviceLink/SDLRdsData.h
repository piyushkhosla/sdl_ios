//
//  SDLRdsData.h
//

#import "SDLRPCMessage.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDLRdsData : SDLRPCStruct


/**
 * @abstract Program Service Name
 *
 * optional, 0-8 length
 */
@property (nullable, strong, nonatomic) NSString *PS;

/**
 * @abstract Radio Text
 *
 * optional, 0-64 length
 */
@property (nullable, strong, nonatomic) NSString *RT;

/**
 * @abstract The clock text in UTC format as YYYY-MM-DDThh:mm:ss.sTZD
 *
 * optional, 24 length
 */
@property (nullable, strong, nonatomic) NSString *CT;

/**
 * @abstract  Program Identification - the call sign for the radio station
 *
 * optional, 0-6 length
 */
@property (nullable, strong, nonatomic) NSString *PI;

/**
 * @abstract The program type - The region should be used to differentiate between EU
 * and North America program types
 *
 * optional, 0-8 length
 */
@property (nullable, strong, nonatomic) NSNumber *PTY;

/**
 * @abstract Traffic Program Identification - Identifies a station that offers traffic
 *
 * optional, Boolean
 */
@property (nullable, strong, nonatomic) NSNumber *TP;

/**
 * @abstract Traffic Announcement Identification - Indicates an ongoing traffic announcement
 *
 * optional, Boolean
 */
@property (nullable, strong, nonatomic) NSNumber *TA;

/**
 * @abstract Region
 *
 * optional, 0-8 length
 */
@property (nullable, strong, nonatomic) NSString *REG;

@end

NS_ASSUME_NONNULL_END
