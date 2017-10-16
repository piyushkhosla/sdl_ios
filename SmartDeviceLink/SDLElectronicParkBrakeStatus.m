//
//  SDLElectronicParkBrakeStatus.m
//  SmartDeviceLink
//

#import "SDLElectronicParkBrakeStatus.h"

SDLElectronicParkBrakeStatus *SDLElectronicParkBrakeStatus_CLOSED = nil;
SDLElectronicParkBrakeStatus *SDLElectronicParkBrakeStatus_TRANSITION = nil;
SDLElectronicParkBrakeStatus *SDLElectronicParkBrakeStatus_OPEN = nil;
SDLElectronicParkBrakeStatus *SDLElectronicParkBrakeStatus_DRIVE_ACTIVE = nil;
SDLElectronicParkBrakeStatus *SDLElectronicParkBrakeStatus_FAULT = nil;

NSArray *SDLElectronicParkBrakeStatus_values = nil;

@implementation SDLElectronicParkBrakeStatus

+ (SDLElectronicParkBrakeStatus *)valueOf:(NSString *)value {
    for (SDLElectronicParkBrakeStatus *item in SDLElectronicParkBrakeStatus.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+ (NSArray *)values {
    if (SDLElectronicParkBrakeStatus_values == nil) {
        SDLElectronicParkBrakeStatus_values = @[
                                              SDLElectronicParkBrakeStatus.CLOSED,
                                              SDLElectronicParkBrakeStatus.TRANSITION,
                                              SDLElectronicParkBrakeStatus.OPEN,
                                              SDLElectronicParkBrakeStatus.DRIVE_ACTIVE,
                                              SDLElectronicParkBrakeStatus.FAULT,
                                              ];
    }
    return SDLElectronicParkBrakeStatus_values;
}

+ (SDLElectronicParkBrakeStatus *)CLOSED {
    if (SDLElectronicParkBrakeStatus_CLOSED == nil) {
        SDLElectronicParkBrakeStatus_CLOSED = [[SDLElectronicParkBrakeStatus alloc] initWithValue:@"CLOSED"];
    }
    return SDLElectronicParkBrakeStatus_CLOSED;
}

+ (SDLElectronicParkBrakeStatus *)TRANSITION {
    if (SDLElectronicParkBrakeStatus_TRANSITION == nil) {
        SDLElectronicParkBrakeStatus_TRANSITION = [[SDLElectronicParkBrakeStatus alloc] initWithValue:@"TRANSITION"];
    }
    return SDLElectronicParkBrakeStatus_TRANSITION;
}

+ (SDLElectronicParkBrakeStatus *)OPEN {
    if (SDLElectronicParkBrakeStatus_OPEN == nil) {
        SDLElectronicParkBrakeStatus_OPEN = [[SDLElectronicParkBrakeStatus alloc] initWithValue:@"OPEN"];
    }
    return SDLElectronicParkBrakeStatus_OPEN;
}

+ (SDLElectronicParkBrakeStatus *)DRIVE_ACTIVE {
    if (SDLElectronicParkBrakeStatus_DRIVE_ACTIVE == nil) {
        SDLElectronicParkBrakeStatus_DRIVE_ACTIVE = [[SDLElectronicParkBrakeStatus alloc] initWithValue:@"DRIVE_ACTIVE"];
    }
    return SDLElectronicParkBrakeStatus_DRIVE_ACTIVE;
}

+ (SDLElectronicParkBrakeStatus *)FAULT {
    if (SDLElectronicParkBrakeStatus_FAULT == nil) {
        SDLElectronicParkBrakeStatus_FAULT = [[SDLElectronicParkBrakeStatus alloc] initWithValue:@"FAULT"];
    }
    return SDLElectronicParkBrakeStatus_FAULT;
}
@end
