//
//  SDLSettingDataType.m
//

#import "SDLSettingDataType.h"

SDLSettingDataType *SDLSettingDataType_SETTING_DATA_DISPLAY_MODE = nil;
SDLSettingDataType *SDLSettingDataType_SETTING_DATA_DISTANCE_UNIT = nil;
SDLSettingDataType *SDLSettingDataType_SETTING_DATA_TEMPERATURE_UNIT = nil;

NSArray *SDLSettingDataType_values = nil;

@implementation SDLSettingDataType

+ (SDLSettingDataType *)valueOf:(NSString *)value {
    for (SDLSettingDataType *item in SDLSettingDataType.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLSettingDataType_values == nil) {
        SDLSettingDataType_values = @[
                                      SDLSettingDataType.SETTING_DATA_DISPLAY_MODE,
                                      SDLSettingDataType.SETTING_DATA_DISTANCE_UNIT,
                                      SDLSettingDataType.SETTING_DATA_TEMPERATURE_UNIT
                                      ];
    }
    return SDLSettingDataType_values;
}

+ (SDLSettingDataType *)SETTING_DATA_DISPLAY_MODE {
    if (SDLSettingDataType_SETTING_DATA_DISPLAY_MODE == nil) {
        SDLSettingDataType_SETTING_DATA_DISPLAY_MODE = [[SDLSettingDataType alloc] initWithValue:@"SETTING_DATA_DISPLAY_MODE"];
    }
    return SDLSettingDataType_SETTING_DATA_DISPLAY_MODE;
}

+ (SDLSettingDataType *)SETTING_DATA_DISTANCE_UNIT {
    if (SDLSettingDataType_SETTING_DATA_DISTANCE_UNIT == nil) {
        SDLSettingDataType_SETTING_DATA_DISTANCE_UNIT = [[SDLSettingDataType alloc] initWithValue:@"SETTING_DATA_DISTANCE_UNIT"];
    }
    return SDLSettingDataType_SETTING_DATA_DISTANCE_UNIT;
}

+ (SDLSettingDataType *)SETTING_DATA_TEMPERATURE_UNIT {
    if (SDLSettingDataType_SETTING_DATA_TEMPERATURE_UNIT == nil) {
        SDLSettingDataType_SETTING_DATA_TEMPERATURE_UNIT = [[SDLSettingDataType alloc] initWithValue:@"SETTING_DATA_TEMPERATURE_UNIT"];
    }
    return SDLSettingDataType_SETTING_DATA_TEMPERATURE_UNIT;
}

@end
