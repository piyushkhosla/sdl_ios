//
//  SDLTurnSignal.m
//  SmartDeviceLink-iOS
//

#import "SDLTurnSignal.h"

SDLTurnSignal *SDLTurnSignal_OFF = nil;
SDLTurnSignal *SDLTurnSignal_LEFT = nil;
SDLTurnSignal *SDLTurnSignal_RIGHT = nil;
SDLTurnSignal *SDLTurnSignal_UNUSED = nil;

NSArray *SDLTurnSignal_values = nil;

@implementation SDLTurnSignal

+ (SDLTurnSignal *)valueOf:(NSString *)value {
    for (SDLTurnSignal *item in SDLTurnSignal.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLTurnSignal_values == nil) {
        SDLTurnSignal_values = @[
                                 SDLTurnSignal.OFF,
                                 SDLTurnSignal.LEFT,
                                 SDLTurnSignal.RIGHT,
                                 SDLTurnSignal.UNUSED
                                 ];
    }
    return SDLTurnSignal_values;
}

+ (SDLTurnSignal *)OFF {
    if (SDLTurnSignal_OFF == nil) {
        SDLTurnSignal_OFF = [[SDLTurnSignal alloc] initWithValue:@"OFF"];
    }
    return SDLTurnSignal_OFF;
}

+ (SDLTurnSignal *)LEFT {
    if (SDLTurnSignal_LEFT == nil) {
        SDLTurnSignal_LEFT = [[SDLTurnSignal alloc] initWithValue:@"LEFT"];
    }
    return SDLTurnSignal_LEFT;
}

+ (SDLTurnSignal *)RIGHT {
    if (SDLTurnSignal_RIGHT == nil) {
        SDLTurnSignal_RIGHT = [[SDLTurnSignal alloc] initWithValue:@"RIGHT"];
    }
    return SDLTurnSignal_RIGHT;
}

+ (SDLTurnSignal *)UNUSED {
    if (SDLTurnSignal_UNUSED == nil) {
        SDLTurnSignal_UNUSED = [[SDLTurnSignal alloc] initWithValue:@"UNUSED"];
    }
    return SDLTurnSignal_UNUSED;
}

@end
