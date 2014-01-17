//  FMCOnDriverDistraction.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCOnDriverDistraction.h>

#import <AppLink/FMCNames.h>

@implementation FMCOnDriverDistraction

-(id) init {
    if (self = [super initWithName:NAMES_OnDriverDistraction]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setState:(FMCDriverDistractionState*) state {
    if (state != nil) {
        [parameters setObject:state forKey:NAMES_state];
    } else {
        [parameters removeObjectForKey:NAMES_state];
    }
}

-(FMCDriverDistractionState*) state {
    NSObject* obj = [parameters objectForKey:NAMES_state];
    if ([obj isKindOfClass:FMCDriverDistractionState.class]) {
        return (FMCDriverDistractionState*)obj;
    } else { 
        return [FMCDriverDistractionState valueOf:(NSString*)obj];
    }
}

@end
