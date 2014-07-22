//  FMCChoice.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCImage.h>

@interface FMCChoice : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSNumber* choiceID;
@property(strong) NSString* menuName;
@property(strong) NSMutableArray* vrCommands;
@property(strong) FMCImage* image;
@property(strong) NSString* secondaryText;
@property(strong) NSString* tertiaryText;
@property(strong) FMCImage* secondaryImage;

@end
