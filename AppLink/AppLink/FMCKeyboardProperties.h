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

@property(strong) FMCLanguage* language;
@property(strong) FMCKeyboardLayout* keyboardLayout;
@property(strong) FMCKeypressMode* keypressMode;
@property(strong) NSMutableArray* limitedCharacterList;
@property(strong) NSString* autoCompleteText;

@end
