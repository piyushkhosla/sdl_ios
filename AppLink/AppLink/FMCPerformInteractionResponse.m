//  FMCPerformInteractionResponse.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCPerformInteractionResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCPerformInteractionResponse

-(id) init {
    if (self = [super initWithName:NAMES_PerformInteraction]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setChoiceID:(NSNumber*) choiceID {
    if (choiceID != nil) {
        [parameters setObject:choiceID forKey:NAMES_choiceID];
    } else {
        [parameters removeObjectForKey:NAMES_choiceID];
    }
}

-(NSNumber*) choiceID {
    return [parameters objectForKey:NAMES_choiceID];
}

-(void) setTriggerSource:(FMCTriggerSource*) triggerSource {
    if (triggerSource != nil) {
        [parameters setObject:triggerSource forKey:NAMES_triggerSource];
    } else {
        [parameters removeObjectForKey:NAMES_triggerSource];
    }
}

-(FMCTriggerSource*) triggerSource {
    NSObject* obj = [parameters objectForKey:NAMES_triggerSource];
    if ([obj isKindOfClass:FMCTriggerSource.class]) {
        return (FMCTriggerSource*)obj;
    } else { 
        return [FMCTriggerSource valueOf:(NSString*)obj];
    }
}

@end
