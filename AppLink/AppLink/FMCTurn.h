//  FMCTurn.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCImage.h>

@interface FMCTurn : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSString* navigationText;
@property(assign) FMCImage* turnIcon;

@end