//  FMCDeleteCommand.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCDeleteCommand.h>

#import <AppLink/FMCNames.h>

@implementation FMCDeleteCommand

-(id) init {
    if (self = [super initWithName:NAMES_DeleteCommand]) {}
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

@end
