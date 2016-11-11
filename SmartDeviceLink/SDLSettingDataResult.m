//
//  SDLSettingDataResult.måå
//

#import "SDLSettingDataResult.h"

#import "SDLSettingDataType.h"
#import "SDLSettingDataResultCode.h"
#import "SDLNames.h"

@implementation SDLSettingDataResult

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (instancetype)initWithDictionary:(NSMutableDictionary *)dict {
    if (self = [super initWithDictionary:dict]) {
    }
    return self;
}

- (void)setDataType:(SDLSettingDataType *)dataType {
    if (dataType != nil) {
        [store setObject:dataType forKey:NAMES_dataType];
    } else {
        [store removeObjectForKey:NAMES_dataType];
    }
}

- (SDLSettingDataType *)dataType {
    NSObject *obj = [store objectForKey:NAMES_dataType];
    if (obj == nil || [obj isKindOfClass:SDLSettingDataType.class]) {
        return (SDLSettingDataType *)obj;
    } else {
        return [SDLSettingDataType valueOf:(NSString *)obj];
    }
}

- (void)setResultCode:(SDLSettingDataResultCode *)resultCode {
    if (resultCode != nil) {
        [store setObject:resultCode forKey:NAMES_resultCode];
    } else {
        [store removeObjectForKey:NAMES_resultCode];
    }
}

- (SDLSettingDataResultCode *)resultCode {
    NSObject *obj = [store objectForKey:NAMES_dataType];
    if (obj == nil || [obj isKindOfClass:SDLSettingDataResultCode.class]) {
        return (SDLSettingDataResultCode *)obj;
    } else {
        return [SDLSettingDataResultCode valueOf:(NSString *)obj];
    }
}

@end
