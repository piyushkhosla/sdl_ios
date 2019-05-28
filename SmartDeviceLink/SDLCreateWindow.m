//
//  SDLCreateWindow.m
//

#import "SDLCreateWindow.h"

#import "NSMutableDictionary+Store.h"
#import "SDLChoice.h"
#import "SDLRPCParameterNames.h"
#import "SDLRPCFunctionNames.h"

@implementation SDLCreateWindow

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (instancetype)init {
    if (self = [super initWithName:SDLRPCFunctionNameCreateWindow]) {
    }
    return self;
}
#pragma clang diagnostic pop

- (instancetype)initWithId:(UInt32)windowID name:(NSString *)name type:(SDLWindowType)type {
    self = [self init];
    if (!self) {
        return nil;
    }
    
    self.windowID = @(windowID);
    self.windowName = name;
    self.type = type;
    
    return self;
}

- (instancetype)initWithId:(UInt32)windowID name:(NSString *)name type:(SDLWindowType)type associatedServiceType:(NSString *)associatedServiceType duplicateUpdatesFromWindowID:(UInt32)duplicateUpdatesFromWindowID {
    self = [self initWithId:windowID name:name type:type];
    if (!self) {
        return nil;
    }
    
    self.associatedServiceType = associatedServiceType;
    self.duplicateUpdatesFromWindowID = @(duplicateUpdatesFromWindowID);
    return self;
}

- (NSNumber<SDLInt> *)windowID {
    NSError *error = nil;
    return [self.parameters sdl_objectForName:SDLRPCParameterNameWindowID ofClass:NSNumber.class error:&error];
}

- (void)setWindowID:(NSNumber<SDLInt> *)windowID {
    [self.parameters sdl_setObject:windowID forName:SDLRPCParameterNameWindowID];
}

- (NSString *)windowName {
    NSError *error = nil;
    return [self.parameters sdl_enumForName:SDLRPCParameterNameWindowName error:&error];
}

- (void)setWindowName:(NSString *)windowName {
    [self.parameters sdl_setObject:windowName forName:SDLRPCParameterNameWindowName];
}

- (SDLWindowType)type {
    NSError *error = nil;
    return [self.parameters sdl_enumForName:SDLRPCParameterNameType error:&error];
}

- (void)setType:(SDLWindowType)type {
    [self.parameters sdl_setObject:type forName:SDLRPCParameterNameType];
}

- (NSString *)associatedServiceType {
    NSError *error = nil;
    return [self.parameters sdl_objectForName:SDLRPCParameterNameAssociatedServiceType ofClass:NSString.class error:&error];
}

- (void)setAssociatedServiceType:(NSString *)associatedServiceType {
    [self.parameters sdl_setObject:associatedServiceType forName:SDLRPCParameterNameAssociatedServiceType];
}

- (NSNumber<SDLInt> *)duplicateUpdatesFromWindowID {
    NSError *error = nil;
    return [self.parameters sdl_objectForName:SDLRPCParameterNameDuplicateUpdatesFromWindowID ofClass:NSNumber.class error:&error];
}

- (void)setDuplicateUpdatesFromWindowID:(NSNumber<SDLInt> *)duplicateUpdatesFromWindowID {
    [self.parameters sdl_setObject:duplicateUpdatesFromWindowID forName:SDLRPCParameterNameDuplicateUpdatesFromWindowID];
}

@end
