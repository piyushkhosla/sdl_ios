//  FMCSetGlobalProperties.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/RPC/Structs/FMCImage.h>
#import <AppLink/RPC/Structs/FMCKeyboardProperties.h>

@interface FMCSetGlobalProperties : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSMutableArray* helpPrompt;
@property(assign) NSMutableArray* timeoutPrompt;
@property(assign) NSString* vrHelpTitle;
@property(assign) NSMutableArray* vrHelp;
@property(assign) NSString* menuTitle;
@property(assign) FMCImage* menuIcon;
@property(assign) FMCKeyboardProperties* keyboardProperties;

@end
