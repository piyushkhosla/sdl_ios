//  FMCTouchEvent.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

@interface FMCTouchEvent : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSNumber* touchEventId;
@property(assign) NSMutableArray* timeStamp;
@property(assign) NSMutableArray* coord;

@end
