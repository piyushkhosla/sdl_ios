//  FMCUnsubscribeButtonResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCUnsubscribeButtonResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCUnsubscribeButtonResponse

-(id) init {
    if (self = [super initWithName:NAMES_UnsubscribeButton]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
