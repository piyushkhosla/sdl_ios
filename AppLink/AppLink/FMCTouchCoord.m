//  FMCTouchCoord.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCTouchCoord.h>
#import <AppLink/FMCNames.h>

@implementation FMCTouchCoord

- (void)setX:(NSNumber*)value
{
    if (value != nil)
    {
        [store setObject:value forKey:NAMES_touchCoordX];
    }
    else
    {
        [store removeObjectForKey:NAMES_touchCoordX];
    }
}

- (NSNumber*)x
{
    return [store objectForKey:NAMES_touchCoordX];
}

- (void)setY:(NSNumber*)value
{
    if (value != nil)
    {
        [store setObject:value forKey:NAMES_touchCoordY];
    }
    else
    {
        [store removeObjectForKey:NAMES_touchCoordY];
    }
}

- (NSNumber*)y
{
    return [store objectForKey:NAMES_touchCoordY];
}

@end
