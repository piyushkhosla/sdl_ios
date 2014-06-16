//  FMCSoftButton.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/RPC/Enums/FMCSoftButtonType.h>
#import <AppLink/RPC/Structs/FMCImage.h>
#import <AppLink/RPC/Enums/FMCSystemAction.h>

@interface FMCSoftButton : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCSoftButtonType* type;
@property(assign) NSString* text;
@property(assign) FMCImage* image;
@property(assign) NSNumber* isHighlighted;
@property(assign) NSNumber* softButtonID;
@property(assign) FMCSystemAction* systemAction;

@end
