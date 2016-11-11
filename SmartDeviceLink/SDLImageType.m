//  SDLImageType.m
//


#import "SDLImageType.h"

SDLImageType *SDLImageType_STATIC = nil;
SDLImageType *SDLImageType_DYNAMIC = nil;
SDLImageType *SDLImageType_TEMPLATE = nil;

NSArray *SDLImageType_values = nil;

@implementation SDLImageType

+ (SDLImageType *)valueOf:(NSString *)value {
    for (SDLImageType *item in SDLImageType.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLImageType_values == nil) {
        SDLImageType_values = @[
            SDLImageType.STATIC,
            SDLImageType.DYNAMIC,
            SDLImageType.TEMPLATE
        ];
    }
    return SDLImageType_values;
}

+ (SDLImageType *)STATIC {
    if (SDLImageType_STATIC == nil) {
        SDLImageType_STATIC = [[SDLImageType alloc] initWithValue:@"STATIC"];
    }
    return SDLImageType_STATIC;
}

+ (SDLImageType *)DYNAMIC {
    if (SDLImageType_DYNAMIC == nil) {
        SDLImageType_DYNAMIC = [[SDLImageType alloc] initWithValue:@"DYNAMIC"];
    }
    return SDLImageType_DYNAMIC;
}

+ (SDLImageType *)TEMPLATE {
    if (SDLImageType_TEMPLATE == nil) {
        SDLImageType_TEMPLATE = [[SDLImageType alloc] initWithValue:@"TEMPLATE"];
    }
    return SDLImageType_TEMPLATE;
}
@end
