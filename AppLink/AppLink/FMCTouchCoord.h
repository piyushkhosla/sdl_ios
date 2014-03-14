//  FMCTouchCoord.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

@interface FMCTouchCoord : FMCRPCStruct

@property (assign) NSNumber* x;
@property (assign) NSNumber* y;

@end