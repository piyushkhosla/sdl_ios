//
//  EAAccessoryManager+SyncProtocols.m
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//

#import "EAAccessory+SyncProtocols.h"
#import "EAAccessoryManager+SyncProtocols.h"

@implementation EAAccessoryManager (SyncProtocols)

+ (EAAccessory *)findAccessoryForProtocol:(NSString *)protocol {

    for (EAAccessory* accessory in [[EAAccessoryManager sharedAccessoryManager] connectedAccessories]) {
        if ([accessory supportsProtocol:protocol]) {
            return accessory;
        }
    }

    return nil;
}

@end
