//  FMCTouchEventCapabilities.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCTouchEventCapabilities.h>
#import <AppLink/FMCNames.h>

@implementation FMCTouchEventCapabilities

- (void)setPressAvailable:(NSNumber*)value
{
    if (value != nil)
    {
        [store setObject:value forKey:NAMES_pressAvailable];
    }
    else
    {
        [store removeObjectForKey:NAMES_pressAvailable];
    }
}

- (NSNumber*)pressAvailable
{
    return [store objectForKey:NAMES_pressAvailable];
}

- (void)setMultiTouchAvailable:(NSNumber*)value
{
    if (value != nil)
    {
        [store setObject:value forKey:NAMES_multiTouchAvailable];
    }
    else
    {
        [store removeObjectForKey:NAMES_multiTouchAvailable];
    }
}

- (NSNumber*)multiTouchAvailable
{
    return [store objectForKey:NAMES_multiTouchAvailable];
}

- (void)setDoublePressAvailable:(NSNumber*)value
{
    if (value != nil)
    {
        [store setObject:value forKey:NAMES_doublePressAvailable];
    }
    else
    {
        [store removeObjectForKey:NAMES_doublePressAvailable];
    }
}

- (NSNumber*)doublePressAvailable
{
    return [store objectForKey:NAMES_doublePressAvailable];
}

@end
