//  FMCOnHMIStatus.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Notifications/FMCOnHMIStatus.h>

#import <AppLink/FMCNames.h>

@implementation FMCOnHMIStatus

-(id) init {
    if (self = [super initWithName:NAMES_OnHMIStatus]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setHmiLevel:(FMCHMILevel*) hmiLevel {
    if (hmiLevel != nil) {
        [parameters setObject:hmiLevel forKey:NAMES_hmiLevel];
    } else {
        [parameters removeObjectForKey:NAMES_hmiLevel];
    }
}

-(FMCHMILevel*) hmiLevel {
    NSObject* obj = [parameters objectForKey:NAMES_hmiLevel];
    if ([obj isKindOfClass:FMCHMILevel.class]) {
        return (FMCHMILevel*)obj;
    } else {
        return [FMCHMILevel valueOf:(NSString*)obj];
    }
}

-(void) setAudioStreamingState:(FMCAudioStreamingState*) audioStreamingState {
    if (audioStreamingState != nil) {
        [parameters setObject:audioStreamingState forKey:NAMES_audioStreamingState];
    } else {
        [parameters removeObjectForKey:NAMES_audioStreamingState];
    }
}

-(FMCAudioStreamingState*) audioStreamingState {
    NSObject* obj = [parameters objectForKey:NAMES_audioStreamingState];
    if ([obj isKindOfClass:FMCAudioStreamingState.class]) {
        return (FMCAudioStreamingState*)obj;
    } else {
        return [FMCAudioStreamingState valueOf:(NSString*)obj];
    }
}

-(void) setSystemContext:(FMCSystemContext*) systemContext {
    if (systemContext != nil) {
        [parameters setObject:systemContext forKey:NAMES_systemContext];
    } else {
        [parameters removeObjectForKey:NAMES_systemContext];
    }
}

-(FMCSystemContext*) systemContext {
    NSObject* obj = [parameters objectForKey:NAMES_systemContext];
    if ([obj isKindOfClass:FMCSystemContext.class]) {
        return (FMCSystemContext*)obj;
    } else {
        return [FMCSystemContext valueOf:(NSString*)obj];
    }
}

@end
