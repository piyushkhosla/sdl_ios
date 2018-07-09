//  SDLWheelSpeedsData.m
//

#import "SDLWheelSpeedsData.h"
#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"

@implementation SDLWheelSpeedsData

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

- (void)setWhlRotatFr_No_Cnt:(NSNumber *)whlRotatFr_No_Cnt {
    [store sdl_setObject:whlRotatFr_No_Cnt forName:SDLNameWhlDirRlDActl];
}

- (NSNumber *)whlRotatFr_No_Cnt {
    return [store sdl_objectForName:SDLNameWhlDirRlDActl];

}

- (void)setWhlRotatFl_No_Cnt:(NSNumber *)whlRotatFl_No_Cnt {
    [store sdl_setObject:whlRotatFl_No_Cnt forName:SDLNameWhlRotatFlNoCnt];
}

- (NSNumber *)whlRotatFl_No_Cnt {
    return [store sdl_objectForName:SDLNameWhlRotatFlNoCnt];
}

- (void)setWhlRotatRr_No_Cnt:(NSNumber *)whlRotatRr_No_Cnt {
    [store sdl_setObject:whlRotatRr_No_Cnt forName:SDLNameWhlRotatRrNoCnt];
}

- (NSNumber *)whlRotatRr_No_Cnt {
    return [store sdl_objectForName:SDLNameWhlRotatRrNoCnt];
}

- (void)setWhlRotatRl_No_Cnt:(NSNumber *)whlRotatRl_No_Cnt {
    [store sdl_setObject:whlRotatRl_No_Cnt forName:SDLNameWhlRotatRlNoCnt];
}

- (NSNumber *)whlRotatRl_No_Cnt {
    return [store sdl_objectForName:SDLNameWhlRotatRlNoCnt];
}

- (void)setWhlDirFr_D_Actl:(NSNumber *)whlDirFr_D_Actl {
    [store sdl_setObject:whlDirFr_D_Actl forName:SDLNameWhlDirFrDActl];
}

- (NSNumber *)whlDirFr_D_Actl {
    return [store sdl_objectForName:SDLNameWhlDirFrDActl];
}

- (void)setWhlDirFl_D_Actl:(NSNumber *)whlDirFl_D_Actl {
}

- (NSNumber *)whlDirFl_D_Actl {
    return [store sdl_objectForName:SDLNameWhlDirFlDActl];
}

- (void)setWhlDirRr_D_Actl:(NSNumber *)whlDirRr_D_Actl {
    [store sdl_setObject:whlDirRr_D_Actl forName:SDLNameWhlDirRrDActl];
}

- (NSNumber *)whlDirRr_D_Actl {
    return [store sdl_objectForName:SDLNameWhlDirRrDActl];
}

- (void)setWhlDirRl_D_Actl:(NSNumber *)whlDirRl_D_Actl {
    [store sdl_setObject:whlDirRl_D_Actl forName:SDLNameWhlDirRlDActl];
}

- (NSNumber *)whlDirRl_D_Actl {
    return [store sdl_objectForName:SDLNameWhlDirRlDActl];
}

@end


