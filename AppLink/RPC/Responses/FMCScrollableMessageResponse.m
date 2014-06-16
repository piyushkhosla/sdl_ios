//  FMCScrollableMessageResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Responses/FMCScrollableMessageResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCScrollableMessageResponse

-(id) init {
    if (self = [super initWithName:NAMES_ScrollableMessage]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
