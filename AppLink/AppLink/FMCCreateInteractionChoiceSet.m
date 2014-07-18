//  FMCCreateInteractionChoiceSet.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCCreateInteractionChoiceSet.h>

#import <AppLink/FMCNames.h>
#import <AppLink/FMCChoice.h>

@implementation FMCCreateInteractionChoiceSet

-(id) init {
    if (self = [super initWithName:NAMES_CreateInteractionChoiceSet]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setInteractionChoiceSetID:(NSNumber*) interactionChoiceSetID {
    if (interactionChoiceSetID != nil) {
        [parameters setObject:interactionChoiceSetID forKey:NAMES_interactionChoiceSetID];
    } else {
        [parameters removeObjectForKey:NAMES_interactionChoiceSetID];
    }
}

-(NSNumber*) interactionChoiceSetID {
    return [parameters objectForKey:NAMES_interactionChoiceSetID];
}

-(void) setChoiceSet:(NSMutableArray*) choiceSet {
    if (choiceSet != nil) {
        [parameters setObject:choiceSet forKey:NAMES_choiceSet];
    } else {
        [parameters removeObjectForKey:NAMES_choiceSet];
    }
}

-(NSMutableArray*) choiceSet {
    NSMutableArray* array = [parameters objectForKey:NAMES_choiceSet];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCChoice.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCChoice alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

@end
