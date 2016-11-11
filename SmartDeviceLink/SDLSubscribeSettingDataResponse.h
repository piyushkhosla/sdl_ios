//
//  SDLSubscribeSettingDataResponse.h
//


#import "SDLRPCResponse.h"

@interface SDLSubscribeSettingDataResponse : SDLRPCResponse {
    
}

- (instancetype)init;
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

@property (strong) NSNumber *displayMode;
@property (strong) NSNumber *distanceUnit;
@property (strong) NSNumber *temperatureUnit;

@end
