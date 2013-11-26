//  FMCAlertManeuverResponse.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCAlertManeuverResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCAlertManeuverResponse

-(id) init {
    if (self = [super initWithName:NAMES_AlertManeuver]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
