//  FMCOnKeyboardInput.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCOnKeyboardInput.h>

#import <AppLink/FMCNames.h>

@implementation FMCOnKeyboardInput

-(id) init {
    if (self = [super initWithName:NAMES_OnKeyboardInput]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setEvent:(FMCKeyboardEvent*) event {
    if (event != nil) {
        [parameters setObject:event forKey:NAMES_event];
    } else {
        [parameters removeObjectForKey:NAMES_event];
    }
}

-(FMCKeyboardEvent*) event {
    NSObject* obj = [parameters objectForKey:NAMES_event];
    if ([obj isKindOfClass:FMCKeyboardEvent.class]) {
        return (FMCKeyboardEvent*)obj;
    } else {
        return [FMCKeyboardEvent valueOf:(NSString*)obj];
    }
}

-(void) setData:(NSString*) data {
    if (data != nil) {
        [parameters setObject:data forKey:NAMES_data];
    } else {
        [parameters removeObjectForKey:NAMES_data];
    }
}

-(NSString*) data {
    return [parameters objectForKey:NAMES_data];
}

@end
