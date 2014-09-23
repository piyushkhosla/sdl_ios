//  FMCTouchEvent.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

@interface FMCTouchEvent : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSNumber* touchEventId;
@property(strong) NSMutableArray* timeStamp;
@property(strong) NSMutableArray* coord;

@end
