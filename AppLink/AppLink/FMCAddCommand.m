//  FMCAddCommand.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCAddCommand.h>

#import <AppLink/FMCNames.h>

@implementation FMCAddCommand

-(id) init {
    if (self = [super initWithName:NAMES_AddCommand]) {}
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

-(void) setMenuParams:(FMCMenuParams*) menuParams {
    if (menuParams != nil) {
        [parameters setObject:menuParams forKey:NAMES_menuParams];
    } else {
        [parameters removeObjectForKey:NAMES_menuParams];
    }
}

-(FMCMenuParams*) menuParams {
    NSObject* obj = [parameters objectForKey:NAMES_menuParams];
    if ([obj isKindOfClass:FMCMenuParams.class]) {
        return (FMCMenuParams*)obj;
    } else {
        return [[FMCMenuParams alloc] initWithDictionary:(NSMutableDictionary*)obj];
    }
}

-(void) setVrCommands:(NSMutableArray*) vrCommands {
    if (vrCommands != nil) {
        [parameters setObject:vrCommands forKey:NAMES_vrCommands];
    } else {
        [parameters removeObjectForKey:NAMES_vrCommands];
    }
}

-(NSMutableArray*) vrCommands {
    return [parameters objectForKey:NAMES_vrCommands];
}

-(void) setCmdIcon:(FMCImage*) cmdIcon {
    if (cmdIcon != nil) {
        [parameters setObject:cmdIcon forKey:NAMES_cmdIcon];
    } else {
        [parameters removeObjectForKey:NAMES_cmdIcon];
    }
}

-(FMCImage*) cmdIcon {
    NSObject* obj = [parameters objectForKey:NAMES_cmdIcon];
    if ([obj isKindOfClass:FMCImage.class]) {
        return (FMCImage*)obj;
    } else {
        return [[FMCImage alloc] initWithDictionary:(NSMutableDictionary*)obj];
    }
}

@end
