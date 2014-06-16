//  FMCOnKeyboardInput.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/RPC/Enums/FMCKeyboardEvent.h>

@interface FMCOnKeyboardInput : FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCKeyboardEvent* event;
@property(assign) NSString* data;

@end
