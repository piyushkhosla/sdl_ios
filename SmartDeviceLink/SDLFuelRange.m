//  SDLFuelRange.m
//

#import "SDLFuelRange.h"
#import "SDLFuelType.h"
#import "SDLNames.h"

@implementation SDLFuelRange

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

- (void)setFuelType:(SDLFuelType *)fuelType {
    if (fuelType != nil) {
        [store setObject:fuelType forKey:NAMES_fuelType];
    } else {
        [store removeObjectForKey:NAMES_fuelType];
    }
}

- (SDLFuelType *)fuelType {
    NSObject *obj = [store objectForKey:NAMES_fuelType];
    if (obj == nil || [obj isKindOfClass:SDLFuelType.class]) {
        return (SDLFuelType *)obj;
    } else {
        return [SDLFuelType valueOf:(NSString *)obj];
    }
}

- (void)setRange:(NSNumber *)range {
    if (range != nil) {
        [store setObject:range forKey:NAMES_fuelRange];
    } else {
        [store removeObjectForKey:NAMES_fuelRange];
    }
}

- (NSNumber *)range {
    return [store objectForKey:NAMES_fuelRange];
}


@end
