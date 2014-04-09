//  FMCAppInterfaceUnregisteredReason.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCAppInterfaceUnregisteredReason.h>

FMCAppInterfaceUnregisteredReason* FMCAppInterfaceUnregisteredReason_IGNITION_OFF = nil;
FMCAppInterfaceUnregisteredReason* FMCAppInterfaceUnregisteredReason_BLUETOOTH_OFF = nil;
FMCAppInterfaceUnregisteredReason* FMCAppInterfaceUnregisteredReason_USB_DISCONNECTED = nil;
FMCAppInterfaceUnregisteredReason* FMCAppInterfaceUnregisteredReason_REQUEST_WHILE_IN_NONE_HMI_LEVEL = nil;
FMCAppInterfaceUnregisteredReason* FMCAppInterfaceUnregisteredReason_TOO_MANY_REQUESTS = nil;
FMCAppInterfaceUnregisteredReason* FMCAppInterfaceUnregisteredReason_DRIVER_DISTRACTION_VIOLATION = nil;
FMCAppInterfaceUnregisteredReason* FMCAppInterfaceUnregisteredReason_LANGUAGE_CHANGE = nil;
FMCAppInterfaceUnregisteredReason* FMCAppInterfaceUnregisteredReason_MASTER_RESET = nil;
FMCAppInterfaceUnregisteredReason* FMCAppInterfaceUnregisteredReason_FACTORY_DEFAULTS = nil;
FMCAppInterfaceUnregisteredReason* FMCAppInterfaceUnregisteredReason_APP_UNAUTHORIZED = nil;

NSMutableArray* FMCAppInterfaceUnregisteredReason_values = nil;

@implementation FMCAppInterfaceUnregisteredReason

+(FMCAppInterfaceUnregisteredReason*) valueOf:(NSString*) value {
    for (FMCAppInterfaceUnregisteredReason* item in FMCAppInterfaceUnregisteredReason.values) {
        if ([item.value isEqualToString:value]) {
            return item;
        }
    }
    return nil;
}

+(NSMutableArray*) values {
    if (FMCAppInterfaceUnregisteredReason_values == nil) {
        FMCAppInterfaceUnregisteredReason_values = [[NSMutableArray alloc] initWithObjects:
                FMCAppInterfaceUnregisteredReason.IGNITION_OFF,
                FMCAppInterfaceUnregisteredReason.BLUETOOTH_OFF,
                FMCAppInterfaceUnregisteredReason.USB_DISCONNECTED,
                FMCAppInterfaceUnregisteredReason.REQUEST_WHILE_IN_NONE_HMI_LEVEL,
                FMCAppInterfaceUnregisteredReason.TOO_MANY_REQUESTS,
                FMCAppInterfaceUnregisteredReason.DRIVER_DISTRACTION_VIOLATION,
                FMCAppInterfaceUnregisteredReason.LANGUAGE_CHANGE,
                FMCAppInterfaceUnregisteredReason.MASTER_RESET,
                FMCAppInterfaceUnregisteredReason.FACTORY_DEFAULTS,
                FMCAppInterfaceUnregisteredReason.APP_UNAUTHORIZED,
                nil];
    }
    return FMCAppInterfaceUnregisteredReason_values;
}

+(FMCAppInterfaceUnregisteredReason*) IGNITION_OFF {
    if (FMCAppInterfaceUnregisteredReason_IGNITION_OFF == nil) {
        FMCAppInterfaceUnregisteredReason_IGNITION_OFF = [[FMCAppInterfaceUnregisteredReason alloc] initWithValue:@"IGNITION_OFF"];
    }
    return FMCAppInterfaceUnregisteredReason_IGNITION_OFF;
}

+(FMCAppInterfaceUnregisteredReason*) BLUETOOTH_OFF {
    if (FMCAppInterfaceUnregisteredReason_BLUETOOTH_OFF == nil) {
        FMCAppInterfaceUnregisteredReason_BLUETOOTH_OFF = [[FMCAppInterfaceUnregisteredReason alloc] initWithValue:@"BLUETOOTH_OFF"];
    }
    return FMCAppInterfaceUnregisteredReason_BLUETOOTH_OFF;
}

