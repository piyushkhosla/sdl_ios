//  FMCOnTouchEvent.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCOnTouchEvent.h>

#import <AppLink/FMCNames.h>
#import <AppLink/FMCTouchEvent.h>

@implementation FMCOnTouchEvent

-(id) init {
    if (self = [super initWithName:NAMES_OnTouchEvent]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setType:(FMCTouchType*) type {
    if (type != nil) {
        [parameters setObject:type forKey:NAMES_type];
    } else {
        [parameters removeObjectForKey:NAMES_type];
    }
}

-(FMCTouchType*) type {
    NSObject* obj = [parameters objectForKey:NAMES_type];
    if ([obj isKindOfClass:FMCTouchType.class]) {
        return (FMCTouchType*)obj;
    } else {
        return [FMCTouchType valueOf:(NSString*)obj];
    }
}

-(void) setEvent:(NSMutableArray*) event {
    if (event != nil) {
        [parameters setObject:event forKey:NAMES_event];
    } else {
        [parameters removeObjectForKey:NAMES_event];
    }
}

-(NSMutableArray*) event {
    NSMutableArray* array = [parameters objectForKey:NAMES_event];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCTouchEvent.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCTouchEvent alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

@end
