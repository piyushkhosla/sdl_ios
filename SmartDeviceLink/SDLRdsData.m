//
//  SDLRdsData.m
//

#import "SDLRdsData.h"
#include "SDLNames.h"

@implementation SDLRdsData

- (void)setPS:(NSString *)PS {
    if (PS != nil) {
        [store setObject:PS forKey:NAMES_PS];
    } else {
        [store removeObjectForKey:NAMES_PS];
    }

}

- (NSString *)PS {
    return [store objectForKey:NAMES_PS];

}

- (void)setRT:(NSString *)RT {
    if (RT != nil) {
        [store setObject:RT forKey:NAMES_RT];
    } else {
        [store removeObjectForKey:NAMES_RT];
    }

}

- (NSString *)RT {
    return [store objectForKey:NAMES_RT];

}

- (void)setCT:(NSString *)CT {
    if (CT != nil) {
        [store setObject:CT forKey:NAMES_CT];
    } else {
        [store removeObjectForKey:NAMES_CT];
    }

}

- (NSString *)CT {
    return [store objectForKey:NAMES_CT];

}

- (void)setPI:(NSString *)PI {
    if (PI != nil) {
        [store setObject:PI forKey:NAMES_PI];
    } else {
        [store removeObjectForKey:NAMES_PI];
    }

}

- (NSString *)PI {
    return [store objectForKey:NAMES_PI];

}

- (void)setPTY:(NSNumber *)PTY {
    if (PTY != nil) {
        [store setObject:PTY forKey:NAMES_PTY];
    } else {
        [store removeObjectForKey:NAMES_PTY];
    }

}

- (NSNumber *)PTY {
    return [store objectForKey:NAMES_PTY];

}

- (void)setTP:(NSNumber *)TP {
    if (TP != nil) {
        [store setObject:TP forKey:NAMES_TP];
    } else {
        [store removeObjectForKey:NAMES_TP];
    }

}

- (NSNumber *)TP {
    return [store objectForKey:NAMES_TP];

}

- (void)setTA:(NSNumber *)TA {
    if (TA != nil) {
        [store setObject:TA forKey:NAMES_TA];
    } else {
        [store removeObjectForKey:NAMES_TA];
    }

}

- (NSNumber *)TA {
    return [store objectForKey:NAMES_TA];

}

- (void)setREG:(NSString *)REG {
    if (REG != nil) {
        [store setObject:REG forKey:NAMES_REG];
    } else {
        [store removeObjectForKey:NAMES_REG];
    }

}

- (NSString *)REG {
    return [store objectForKey:NAMES_REG];

}
@end
