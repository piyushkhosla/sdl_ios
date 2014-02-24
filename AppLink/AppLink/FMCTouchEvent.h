//  FMCTouchEvent.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>
#import <AppLink/FMCTouchCoord.h>

@interface FMCTouchEvent : FMCRPCStruct

@property (assign) NSNumber* touchEventId;
@property (assign) NSNumber* timestamp;
@property (assign) FMCTouchCoord* coord;

@end
