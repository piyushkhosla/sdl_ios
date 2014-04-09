//  FMCHMIPermissions.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCHMIPermissions.h>

#import <AppLink/FMCNames.h>
#import <AppLink/FMCHMILevel.h>

@implementation FMCHMIPermissions

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setAllowed:(NSMutableArray*) allowed {
    if (allowed != nil) {
        [store setObject:allowed forKey:NAMES_allowed];
    } else {
        [store removeObjectForKey:NAMES_allowed];
    }
}

-(NSMutableArray*) allowed {
    NSMutableArray* array = [store objectForKey:NAMES_allowed];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCHMILevel.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSString* enumString in array) {
            [newList addObject:[FMCHMILevel valueOf:enumString]];
        }
        return newList;
    }
}

-(void) setUserDisallowed:(NSMutableArray*) userDisallowed {
    if (userDisallowed != nil) {
        [store setObject:userDisallowed forKey:NAMES_userDisallowed];
    } else {
        [store removeObjectForKey:NAMES_userDisallowed];
    }
}

-(NSMutableArray*) userDisallowed {
    NSMutableArray* array = [store objectForKey:NAMES_userDisallowed];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCHMILevel.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSString* enumString in array) {
            [newList addObject:[FMCHMILevel valueOf:enumString]];
        }
        return newList;
    }
}

@end
