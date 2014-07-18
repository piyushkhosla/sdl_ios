//  FMCSubscribeButtonResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSubscribeButtonResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCSubscribeButtonResponse

-(id) init {
    if (self = [super initWithName:NAMES_SubscribeButton]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
