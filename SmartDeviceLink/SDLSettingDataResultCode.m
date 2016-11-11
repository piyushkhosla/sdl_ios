//
//  SDLSettingDataResultCode.m
//

#import "SDLSettingDataResultCode.h"

SDLSettingDataResultCode *SDLSettingDataResultCode_SUCCESS = nil;
SDLSettingDataResultCode *SDLSettingDataResultCode_INVALID_ID = nil;
SDLSettingDataResultCode *SDLSettingDataResultCode_SETTING_DATA_NOT_AVAILABLE = nil;
SDLSettingDataResultCode *SDLSettingDataResultCode_DATA_ALREADY_SUBSCRIBED = nil;
SDLSettingDataResultCode *SDLSettingDataResultCode_DATA_NOT_SUBSCRIBED = nil;
SDLSettingDataResultCode *SDLSettingDataResultCode_IGNORED = nil;

NSArray *SDLSettingDataResultCode_values = nil;

@implementation SDLSettingDataResultCode


+ (SDLSettingDataResultCode *)valueOf:(NSString *)value {
    for (SDLSettingDataResultCode *item in SDLSettingDataResultCode.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLSettingDataResultCode_values == nil) {
        SDLSettingDataResultCode_values = @[
                                            SDLSettingDataResultCode.SUCCESS,
                                            SDLSettingDataResultCode.INVALID_ID,
                                            SDLSettingDataResultCode.SETTING_DATA_NOT_AVAILABLE,
                                            SDLSettingDataResultCode.DATA_ALREADY_SUBSCRIBED,
                                            SDLSettingDataResultCode.DATA_NOT_SUBSCRIBED,
                                            SDLSettingDataResultCode.IGNORED
                                            ];
    }
    return SDLSettingDataResultCode_values;
}

+ (SDLSettingDataResultCode *)SUCCESS {
    if (SDLSettingDataResultCode_SUCCESS == nil) {
        SDLSettingDataResultCode_SUCCESS = [[SDLSettingDataResultCode alloc] initWithValue:@"SUCCESS"];
    }
    return SDLSettingDataResultCode_SUCCESS;
}

+ (SDLSettingDataResultCode *)INVALID_ID {
    if (SDLSettingDataResultCode_INVALID_ID == nil) {
        SDLSettingDataResultCode_INVALID_ID = [[SDLSettingDataResultCode alloc] initWithValue:@"INVALID_ID"];
    }
    return SDLSettingDataResultCode_INVALID_ID;
}

+ (SDLSettingDataResultCode *)SETTING_DATA_NOT_AVAILABLE {
    if (SDLSettingDataResultCode_SETTING_DATA_NOT_AVAILABLE == nil) {
        SDLSettingDataResultCode_SETTING_DATA_NOT_AVAILABLE = [[SDLSettingDataResultCode alloc] initWithValue:@"SETTING_DATA_NOT_AVAILABLE"];
    }
    return SDLSettingDataResultCode_SETTING_DATA_NOT_AVAILABLE;
}

+ (SDLSettingDataResultCode *)DATA_ALREADY_SUBSCRIBED {
    if (SDLSettingDataResultCode_DATA_ALREADY_SUBSCRIBED == nil) {
        SDLSettingDataResultCode_DATA_ALREADY_SUBSCRIBED = [[SDLSettingDataResultCode alloc] initWithValue:@"DATA_ALREADY_SUBSCRIBED"];
    }
    return SDLSettingDataResultCode_DATA_ALREADY_SUBSCRIBED;
}

+ (SDLSettingDataResultCode *)DATA_NOT_SUBSCRIBED {
    if (SDLSettingDataResultCode_DATA_NOT_SUBSCRIBED == nil) {
        SDLSettingDataResultCode_DATA_NOT_SUBSCRIBED = [[SDLSettingDataResultCode alloc] initWithValue:@"DATA_NOT_SUBSCRIBED"];
    }
    return SDLSettingDataResultCode_DATA_NOT_SUBSCRIBED;
}

+ (SDLSettingDataResultCode *)IGNORED {
    if (SDLSettingDataResultCode_IGNORED == nil) {
        SDLSettingDataResultCode_IGNORED = [[SDLSettingDataResultCode alloc] initWithValue:@"IGNORED"];
    }
    return SDLSettingDataResultCode_IGNORED;
}

@end
