//  FMCEndAudioPassThruResponse.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCEndAudioPassThruResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCEndAudioPassThruResponse

-(id) init {
    if (self = [super initWithName:NAMES_EndAudioPassThru]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
