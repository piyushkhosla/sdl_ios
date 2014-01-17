//  FMCSetDisplayLayoutResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSetDisplayLayoutResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCSetDisplayLayoutResponse

-(id) init {
    if (self = [super initWithName:NAMES_SetDisplayLayout]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
