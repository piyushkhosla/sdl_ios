//  FMCShowResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCShowResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCShowResponse

-(id) init {
    if (self = [super initWithName:NAMES_Show]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
