//
//  EAAccessory+SyncProtocols.h
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//

#import <ExternalAccessory/ExternalAccessory.h>

@interface EAAccessory (SyncProtocols)

- (BOOL)supportsProtocol:(NSString *)protocol;

@end
