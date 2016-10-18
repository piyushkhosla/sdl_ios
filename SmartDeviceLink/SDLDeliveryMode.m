//
//  SDLDeliveryMode.m
//  

#import "SDLDeliveryMode.h"
SDLDeliveryMode *SDLDeliveryMode_PROMPT = nil;
SDLDeliveryMode *SDLDeliveryMode_DESTINATION = nil;
SDLDeliveryMode *SDLDeliveryMode_QUEUE = nil;

NSArray *SDLDeliveryMode_values = nil;

@implementation SDLDeliveryMode

+ (SDLDeliveryMode *)valueOf:(NSString *)value {
    for (SDLDeliveryMode *item in SDLDeliveryMode.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLDeliveryMode_values == nil) {
        SDLDeliveryMode_values = @[
                                 SDLDeliveryMode.PROMPT,
                                 SDLDeliveryMode.NO_PROMPT_SET_AS_DESTINATION,
                                 SDLDeliveryMode.NO_PROMPT_ADD_TO_QUEUE,
                                 ];
    }
    return SDLDeliveryMode_values;
}

+ (SDLDeliveryMode *)PROMPT {
    if (SDLDeliveryMode_PROMPT == nil) {
        SDLDeliveryMode_PROMPT = [[SDLDeliveryMode alloc] initWithValue:@"PROMPT"];
    }
    return SDLDeliveryMode_PROMPT;
}

+ (SDLDeliveryMode *)NO_PROMPT_SET_AS_DESTINATION {
    if (SDLDeliveryMode_DESTINATION == nil) {
        SDLDeliveryMode_DESTINATION = [[SDLDeliveryMode alloc] initWithValue:@"DESTINATION"];
    }
    return SDLDeliveryMode_DESTINATION;
}

+ (SDLDeliveryMode *)NO_PROMPT_ADD_TO_QUEUE {
    if (SDLDeliveryMode_QUEUE == nil) {
        SDLDeliveryMode_QUEUE = [[SDLDeliveryMode alloc] initWithValue:@"QUEUE"];
    }
    return SDLDeliveryMode_QUEUE;
}

@end
