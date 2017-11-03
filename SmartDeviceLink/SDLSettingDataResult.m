//
//  SDLSettingDataResult.måå
//

#import "SDLSettingDataResult.h"
#import "NSMutableDictionary+Store.h"
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

- (void)setDataType:(nullable SDLSettingDataType)dataType {
    [store sdl_setObject:dataType forName:SDLNameDataType];
}

- (nullable SDLSettingDataType )dataType {
    return [store sdl_objectForName:SDLNameDataType];
}

- (void)setResultCode:(nullable SDLSettingDataResultCode )resultCode {
    [store sdl_setObject:resultCode forName:SDLNameResultCode];
}

- (SDLSettingDataResultCode )resultCode {
    return [store sdl_objectForName:SDLNameResultCode];
}

@end
