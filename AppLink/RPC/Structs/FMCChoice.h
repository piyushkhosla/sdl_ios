//  FMCChoice.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/RPC/Structs/FMCImage.h>

@interface FMCChoice : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSNumber* choiceID;
@property(assign) NSString* menuName;
@property(assign) NSMutableArray* vrCommands;
@property(assign) FMCImage* image;
@property(assign) NSString* secondaryText;
@property(assign) NSString* tertiaryText;
@property(assign) FMCImage* secondaryImage;

@end
