//
//  SDLSubscribeSettingDataResponse.h
//


#import "SDLRPCResponse.h"

@interface SDLSubscribeSettingDataResponse : SDLRPCResponse {
    
}

- (instancetype)init;
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

@property (strong, nonatomic) NSNumber *displayMode;
@property (strong, nonatomic) NSNumber *distanceUnit;
@property (strong, nonatomic) NSNumber *temperatureUnit;

@end
