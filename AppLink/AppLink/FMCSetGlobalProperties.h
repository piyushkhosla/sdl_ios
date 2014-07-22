//  FMCSetGlobalProperties.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCImage.h>
#import <AppLink/FMCKeyboardProperties.h>

@interface FMCSetGlobalProperties : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSMutableArray* helpPrompt;
@property(strong) NSMutableArray* timeoutPrompt;
@property(strong) NSString* vrHelpTitle;
@property(strong) NSMutableArray* vrHelp;
@property(strong) NSString* menuTitle;
@property(strong) FMCImage* menuIcon;
@property(strong) FMCKeyboardProperties* keyboardProperties;

@end
