//  FMCOnPermissionsChange.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCOnPermissionsChange.h>

#import <AppLink/FMCNames.h>

@implementation FMCOnPermissionsChange

-(id) init {
    if (self = [super initWithName:NAMES_OnPermissionsChange]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setPermissionItem:(NSMutableArray*) permissionItem {
    if (permissionItem != nil) {
        [parameters setObject:permissionItem forKey:NAMES_PermissionItem];
    } else {
        [parameters removeObjectForKey:NAMES_PermissionItem];
    }
}

-(NSMutableArray*) permissionItem {
    NSMutableArray* array = [parameters objectForKey:NAMES_PermissionItem];
    if ([array count] < 1 || [[array objectAtIndex:0] isKindOfClass:FMCPermissionItem.class]) {
        return array;
    } else {
        NSMutableArray* newList = [NSMutableArray arrayWithCapacity:[array count]];
        for (NSDictionary* dict in array) {
            [newList addObject:[[[FMCPermissionItem alloc] initWithDictionary:(NSMutableDictionary*)dict] autorelease]];
        }
        return newList;
    }
}

@end
