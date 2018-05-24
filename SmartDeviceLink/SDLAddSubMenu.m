//  SDLAddSubMenu.m

#import "SDLAddSubMenu.h"

#import "NSMutableDictionary+Store.h"
#import "SDLNames.h"
#import "SDLMenuParams.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLAddSubMenu

- (instancetype)init {
    if (self = [super initWithName:SDLNameAddSubMenu]) {
    }
    return self;
}

- (instancetype)initWithMenuParams:(SDLMenuParams *)menuParams {
    self = [self init];
    if (!self) {
        return nil;
    }

    self.menuParams = menuParams;

    return self;

}

- (instancetype)initWithId:(UInt32)menuId menuName:(NSString *)menuName position:(UInt8)position {
    self = [self initWithId:menuId menuName:menuName];
    if (!self) {
        return nil;
    }

    self.position = @(position);

    return self;
}

- (instancetype)initWithId:(UInt32)menuId menuName:(NSString *)menuName {
    self = [self init];
    if (!self) {
        return nil;
    }

    self.menuID = @(menuId);
    self.menuName = menuName;

    return self;
}

- (void)setMenuID:(NSNumber<SDLInt> *)menuID {
    [parameters sdl_setObject:menuID forName:SDLNameMenuId];
}

- (NSNumber<SDLInt> *)menuID {
    return [parameters sdl_objectForName:SDLNameMenuId];
}

- (void)setPosition:(nullable NSNumber<SDLInt> *)position {
    [parameters sdl_setObject:position forName:SDLNamePosition];
}

- (nullable NSNumber<SDLInt> *)position {
    return [parameters sdl_objectForName:SDLNamePosition];
}

- (void)setMenuName:(NSString *)menuName {
    [parameters sdl_setObject:menuName forName:SDLNameMenuName];
}

- (NSString *)menuName {
    return [parameters sdl_objectForName:SDLNameMenuName];
}

- (void)setMenuParams:(SDLMenuParams *)menuParams {
    [parameters sdl_setObject:menuParams forName:SDLNameMenuParams];
}

- (SDLMenuParams *)menuParams {
   return [parameters sdl_objectForName:SDLNameMenuParams ofClass:SDLMenuParams.class];
}

@end

NS_ASSUME_NONNULL_END
