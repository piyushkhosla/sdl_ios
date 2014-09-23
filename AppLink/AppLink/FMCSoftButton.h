//  FMCSoftButton.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCSoftButtonType.h>
#import <AppLink/FMCImage.h>
#import <AppLink/FMCSystemAction.h>

@interface FMCSoftButton : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCSoftButtonType* type;
@property(strong) NSString* text;
@property(strong) FMCImage* image;
@property(strong) NSNumber* isHighlighted;
@property(strong) NSNumber* softButtonID;
@property(strong) FMCSystemAction* systemAction;

@end
