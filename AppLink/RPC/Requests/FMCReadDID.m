//  FMCReadDID.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Requests/FMCReadDID.h>

#import <AppLink/FMCNames.h>

@implementation FMCReadDID

-(id) init {
    if (self = [super initWithName:NAMES_ReadDID]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setEcuName:(NSNumber*) ecuName {
    if (ecuName != nil) {
        [parameters setObject:ecuName forKey:NAMES_ecuName];
    } else {
        [parameters removeObjectForKey:NAMES_ecuName];
    }
}

-(NSNumber*) ecuName {
    return [parameters objectForKey:NAMES_ecuName];
}

-(void) setDidLocation:(NSMutableArray*) didLocation {
    if (didLocation != nil) {
        [parameters setObject:didLocation forKey:NAMES_didLocation];
    } else {
        [parameters removeObjectForKey:NAMES_didLocation];
    }
}

-(NSMutableArray*) didLocation {
    return [parameters objectForKey:NAMES_didLocation];
}

@end
