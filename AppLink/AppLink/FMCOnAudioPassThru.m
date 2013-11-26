//  FMCOnAudioPassThru.m
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <AppLink/FMCOnAudioPassThru.h>

#import <AppLink/FMCNames.h>

@implementation FMCOnAudioPassThru

-(id) init {
    if (self = [super initWithName:NAMES_OnAudioPassThru]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setBulkData:(NSData *)bulkData {
    if (bulkData != nil) {
        [store setObject:bulkData forKey:NAMES_bulkData];
    } else {
        [store removeObjectForKey:NAMES_bulkData];
    }
}

-(NSData*) bulkData {
    return [store objectForKey:NAMES_bulkData];
}

@end
