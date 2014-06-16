//  FMCOnHMIStatus.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/RPC/Enums/FMCHMILevel.h>
#import <AppLink/RPC/Enums/FMCAudioStreamingState.h>
#import <AppLink/RPC/Enums/FMCSystemContext.h>

@interface FMCOnHMIStatus : FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCHMILevel* hmiLevel;
@property(assign) FMCAudioStreamingState* audioStreamingState;
@property(assign) FMCSystemContext* systemContext;

@end
