//
//  SDLABS_STATE.m
//

#import "SDLABS_STATE.h"

SDLABS_STATE *SDLABS_STATE_ACTIVE = nil;
SDLABS_STATE *SDLABS_STATE_INACTIVE = nil;

NSArray *SDLABS_STATE_values = nil;

@implementation SDLABS_STATE

+ (SDLABS_STATE *)valueOf:(NSString *)value {
    for (SDLABS_STATE *item in SDLABS_STATE.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLABS_STATE_values == nil) {
        SDLABS_STATE_values = @[
                                SDLABS_STATE.ACTIVE,
                                SDLABS_STATE.INACTIVE
                                ];
    }
    return SDLABS_STATE_values;
}


+ (SDLABS_STATE *)INACTIVE {
    if (SDLABS_STATE_INACTIVE == nil) {
        SDLABS_STATE_INACTIVE = [[SDLABS_STATE alloc] initWithValue:@"INACTIVE"];
    }
    return SDLABS_STATE_INACTIVE;
}

+ (SDLABS_STATE *)ACTIVE {
    if (SDLABS_STATE_ACTIVE == nil) {
        SDLABS_STATE_ACTIVE = [[SDLABS_STATE alloc] initWithValue:@"ACTIVE"];
    }
    return SDLABS_STATE_ACTIVE;
}

@end
