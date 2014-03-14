//  FMCTouchEvent.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCTouchEvent.h>
#import <AppLink/FMCNames.h>

@implementation FMCTouchEvent

- (void)setTouchEventId:(NSNumber*)value
{
    if (value != nil)
    {
        [store setObject:value forKey:NAMES_touchEventId];
    }
    else
    {
        [store removeObjectForKey:NAMES_touchEventId];
    }
}

- (NSNumber*)touchEventId
{
    return [store objectForKey:NAMES_touchEventId];
}

- (void)setTimestamp:(NSNumber*)value
{
    if (value != nil)
    {
        [store setObject:value forKey:NAMES_touchEventTimestamp];
    }
    else
    {
        [store removeObjectForKey:NAMES_touchEventTimestamp];
    }
}

- (NSNumber*)timestamp
{
    return [store objectForKey:NAMES_touchEventTimestamp];
}

- (void)setCoord:(FMCTouchCoord*)value
{
    if (value != nil)
    {
        [store setObject:value forKey:NAMES_touchEventCoord];
    }
    else
    {
        [store removeObjectForKey:NAMES_touchEventCoord];
    }
}

- (FMCTouchCoord*)coord
{
    return [store objectForKey:NAMES_touchEventCoord];
}

@end
