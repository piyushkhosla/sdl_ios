//
//  SDLUnsubscribeSettingDataResponse.h
//


#import "SDLRPCResponse.h"

@interface SDLUnsubscribeSettingDataResponse : SDLRPCResponse {
}

- (instancetype)init;
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

@property (strong) NSNumber *displayMode;
@property (strong) NSNumber *distanceUnit;
@property (strong) NSNumber *temperatureUnit;

@end
