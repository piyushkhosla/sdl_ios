//  FMCSetMediaClockTimerResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSetMediaClockTimerResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCSetMediaClockTimerResponse

-(id) init {
    if (self = [super initWithName:NAMES_SetMediaClockTimer]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
