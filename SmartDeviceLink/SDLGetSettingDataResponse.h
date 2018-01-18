//
//  SDLGetSettingDataResponse.h
//


#import "SDLRPCResponse.h"

@interface SDLGetSettingDataResponse : SDLRPCResponse {

}

- (instancetype)init;
- (instancetype)initWithDictionary:(NSMutableDictionary *)dict;

@property (strong, nonatomic) NSNumber *displayMode;
@property (strong, nonatomic) NSNumber *distanceUnit;
@property (strong, nonatomic) NSNumber *temperatureUnit;

@end
