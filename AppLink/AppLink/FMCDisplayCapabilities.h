//  FMCDisplayCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCDisplayType.h>
#import <AppLink/FMCScreenParams.h>

@interface FMCDisplayCapabilities : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCDisplayType* displayType;
@property(strong) NSMutableArray* textFields;
@property(strong) NSMutableArray* imageFields;
@property(strong) NSMutableArray* mediaClockFormats;
@property(strong) NSNumber* graphicSupported;
@property(strong) NSMutableArray* templatesAvailable;
@property(strong) FMCScreenParams* screenParams;
@property(strong) NSNumber* numCustomPresetsAvailable;

@end
