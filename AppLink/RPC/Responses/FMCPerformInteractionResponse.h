//  FMCPerformInteractionResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

#import <AppLink/RPC/Enums/FMCTriggerSource.h>

@interface FMCPerformInteractionResponse : FMCRPCResponse {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSNumber* choiceID;
@property(assign) NSString* manualTextEntry;
@property(assign) FMCTriggerSource* triggerSource;

@end
