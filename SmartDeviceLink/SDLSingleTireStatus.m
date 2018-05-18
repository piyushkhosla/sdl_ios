//  SDLSingleTireStatus.m
//

#import "SDLSingleTireStatus.h"

#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"

@implementation SDLSingleTireStatus

- (void)setStatus:(SDLComponentVolumeStatus)status {
    [store sdl_setObject:status forName:SDLNameStatus];
}

- (SDLComponentVolumeStatus)status {
    return [store sdl_objectForName:SDLNameStatus];
}

- (void)setTpms:(SDLTPMS)tpms {
    [store sdl_setObject:tpms forName:SDLNameTpms];
}

- (SDLTPMS)tpms {
    return [store sdl_objectForName:SDLNameTpms];
}

- (void)setPressure:(NSNumber<SDLFloat> *)pressure {
    [store sdl_setObject:pressure forName:SDLNamePressure];
}

- (NSNumber<SDLFloat> *)pressure {
    return [store sdl_objectForName:SDLNamePressure];
}

@end
