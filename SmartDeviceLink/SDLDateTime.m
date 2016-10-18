//
//  SDLDateTime.m
//

#import "SDLDateTime.h"
#import "SDLNames.h"


@implementation SDLDateTime

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

- (void)setDay:(NSNumber *)day {
    if (day != nil) {
        [store setObject:day forKey:SDLNameDay];
    } else {
        [store removeObjectForKey:SDLNameDay];
    }
}

- (NSNumber *)day {
    return [store objectForKey:SDLNameDay];
}

- (void)setHour:(NSNumber *)hour {
    if (hour != nil) {
        [store setObject:hour forKey:SDLNameHour];
    } else {
        [store removeObjectForKey:SDLNameHour];
    }
}

- (NSNumber *)hour {
    return [store objectForKey:SDLNameHour];
}

- (void)setYear:(NSNumber *)year {
    if (year != nil) {
        [store setObject:year forKey:SDLNameYear];
    } else {
        [store removeObjectForKey:SDLNameYear];
    }
}

- (NSNumber *)year {
    return [store objectForKey:SDLNameYear];
}

- (void)setMonth:(NSNumber *)month {
    if (month != nil) {
        [store setObject:month forKey:SDLNameMonth];
    } else {
        [store removeObjectForKey:SDLNameMonth];
    }
}

- (NSNumber *)month {
    return [store objectForKey:SDLNameMonth];
}

- (void)setMinute:(NSNumber *)minute {
    if (minute != nil) {
        [store setObject:minute forKey:SDLNameMinute];
    } else {
        [store removeObjectForKey:SDLNameMinute];
    }
}

- (NSNumber *)minute {
    return [store objectForKey:SDLNameMinute];
}

- (void)setSecond:(NSNumber *)second {
    if (second != nil) {
        [store setObject:second forKey:SDLNameSecond];
    } else {
        [store removeObjectForKey:SDLNameSecond];
    }
}

- (NSNumber *)second {
    return [store objectForKey:SDLNameSecond];
}

- (void)setMilliSeconds:(NSNumber *)millisecond {
    if (millisecond != nil) {
        [store setObject:millisecond forKey:SDLNameMilliSecond];
    } else {
        [store removeObjectForKey:SDLNameMilliSecond];
    }
}

- (NSNumber *)milliSeconds {
    return [store objectForKey:SDLNameMilliSecond];
}

- (void)setTz_hour:(NSNumber *)tz_hour {
    if (tz_hour != nil) {
        [store setObject:tz_hour forKey:SDLNameTzHour];
    } else {
        [store removeObjectForKey:SDLNameTzHour];
    }
}

- (NSNumber *)tz_hour {
    return [store objectForKey:SDLNameTzHour];
}

- (void)setTz_minute:(NSNumber *)tz_minute {
    if (tz_minute != nil) {
        [store setObject:tz_minute forKey:SDLNameTzMinute];
    } else {
        [store removeObjectForKey:SDLNameTzMinute];
    }
}

- (NSNumber *)tz_minute {
    return [store objectForKey:SDLNameTzMinute];
}

@end
