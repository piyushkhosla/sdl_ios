//  FMCSystemRequestResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSystemRequestResponse.h>
#import <AppLink/FMCNames.h>

@implementation FMCSystemRequestResponse

- (id)init
{
    if (self = [super initWithName:NAMES_SystemRequest])
    {

    }
    return self;
}

- (id)initWithDictionary:(NSMutableDictionary*) dict
{
    if (self = [super initWithDictionary:dict])
    {

    }
    return self;
}

@end
