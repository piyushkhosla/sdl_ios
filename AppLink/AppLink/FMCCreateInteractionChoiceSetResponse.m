//  FMCCreateInteractionChoiceSetResponse.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCCreateInteractionChoiceSetResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCCreateInteractionChoiceSetResponse

-(id) init {
    if (self = [super initWithName:NAMES_CreateInteractionChoiceSet]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
