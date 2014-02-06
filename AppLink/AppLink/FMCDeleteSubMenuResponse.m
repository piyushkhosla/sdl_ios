//  FMCDeleteSubMenuResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCDeleteSubMenuResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCDeleteSubMenuResponse

-(id) init {
    if (self = [super initWithName:NAMES_DeleteSubMenu]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end