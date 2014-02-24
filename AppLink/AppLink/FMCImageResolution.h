//  FMCImageResolution.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

@interface FMCImageResolution : FMCRPCStruct

@property (assign) NSNumber* resolutionWidth;
@property (assign) NSNumber* resolutionHeight;

@end
