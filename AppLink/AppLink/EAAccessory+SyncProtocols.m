//
//  EAAccessory+SyncProtocols.m
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//

#import "EAAccessory+SyncProtocols.h"

@implementation EAAccessory (SyncProtocols)

- (BOOL)supportsProtocol:(NSString *)protocol {

    for (NSString *supportedProtocol in self.protocolStrings) {
        if ([supportedProtocol isEqualToString:protocol]) {
            return YES;
        }
    }

    return NO;
}

@end
