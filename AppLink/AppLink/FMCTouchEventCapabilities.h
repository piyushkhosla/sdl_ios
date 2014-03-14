//  FMCTouchEventCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

@interface FMCTouchEventCapabilities : FMCRPCStruct

@property (assign) NSNumber* pressAvailable;
@property (assign) NSNumber* multiTouchAvailable;
@property (assign) NSNumber* doublePressAvailable;

@end
