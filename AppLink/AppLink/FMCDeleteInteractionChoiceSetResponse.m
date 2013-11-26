//  FMCDeleteInteractionChoiceSetResponse.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCDeleteInteractionChoiceSetResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCDeleteInteractionChoiceSetResponse

-(id) init {
    if (self = [super initWithName:NAMES_DeleteInteractionChoiceSet]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
