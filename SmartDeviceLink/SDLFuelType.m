//
//  SDLFuelType.m
//

#import "SDLFuelType.h"

SDLFuelType *SDLFuelType_GASOLINE = nil;
SDLFuelType *SDLFuelType_DIESEL = nil;
SDLFuelType *SDLFuelType_CNG = nil;
SDLFuelType *SDLFuelType_LPG = nil;
SDLFuelType *SDLFuelType_HYDROGEN = nil;
SDLFuelType *SDLFuelType_BATTERY = nil;


NSArray *SDLFuelType_values = nil;

@implementation SDLFuelType

+ (SDLFuelType *)valueOf:(NSString *)value {
    for (SDLFuelType *item in SDLFuelType.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLFuelType_values == nil) {
        SDLFuelType_values = @[
                               SDLFuelType.GASOLINE,
                               SDLFuelType.DIESEL,
                               SDLFuelType.CNG,
                               SDLFuelType.LPG,
                               SDLFuelType.HYDROGEN,
                               SDLFuelType.BATTERY
                               ];
    }
    return SDLFuelType_values;
}

+ (SDLFuelType *)GASOLINE {
    if (SDLFuelType_GASOLINE == nil) {
        SDLFuelType_GASOLINE = [[SDLFuelType alloc] initWithValue:@"GASOLINE"];
    }
    return SDLFuelType_GASOLINE;
}

+ (SDLFuelType *)DIESEL {
    if (SDLFuelType_DIESEL == nil) {
        SDLFuelType_DIESEL = [[SDLFuelType alloc] initWithValue:@"DIESEL"];
    }
    return SDLFuelType_DIESEL;
}

+ (SDLFuelType *)CNG {
    if (SDLFuelType_CNG == nil) {
        SDLFuelType_CNG = [[SDLFuelType alloc] initWithValue:@"CNG"];
    }
    return SDLFuelType_CNG;
}

+ (SDLFuelType *)LPG {
    if (SDLFuelType_LPG == nil) {
        SDLFuelType_LPG = [[SDLFuelType alloc] initWithValue:@"LPG"];
    }
    return SDLFuelType_LPG;
}

+ (SDLFuelType *)BATTERY {
    if (SDLFuelType_BATTERY == nil) {
        SDLFuelType_BATTERY = [[SDLFuelType alloc] initWithValue:@"BATTERY"];
    }
    return SDLFuelType_BATTERY;
}

+ (SDLFuelType *)HYDROGEN {
    if (SDLFuelType_HYDROGEN == nil) {
        SDLFuelType_HYDROGEN = [[SDLFuelType alloc] initWithValue:@"HYDROGEN"];
    }
    return SDLFuelType_HYDROGEN;
}

@end
