//
//  SDLSettingDataResultCode.h
//


#import "SDLEnum.h"
/**
 Enumeration that describes possible result codes of a setting data entry request.
 **/
@interface SDLSettingDataResultCode : SDLEnum

/**
 @abstract get SDLSettingDataResultCode according value string
 @param value NSString
 @return SDLSettingDataResultCode object
 */
+ (SDLSettingDataResultCode *)valueOf:(NSString *)value;

/**
 @abstract declare an array to store all possible SDLSettingDataResultCode values
 @return the array
 */
+ (NSArray *)values;

/**
 @abstract Individual setting data item request or subscription successful
 */
+ (SDLSettingDataResultCode *)SUCCESS;

/**
 @abstract The requested setting data is not a valid ID on the system.
 */
+ (SDLSettingDataResultCode *)INVALID_ID;

/**
 @abstract The requested setting data item is not available for current HMI type.
 */
+ (SDLSettingDataResultCode *)SETTING_DATA_NOT_AVAILABLE;

/**
 @abstract The setting data item is already subscribed.
 */
+ (SDLSettingDataResultCode *)DATA_ALREADY_SUBSCRIBED;

/**
 @abstract The setting data item cannot be unsubscribed because it is not currently subscribed.
 */
+ (SDLSettingDataResultCode *)DATA_NOT_SUBSCRIBED;

/**
 @abstract The request for this item is ignored because it is already in progress.
 */
+ (SDLSettingDataResultCode *)IGNORED;
@end
