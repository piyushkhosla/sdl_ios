//  FMCIAPTransport.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import "FMCIAPSessionDelegate.h"
#import "FMCAbstractTransport.h"
#import "FMCIAPSession.h"

@interface FMCIAPTransport : FMCAbstractTransport<FMCIAPSessionDelegate>

@property (strong, atomic) FMCIAPSession *session;

- (instancetype)init;

@end
