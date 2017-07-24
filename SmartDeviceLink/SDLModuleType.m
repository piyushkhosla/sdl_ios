//
//  SDLModuleType.m
//

#import "SDLModuleType.h"
SDLModuleType *SDLModuleType_CLIMATE = nil;
SDLModuleType *SDLModuleType_RADIO = nil;


NSArray *SDLModuleType_values = nil;

@implementation SDLModuleType

+ (SDLModuleType *)valueOf:(NSString *)value {
    for (SDLModuleType *item in SDLModuleType.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLModuleType_values == nil) {
        SDLModuleType_values = @[
                                  SDLModuleType.CLIMATE,
                                  SDLModuleType.RADIO,
                                  ];
    }
    return SDLModuleType_values;
}

+ (SDLModuleType *)CLIMATE {
    if (SDLModuleType_CLIMATE == nil) {
        SDLModuleType_CLIMATE = [[SDLModuleType alloc] initWithValue:@"CLIMATE"];
    }
    return SDLModuleType_CLIMATE;
}

+ (SDLModuleType *)RADIO {
    if (SDLModuleType_RADIO == nil) {
        SDLModuleType_RADIO = [[SDLModuleType alloc] initWithValue:@"RADIO"];
    }
    return SDLModuleType_RADIO;
}

@end
