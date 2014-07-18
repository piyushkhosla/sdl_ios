//  FMCScreenParams.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCImageResolution.h>
#import <AppLink/FMCTouchEventCapabilities.h>

@interface FMCScreenParams : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCImageResolution* resolution;
@property(assign) FMCTouchEventCapabilities* touchEventAvailable;

@end
