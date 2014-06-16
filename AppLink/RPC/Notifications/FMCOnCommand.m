//  FMCOnCommand.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Notifications/FMCOnCommand.h>

#import <AppLink/FMCNames.h>

@implementation FMCOnCommand

-(id) init {
    if (self = [super initWithName:NAMES_OnCommand]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setCmdID:(NSNumber*) cmdID {
    if (cmdID != nil) {
        [parameters setObject:cmdID forKey:NAMES_cmdID];
    } else {
        [parameters removeObjectForKey:NAMES_cmdID];
    }
}

-(NSNumber*) cmdID {
    return [parameters objectForKey:NAMES_cmdID];
}

-(void) setTriggerSource:(FMCTriggerSource*) triggerSource {
    if (triggerSource != nil) {
        [parameters setObject:triggerSource forKey:NAMES_triggerSource];
    } else {
        [parameters removeObjectForKey:NAMES_triggerSource];
    }
}

-(FMCTriggerSource*) triggerSource {
    NSObject* obj = [parameters objectForKey:NAMES_triggerSource];
    if ([obj isKindOfClass:FMCTriggerSource.class]) {
        return (FMCTriggerSource*)obj;
    } else {
        return [FMCTriggerSource valueOf:(NSString*)obj];
    }
}

@end
