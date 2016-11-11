//
//  SDLSettingDataType.h
//


#import "SDLEnum.h"
/**
Defines the HMI setting data types that can be published and subscribed to
 */
@interface SDLSettingDataType : SDLEnum

/**
 @abstract get SDLSettingDataType according value string
 @param value NSString
 @return SDLSettingDataType object
 */

+ (SDLSettingDataType *)valueOf:(NSString *)value;

/**
 @abstract declare an array to store all possible SDLSettingDataType values
 @return the array
 */

+ (NSArray *)values;

/**
 @return SDLSettingDataType object with string value *SETTING_DATA_DISPLAY_MODE*
 */
+ (SDLSettingDataType *)SETTING_DATA_DISPLAY_MODE;

/**
 @return SDLSettingDataType object with string value *SETTING_DATA_DISTANCE_UNIT*
 */

+ (SDLSettingDataType *)SETTING_DATA_DISTANCE_UNIT;

/**
 @return SDLSettingDataType object with string value *SETTING_DATA_TEMPERATURE_UNIT*
 */

+ (SDLSettingDataType *)SETTING_DATA_TEMPERATURE_UNIT;

@end
