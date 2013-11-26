//  FMCOnTBTClientState.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCOnTBTClientState.h>

#import <AppLink/FMCNames.h>

@implementation FMCOnTBTClientState

-(id) init {
    if (self = [super initWithName:NAMES_OnTBTClientState]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setState:(FMCTBTState*) state {
    if (state != nil) {
        [parameters setObject:state forKey:NAMES_state];
    } else {
        [parameters removeObjectForKey:NAMES_state];
    }
}

-(FMCTBTState*) state {
    NSObject* obj = [parameters objectForKey:NAMES_state];
    if ([obj isKindOfClass:FMCTBTState.class]) {
        return (FMCTBTState*)obj;
    } else { 
        return [FMCTBTState valueOf:(NSString*)obj];
    }
}

@end
