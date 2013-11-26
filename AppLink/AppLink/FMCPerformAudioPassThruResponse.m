//  FMCPerformAudioPassThruResponse.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCPerformAudioPassThruResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCPerformAudioPassThruResponse

-(id) init {
    if (self = [super initWithName:NAMES_PerformAudioPassThru]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
