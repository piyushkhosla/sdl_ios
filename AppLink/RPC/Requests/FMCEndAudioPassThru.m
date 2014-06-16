//  FMCEndAudioPassThru.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Requests/FMCEndAudioPassThru.h>

#import <AppLink/FMCNames.h>

@implementation FMCEndAudioPassThru

-(id) init {
    if (self = [super initWithName:NAMES_EndAudioPassThru]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
