//  SDLAxisSensorDataType.m
//

#import "NSMutableDictionary+Store.h"
#import "SDLAxisSensorDataType.h"
#import "SDLAxisSensorData.h"
#import "SDLTimeStampType.h"
#import "SDLNames.h"

@implementation SDLAxisSensorDataType

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

- (void)setValue:(SDLAxisSensorData *)value {
    [store sdl_setObject:value forName:SDLNameValue];
}

- (SDLAxisSensorData *)value {
    return [store sdl_objectForName:SDLNameValue ofClass:SDLAxisSensorData.class];
}

- (void)setTimeStamp:(SDLTimeStampType *)timeStamp {
    [store sdl_setObject:timeStamp forName:SDLNameTimestamp];
}

- (SDLTimeStampType *)timeStamp {
    return [store sdl_objectForName:SDLNameTimestamp ofClass:SDLTimeStampType.class];
}
@end

