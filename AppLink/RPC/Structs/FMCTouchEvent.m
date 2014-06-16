//  FMCTouchEvent.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Structs/FMCTouchEvent.h>

#import <AppLink/FMCNames.h>
#import <AppLink/RPC/Structs/FMCTouchCoord.h>

@implementation FMCTouchEvent

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setTouchEventId:(NSNumber*) touchEventId {
    if (touchEventId != nil) {
        [store setObject:touchEventId forKey:NAMES_id];
    } else {
        [store removeObjectForKey:NAMES_id];
    }
}

-(NSNumber*) touchEventId {
    return [store objectForKey:NAMES_id];
}

-(void) setTimeStamp:(NSMutableArray*) timeStamp {
    if (timeStamp != nil) {
        [store setObject:timeStamp forKey:NAMES_ts];
    } else {
        [store removeObjectForKey:NAMES_ts];
    }
}

-(NSMutableArray*) timeStamp {
    return [store objectForKey:NAMES_ts];
}

-(void) setCoord:(NSMutableArray*) coord {
    if (coord != nil) {
        [store setObject:coord forKey:NAMES_c];
    } else {
        [store removeObjectForKey:NAMES_c];
    }
}

-(NSMutableArray*) coord {
    NSMutableArray* array = [store objectForKey:NAMES_c];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCTouchCoord.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCTouchCoord alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

@end
