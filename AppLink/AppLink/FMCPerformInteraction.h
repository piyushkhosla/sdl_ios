//  FMCPerformInteraction.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCInteractionMode.h>
#import <AppLink/FMCLayoutMode.h>

@interface FMCPerformInteraction : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSString* initialText;
@property(strong) NSMutableArray* initialPrompt;
@property(strong) FMCInteractionMode* interactionMode;
@property(strong) NSMutableArray* interactionChoiceSetIDList;
@property(strong) NSMutableArray* helpPrompt;
@property(strong) NSMutableArray* timeoutPrompt;
@property(strong) NSNumber* timeout;
@property(strong) NSMutableArray* vrHelp;
@property(strong) FMCLayoutMode* interactionLayout;

@end
