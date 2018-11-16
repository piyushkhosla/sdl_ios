//
//  SDLShowAppMenu.m
//  SmartDeviceLink
//

#import "SDLShowAppMenu.h"
#import "SDLNames.h"
#import "NSMutableDictionary+Store.h"

NS_ASSUME_NONNULL_BEGIN

@implementation SDLShowAppMenu

- (instancetype)init {
    if (self = [super initWithName:SDLNameShowAppMenu]) {
    }
    return self;
}

- (instancetype)initWithMenuID:(UInt32)menuId {
    self = [self init];
    if (!self) { return nil; }

    self.menuID = @(menuId);

    return self;
}

- (void)setMenuID:(NSNumber<SDLInt> *)menuID {
    [parameters sdl_setObject:menuID forName:SDLNameMenuId];
}

- (NSNumber<SDLInt> *)menuID {
    return [parameters sdl_objectForName:SDLNameMenuId];
}


@end

NS_ASSUME_NONNULL_END
