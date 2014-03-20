//  FMCSystemRequest.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSystemRequest.h>
#import <AppLink/FMCNames.h>

@implementation FMCSystemRequest

-(id) init {
    if (self = [super initWithName:NAMES_SystemRequest]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

- (void)setRequestType:(FMCRequestType*)requestType
{
    if (requestType != nil)
    {
        [parameters setObject:requestType forKey:NAMES_requestType];
    }
    else
    {
        [parameters removeObjectForKey:NAMES_requestType];
    }
}

- (FMCRequestType*)requestType
{
    return (FMCRequestType*)[parameters objectForKey:NAMES_requestType];
}

@end
