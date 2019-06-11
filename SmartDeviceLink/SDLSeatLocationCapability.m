//
//  SDLSeatLocationCapability.m
//  SmartDeviceLink
//

#import "SDLSeatLocationCapability.h"

#import "SDLSeatLocation.h"
#import "SDLRPCParameterNames.h"
#import "NSMutableDictionary+Store.h"

@implementation SDLSeatLocationCapability


- (instancetype)initWithColumn:(UInt8)column row:(UInt8)row level:(UInt8)level seats:(nonnull NSArray<SDLSeatLocation *> *)seats {
    self = [self init];
    if(!self) {
        return nil;
    }

    self.col = @(column);
    self.row = @(row);
    self.level = @(level);
    self.seats = seats;


    return self;
}

- (void)setCol:(NSNumber<SDLInt> *)col {
    [self.store sdl_setObject:col forName:SDLRPCParameterNameCol];
}

- (NSNumber<SDLInt> *)col {
    NSError *error = nil;
    return [self.store sdl_objectForName:SDLRPCParameterNameCol ofClass:NSNumber.class error:&error];
}

- (void)setRow:(NSNumber<SDLInt> *)row {
    [self.store sdl_setObject:row forName:SDLRPCParameterNameRow];
}

- (NSNumber<SDLInt> *)row {
    NSError *error = nil;
    return [self.store sdl_objectForName:SDLRPCParameterNameRow ofClass:NSNumber.class error:&error];
}

- (void)setLevel:(nullable NSNumber<SDLInt> *)level {
    [self.store sdl_setObject:level forName:SDLRPCParameterNameLevel];
}

- (nullable NSNumber<SDLInt> *)level {
    NSError *error = nil;
    return [self.store sdl_objectForName:SDLRPCParameterNameLevel ofClass:NSNumber.class error:&error];
}

- (void)setSeats:(nullable NSArray<SDLSeatLocation *> *)seats {
    [self.store sdl_setObject:seats forName:SDLRPCParameterNameSeats];
}

- (nullable NSArray<SDLSeatLocation *> *)seats {
    NSError *error = nil;
    return [self.store sdl_objectsForName:SDLRPCParameterNameSeats ofClass:SDLSeatLocation.class error:&error];
}


@end
