//
//  FMCIAPConnectionManager.h
//  AppLink
//
//  Copyright (c) 2014 FMC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMCIAPSession.h"

@interface FMCIAPConnectionManager : NSObject

+ (FMCIAPSession *)createSession;

@end
