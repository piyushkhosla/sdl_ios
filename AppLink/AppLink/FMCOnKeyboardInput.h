//  FMCOnKeyboardInput.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/FMCKeyboardEvent.h>

@interface FMCOnKeyboardInput : FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCKeyboardEvent* event;
@property(strong) NSString* data;

@end
