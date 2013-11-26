//  FMCEncodedSyncPDataResponse.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCEncodedSyncPDataResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCEncodedSyncPDataResponse

-(id) init {
    if (self = [super initWithName:NAMES_EncodedSyncPData]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
