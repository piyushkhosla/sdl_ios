//  FMCSyncPData.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSyncPData.h>

#import <AppLink/FMCNames.h>

@implementation FMCSyncPData

-(id) init {
    if (self = [super initWithName:NAMES_SyncPData]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}


@end
