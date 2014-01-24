//  FMCOnEncodedSyncPData.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCOnEncodedSyncPData.h>

#import <AppLink/FMCNames.h>

@implementation FMCOnEncodedSyncPData

-(id) init {
    if (self = [super initWithName:NAMES_OnEncodedSyncPData]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setData:(NSMutableArray*) data {
    if (data != nil) {
        [parameters setObject:data forKey:NAMES_data];
    } else {
        [parameters removeObjectForKey:NAMES_data];
    }
}

-(NSMutableArray*) data {
    NSMutableArray* obj = [parameters objectForKey:NAMES_data];
	return (NSMutableArray*)obj;
}

-(void) setUrl:(NSString *)url {
    if (url != nil) {
        [parameters setObject:url forKey:NAMES_URL];
    } else {
        [parameters removeObjectForKey:NAMES_URL];
    }
}

-(NSString*)url {
    return [parameters objectForKey:NAMES_URL];
}

-(void) setTimeout:(NSNumber*) timeout {
    if (timeout != nil) {
        [parameters setObject:timeout forKey:NAMES_timeout];
    } else {
        [parameters removeObjectForKey:NAMES_timeout];
    }
}

-(NSNumber*) timeout {
    return [parameters objectForKey:NAMES_timeout];
}

@end
