//  FMCUpdateTurnListResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Responses/FMCUpdateTurnListResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCUpdateTurnListResponse

-(id) init {
    if (self = [super initWithName:NAMES_UpdateTurnList]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
