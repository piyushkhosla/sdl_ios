//  FMCOnAppInterfaceUnregistered.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Notifications/FMCOnAppInterfaceUnregistered.h>

#import <AppLink/FMCNames.h>

@implementation FMCOnAppInterfaceUnregistered

-(id) init {
    if (self = [super initWithName:NAMES_OnAppInterfaceUnregistered]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setReason:(FMCAppInterfaceUnregisteredReason*) reason {
    if (reason != nil) {
        [parameters setObject:reason forKey:NAMES_reason];
    } else {
        [parameters removeObjectForKey:NAMES_reason];
    }
}

-(FMCAppInterfaceUnregisteredReason*) reason {
    NSObject* obj = [parameters objectForKey:NAMES_reason];
    if ([obj isKindOfClass:FMCAppInterfaceUnregisteredReason.class]) {
        return (FMCAppInterfaceUnregisteredReason*)obj;
    } else {
        return [FMCAppInterfaceUnregisteredReason valueOf:(NSString*)obj];
    }
}

@end
