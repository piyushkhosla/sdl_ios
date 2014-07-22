//  FMCTextField.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCTextFieldName.h>
#import <AppLink/FMCCharacterSet.h>

@interface FMCTextField : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCTextFieldName* name;
@property(strong) FMCCharacterSet* characterSet;
@property(strong) NSNumber* width;
@property(strong) NSNumber* rows;

@end
