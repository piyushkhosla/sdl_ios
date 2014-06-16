//  FMCUnregisterAppInterface.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Requests/FMCUnregisterAppInterface.h>

#import <AppLink/FMCNames.h>

@implementation FMCUnregisterAppInterface

-(id) init {
    if (self = [super initWithName:NAMES_UnregisterAppInterface]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
