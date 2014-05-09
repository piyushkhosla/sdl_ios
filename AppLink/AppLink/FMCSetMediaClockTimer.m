//  FMCSetMediaClockTimer.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSetMediaClockTimer.h>

#import <AppLink/FMCNames.h>

@implementation FMCSetMediaClockTimer

-(id) init {
    if (self = [super initWithName:NAMES_SetMediaClockTimer]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setStartTime:(FMCStartTime*) startTime {
    if (startTime != nil) {
        [parameters setObject:startTime forKey:NAMES_startTime];
    } else {
        [parameters removeObjectForKey:NAMES_startTime];
    }
}

-(FMCStartTime*) startTime {
    NSObject* obj = [parameters objectForKey:NAMES_startTime];
    if ([obj isKindOfClass:FMCStartTime.class]) {
        return (FMCStartTime*)obj;
    } else {
        return [[[FMCStartTime alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setUpdateMode:(FMCUpdateMode*) updateMode {
    if (updateMode != nil) {
        [parameters setObject:updateMode forKey:NAMES_updateMode];
    } else {
        [parameters removeObjectForKey:NAMES_updateMode];
    }
}

-(FMCUpdateMode*) updateMode {
    NSObject* obj = [parameters objectForKey:NAMES_updateMode];
    if ([obj isKindOfClass:FMCUpdateMode.class]) {
        return (FMCUpdateMode*)obj;
    } else {
        return [FMCUpdateMode valueOf:(NSString*)obj];
    }
}

@end
