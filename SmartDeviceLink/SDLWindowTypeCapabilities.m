//
//  SDLWindowTypeCapabilities.m
//

#import "SDLWindowTypeCapabilities.h"

#import "NSMutableDictionary+Store.h"
#import "SDLRPCParameterNames.h"

@implementation SDLWindowTypeCapabilities

- (instancetype)initWithType:(SDLWindowType)type maximumNumberOfWindows:(UInt32)maximumNumberOfWindows {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.type = type;
    self.maximumNumberOfWindows = @(maximumNumberOfWindows);
    
    return self;
}

- (void)setType:(SDLWindowType)type {
    [self.store sdl_setObject:type forName:SDLRPCParameterNameType];
}

- (SDLWindowType)type {
    NSError *error = nil;
    return [self.store sdl_enumForName:SDLRPCParameterNameType error:&error];

}

- (NSNumber<SDLInt> *)maximumNumberOfWindows {
    NSError *error = nil;
    return [self.store sdl_objectForName:SDLRPCParameterNameMaximumNumberOfWindows ofClass:NSNumber.class error:&error];
}

- (void)setMaximumNumberOfWindows:(NSNumber<SDLInt> *)maximumNumberOfWindows {
    [self.store sdl_setObject:maximumNumberOfWindows forName:SDLRPCParameterNameMaximumNumberOfWindows];
}

@end

