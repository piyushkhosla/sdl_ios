//  FMCSpeakResponse.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSpeakResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCSpeakResponse

-(id) init {
    if (self = [super initWithName:NAMES_Speak]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
