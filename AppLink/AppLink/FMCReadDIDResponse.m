//  FMCReadDIDResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCReadDIDResponse.h>

#import <AppLink/FMCNames.h>
#import <AppLink/FMCDIDResult.h>

@implementation FMCReadDIDResponse

-(id) init {
    if (self = [super initWithName:NAMES_ReadDID]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setDidResult:(NSMutableArray*) didResult {
    if (didResult != nil) {
        [parameters setObject:didResult forKey:NAMES_didResult];
    } else {
        [parameters removeObjectForKey:NAMES_didResult];
    }
}

-(NSMutableArray*) didResult {
    NSMutableArray* array = [parameters objectForKey:NAMES_didResult];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCDIDResult.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[FMCDIDResult alloc] initWithDictionary:(NSMutableDictionary*)dict]];
        }
        return newList;
    }
}

@end
