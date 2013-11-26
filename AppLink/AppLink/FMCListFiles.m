//  FMCListFiles.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCListFiles.h>

#import <AppLink/FMCNames.h>

@implementation FMCListFiles

-(id) init {
    if (self = [super initWithName:NAMES_ListFiles]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
