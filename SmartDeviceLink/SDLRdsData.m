//
//  SDLRdsData.m
//

#import "SDLRdsData.h"
#include "SDLNames.h"
#import "NSMutableDictionary+Store.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLRdsData

- (void)setPS:(nullable NSString *)PS {
    [store sdl_setObject:PS forName:SDLNamePS];
}

- (nullable NSString *)PS {
    return [store sdl_objectForName:SDLNamePS];
}

- (void)setRT:(nullable NSString *)RT {
    [store sdl_setObject:RT forName:SDLNameRT];
}

- (nullable NSString *)RT {
    return [store sdl_objectForName:SDLNameRT];
}

- (void)setCT:(nullable NSString *)CT {
    [store sdl_setObject:CT forName:SDLNameCT];
}

- (nullable NSString *)CT {
    return [store sdl_objectForName:SDLNameCT];
}

- (void)setPI:(nullable NSString *)PI {
    [store sdl_setObject:PI forName:SDLNamePI];
}

- (nullable NSString *)PI {
    return [store sdl_objectForName:SDLNamePI];
}

- (void)setPTY:(nullable NSNumber *)PTY {
    [store sdl_setObject:PTY forName:SDLNamePTY];
}

- (nullable NSNumber *)PTY {
    return [store sdl_objectForName:SDLNamePTY];
}

- (void)setTP:(nullable NSNumber *)TP {
    [store sdl_setObject:TP forName:SDLNameTP];
}

- (nullable NSNumber *)TP {
    return [store sdl_objectForName:SDLNameTP];
}

- (void)setTA:(nullable NSNumber *)TA {
    [store sdl_setObject:TA forName:SDLNameTA];
}

- (nullable NSNumber *)TA {
    return [store sdl_objectForName:SDLNameTA];
}

- (void)setREG:(nullable NSString *)REG {
    [store sdl_setObject:REG forName:SDLNameREG];
}

- (nullable NSString *)REG {
    return [store sdl_objectForName:SDLNameREG];
}
@end

NS_ASSUME_NONNULL_END
