//  FMCUnregisterAppInterfaceResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCUnregisterAppInterfaceResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCUnregisterAppInterfaceResponse

-(id) init {
    if (self = [super initWithName:NAMES_UnregisterAppInterface]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

@end
