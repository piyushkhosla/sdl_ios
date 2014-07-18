//  FMCDeleteInteractionChoiceSet.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCDeleteInteractionChoiceSet.h>

#import <AppLink/FMCNames.h>

@implementation FMCDeleteInteractionChoiceSet

-(id) init {
    if (self = [super initWithName:NAMES_DeleteInteractionChoiceSet]) {}
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

@end
