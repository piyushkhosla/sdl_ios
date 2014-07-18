//  FMCDeleteFile.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCDeleteFile.h>

#import <AppLink/FMCNames.h>

@implementation FMCDeleteFile

-(id) init {
    if (self = [super initWithName:NAMES_DeleteFile]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setSyncFileName:(NSString*) syncFileName {
    if (syncFileName != nil) {
        [parameters setObject:syncFileName forKey:NAMES_syncFileName];
    } else {
        [parameters removeObjectForKey:NAMES_syncFileName];
    }
}

-(NSString*) syncFileName {
    return [parameters objectForKey:NAMES_syncFileName];
}

@end
