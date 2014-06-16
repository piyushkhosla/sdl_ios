//  FMCDisplayCapabilities.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/RPC/Enums/FMCDisplayType.h>
#import <AppLink/RPC/Enums/FMCScreenParams.h>

@interface FMCDisplayCapabilities : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCDisplayType* displayType;
@property(assign) NSMutableArray* textFields;
@property(assign) NSMutableArray* imageFields;
@property(assign) NSMutableArray* mediaClockFormats;
@property(assign) NSNumber* graphicSupported;
@property(assign) NSMutableArray* templatesAvailable;
@property(assign) FMCScreenParams* screenParams;
@property(assign) NSNumber* numCustomPresetsAvailable;

@end
