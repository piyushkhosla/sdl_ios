//  FMCAddSubMenuResponse.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCAddSubMenuResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCAddSubMenuResponse

-(id) init {
    if (self = [super initWithName:NAMES_AddSubMenu]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
