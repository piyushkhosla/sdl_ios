//  FMCOnTouchEvent.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/RPC/Enums/FMCTouchType.h>

@interface FMCOnTouchEvent : FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCTouchType* type;
@property(assign) NSMutableArray* event;

@end
