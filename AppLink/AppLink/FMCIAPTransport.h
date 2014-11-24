//  FMCIAPTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCAbstractTransport.h"
#import "FMCIAPSession.h"

@interface FMCIAPTransport : FMCAbstractTransport

@property (strong, atomic) FMCIAPSession *session;

- (instancetype)init;

@end
