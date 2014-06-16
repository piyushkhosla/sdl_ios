//  FMCShowConstantTBTResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Responses/FMCShowConstantTBTResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCShowConstantTBTResponse

-(id) init {
    if (self = [super initWithName:NAMES_ShowConstantTBT]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
