//  FMCSingleTireStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSingleTireStatus.h>

#import <AppLink/FMCNames.h>

@implementation FMCSingleTireStatus

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setStatus:(FMCComponentVolumeStatus*) status {
    if (status != nil) {
        [store setObject:status forKey:NAMES_status];
    } else {
        [store removeObjectForKey:NAMES_status];
    }
}

-(NSNumber*) status {
    return [store objectForKey:NAMES_status];
}

@end
