//  FMCDeleteFileResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCDeleteFileResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCDeleteFileResponse

-(id) init {
    if (self = [super initWithName:NAMES_DeleteFile]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setSpaceAvailable:(NSNumber*) spaceAvailable {
    if (spaceAvailable != nil) {
        [parameters setObject:spaceAvailable forKey:NAMES_spaceAvailable];
    } else {
        [parameters removeObjectForKey:NAMES_spaceAvailable];
    }
}

-(NSNumber*) spaceAvailable {
    return [parameters objectForKey:NAMES_spaceAvailable];
}

@end
