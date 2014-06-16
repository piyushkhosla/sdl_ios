//  FMCPerformInteraction.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/RPC/Enums/FMCInteractionMode.h>
#import <AppLink/RPC/Enums/FMCLayoutMode.h>

@interface FMCPerformInteraction : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSString* initialText;
@property(assign) NSMutableArray* initialPrompt;
@property(assign) FMCInteractionMode* interactionMode;
@property(assign) NSMutableArray* interactionChoiceSetIDList;
@property(assign) NSMutableArray* helpPrompt;
@property(assign) NSMutableArray* timeoutPrompt;
@property(assign) NSNumber* timeout;
@property(assign) NSMutableArray* vrHelp;
@property(assign) FMCLayoutMode* interactionLayout;

@end
