//  FMCGenericResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCGenericResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCGenericResponse

-(id) init {
    if (self = [super initWithName:NAMES_GenericResponse]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
