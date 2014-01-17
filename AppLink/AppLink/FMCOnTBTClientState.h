//  FMCOnTBTClientState.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/FMCTBTState.h>

@interface FMCOnTBTClientState: FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCTBTState* state;

@end

