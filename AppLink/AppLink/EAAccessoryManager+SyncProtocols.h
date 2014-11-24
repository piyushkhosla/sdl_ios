//
//  EAAccessoryManager+SyncProtocols.h
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//

#import <ExternalAccessory/ExternalAccessory.h>

@interface EAAccessoryManager (SyncProtocols)

+ (EAAccessory *)findAccessoryForProtocol:(NSString *)protocol;

@end
