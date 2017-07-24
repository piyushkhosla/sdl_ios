//
//  SDLVentilationMode.m
//

#import "SDLVentilationMode.h"


SDLVentilationMode *SDLVentilationMode_UPPER = nil;
SDLVentilationMode *SDLVentilationMode_LOWER = nil;
SDLVentilationMode *SDLVentilationMode_BOTH = nil;
SDLVentilationMode *SDLVentilationMode_NONE = nil;

NSArray *SDLVentilationMode_values = nil;

@implementation SDLVentilationMode

+ (SDLVentilationMode *)valueOf:(NSString *)value {
    for (SDLVentilationMode *item in SDLVentilationMode.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLVentilationMode_values == nil) {
        SDLVentilationMode_values = @[
                                  SDLVentilationMode.UPPER,
                                  SDLVentilationMode.LOWER,
                                  SDLVentilationMode.BOTH,
                                  SDLVentilationMode.NONE,
                                  ];
    }
    return SDLVentilationMode_values;
}

+ (SDLVentilationMode *)UPPER {
    if (SDLVentilationMode_UPPER == nil) {
        SDLVentilationMode_UPPER = [[SDLVentilationMode alloc] initWithValue:@"UPPER"];
    }
    return SDLVentilationMode_UPPER;
}

+ (SDLVentilationMode *)LOWER {
    if (SDLVentilationMode_LOWER == nil) {
        SDLVentilationMode_LOWER = [[SDLVentilationMode alloc] initWithValue:@"LOWER"];
    }
    return SDLVentilationMode_LOWER;
}

+ (SDLVentilationMode *)BOTH {
    if (SDLVentilationMode_BOTH == nil) {
        SDLVentilationMode_BOTH = [[SDLVentilationMode alloc] initWithValue:@"BOTH"];
    }
    return SDLVentilationMode_BOTH;
}

+ (SDLVentilationMode *)NONE {
    if (SDLVentilationMode_NONE == nil) {
        SDLVentilationMode_NONE = [[SDLVentilationMode alloc] initWithValue:@"NONE"];
    }
    return SDLVentilationMode_NONE;
}

@end
