//  FMCChangeRegistration.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCLanguage.h>

@interface FMCChangeRegistration : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCLanguage* language;
@property(strong) FMCLanguage* hmiDisplayLanguage;

@end
