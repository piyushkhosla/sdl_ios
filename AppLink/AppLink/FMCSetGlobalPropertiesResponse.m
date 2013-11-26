//  FMCSetGlobalPropertiesResponse.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSetGlobalPropertiesResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCSetGlobalPropertiesResponse

-(id) init {
    if (self = [super initWithName:NAMES_SetGlobalProperties]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
