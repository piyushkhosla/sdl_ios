//  SDLGPSDataType.m
//

#import "NSMutableDictionary+Store.h"
#import "SDLGPSDataType.h"
#import "SDLGPSData.h"
#import "SDLTimeStampType.h"
#import "SDLNames.h"

@implementation SDLGPSDataType

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

- (void)setValue:(SDLGPSData *)value {
    [store sdl_setObject:value forName:SDLNameValue];
}
- (SDLGPSData *)value {
    return [store sdl_objectForName:SDLNameValue];
}

- (void)setTimeStamp:(SDLTimeStampType *)timeStamp {
    [store sdl_setObject:timeStamp forName:SDLNameTimestamp];
}

- (SDLTimeStampType *)timeStamp {
    return [store sdl_objectForName:SDLNameTimestamp];
}

@end