+(FMCAppInterfaceUnregisteredReason*) USB_DISCONNECTED {
    if (FMCAppInterfaceUnregisteredReason_USB_DISCONNECTED == nil) {
        FMCAppInterfaceUnregisteredReason_USB_DISCONNECTED = [[FMCAppInterfaceUnregisteredReason alloc] initWithValue:@"USB_DISCONNECTED"];
    }
    return FMCAppInterfaceUnregisteredReason_USB_DISCONNECTED;
}

+(FMCAppInterfaceUnregisteredReason*) REQUEST_WHILE_IN_NONE_HMI_LEVEL {
    if (FMCAppInterfaceUnregisteredReason_REQUEST_WHILE_IN_NONE_HMI_LEVEL == nil) {
        FMCAppInterfaceUnregisteredReason_REQUEST_WHILE_IN_NONE_HMI_LEVEL = [[FMCAppInterfaceUnregisteredReason alloc] initWithValue:@"REQUEST_WHILE_IN_NONE_HMI_LEVEL"];
    }
    return FMCAppInterfaceUnregisteredReason_REQUEST_WHILE_IN_NONE_HMI_LEVEL;
}

+(FMCAppInterfaceUnregisteredReason*) TOO_MANY_REQUESTS {
    if (FMCAppInterfaceUnregisteredReason_TOO_MANY_REQUESTS == nil) {
        FMCAppInterfaceUnregisteredReason_TOO_MANY_REQUESTS = [[FMCAppInterfaceUnregisteredReason alloc] initWithValue:@"TOO_MANY_REQUESTS"];
    }
    return FMCAppInterfaceUnregisteredReason_TOO_MANY_REQUESTS;
}

+(FMCAppInterfaceUnregisteredReason*) DRIVER_DISTRACTION_VIOLATION {
    if (FMCAppInterfaceUnregisteredReason_DRIVER_DISTRACTION_VIOLATION == nil) {
        FMCAppInterfaceUnregisteredReason_DRIVER_DISTRACTION_VIOLATION = [[FMCAppInterfaceUnregisteredReason alloc] initWithValue:@"DRIVER_DISTRACTION_VIOLATION"];
    }
    return FMCAppInterfaceUnregisteredReason_DRIVER_DISTRACTION_VIOLATION;
}

+(FMCAppInterfaceUnregisteredReason*) LANGUAGE_CHANGE {
    if (FMCAppInterfaceUnregisteredReason_LANGUAGE_CHANGE == nil) {
        FMCAppInterfaceUnregisteredReason_LANGUAGE_CHANGE = [[FMCAppInterfaceUnregisteredReason alloc] initWithValue:@"LANGUAGE_CHANGE"];
    }
    return FMCAppInterfaceUnregisteredReason_LANGUAGE_CHANGE;
}

+(FMCAppInterfaceUnregisteredReason*) MASTER_RESET {
    if (FMCAppInterfaceUnregisteredReason_MASTER_RESET == nil) {
        FMCAppInterfaceUnregisteredReason_MASTER_RESET = [[FMCAppInterfaceUnregisteredReason alloc] initWithValue:@"MASTER_RESET"];
    }
    return FMCAppInterfaceUnregisteredReason_MASTER_RESET;
}

+(FMCAppInterfaceUnregisteredReason*) FACTORY_DEFAULTS {
    if (FMCAppInterfaceUnregisteredReason_FACTORY_DEFAULTS == nil) {
        FMCAppInterfaceUnregisteredReason_FACTORY_DEFAULTS = [[FMCAppInterfaceUnregisteredReason alloc] initWithValue:@"FACTORY_DEFAULTS"];
    }
    return FMCAppInterfaceUnregisteredReason_FACTORY_DEFAULTS;
}

+(FMCAppInterfaceUnregisteredReason*) APP_UNAUTHORIZED {
    if (FMCAppInterfaceUnregisteredReason_APP_UNAUTHORIZED == nil) {
        FMCAppInterfaceUnregisteredReason_APP_UNAUTHORIZED = [[FMCAppInterfaceUnregisteredReason alloc] initWithValue:@"APP_UNAUTHORIZED"];
    }
    return FMCAppInterfaceUnregisteredReason_APP_UNAUTHORIZED;
}

@end
