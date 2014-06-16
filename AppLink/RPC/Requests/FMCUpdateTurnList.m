//  FMCUpdateTurnList.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Requests/FMCUpdateTurnList.h>

#import <AppLink/FMCNames.h>
#import <AppLink/RPC/Structs/FMCTurn.h>
#import <AppLink/RPC/Structs/FMCSoftButton.h>

@implementation FMCUpdateTurnList

-(id) init {
    if (self = [super initWithName:NAMES_UpdateTurnList]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setTurnList:(NSMutableArray*) turnList {
    if (turnList != nil) {
        [parameters setObject:turnList forKey:NAMES_turnList];
    } else {
        [parameters removeObjectForKey:NAMES_turnList];
    }
}

-(NSMutableArray*) turnList {
    NSMutableArray* array = [parameters objectForKey:NAMES_turnList];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCTurn.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCTurn alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

-(void) setSoftButtons:(NSMutableArray*) softButtons {
    if (softButtons != nil) {
        [parameters setObject:softButtons forKey:NAMES_softButtons];
    } else {
        [parameters removeObjectForKey:NAMES_softButtons];
    }
}

-(NSMutableArray*) softButtons {
    NSMutableArray* array = [parameters objectForKey:NAMES_softButtons];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCSoftButton.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCSoftButton alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

@end
