//  FMCAlertResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Responses/FMCAlertResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCAlertResponse

-(id) init {
    if (self = [super initWithName:NAMES_Alert]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setTryAgainTime:(NSNumber*) tryAgainTime {
    if (tryAgainTime != nil) {
        [parameters setObject:tryAgainTime forKey:NAMES_tryAgainTime];
    } else {
        [parameters removeObjectForKey:NAMES_tryAgainTime];
    }
}

-(NSNumber*) tryAgainTime {
    return [parameters objectForKey:NAMES_tryAgainTime];
}

@end
