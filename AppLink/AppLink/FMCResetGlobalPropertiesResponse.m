//  FMCResetGlobalPropertiesResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCResetGlobalPropertiesResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCResetGlobalPropertiesResponse

-(id) init {
    if (self = [super initWithName:NAMES_ResetGlobalProperties]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
