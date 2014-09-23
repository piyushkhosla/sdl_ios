//  FMCIAPTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <ExternalAccessory/ExternalAccessory.h>
#import "FMCAbstractTransport.h"

@interface FMCIAPTransport : FMCAbstractTransport <NSStreamDelegate> {}

@property (assign) BOOL forceLegacy;

@end
