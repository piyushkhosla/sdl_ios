//  FMCKeyboardProperties.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCLanguage.h>
#import <AppLink/FMCKeyboardLayout.h>
#import <AppLink/FMCKeypressMode.h>

@interface FMCKeyboardProperties : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCLanguage* language;
@property(assign) FMCKeyboardLayout* keyboardLayout;
@property(assign) FMCKeypressMode* keypressMode;
@property(assign) NSMutableArray* limitedCharacterList;
@property(assign) NSString* autoCompleteText;

@end
