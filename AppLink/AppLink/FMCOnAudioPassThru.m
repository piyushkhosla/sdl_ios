//  FMCOnAudioPassThru.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCOnAudioPassThru.h>

#import <AppLink/FMCNames.h>

@implementation FMCOnAudioPassThru

-(id) init {
    if (self = [super initWithName:NAMES_OnAudioPassThru]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
