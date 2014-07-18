//  FMCImageField.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCImageFieldName.h>
#import <AppLink/FMCImageResolution.h>

@interface FMCImageField : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCImageFieldName* name;
@property(assign) NSMutableArray* imageTypeSupported;
@property(assign) FMCImageResolution* imageResolution;

@end
