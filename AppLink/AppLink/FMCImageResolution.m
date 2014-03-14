//  FMCImageResolution.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCImageResolution.h>
#import <AppLink/FMCNames.h>

@implementation FMCImageResolution

- (void)setResolutionWidth:(NSNumber*)value
{
    if (value)
    {
        [store setObject:value forKey:NAMES_resolutionWidth];
    }
    else
    {
        [store removeObjectForKey:NAMES_resolutionWidth];
    }
}

- (NSNumber*)resolutionWidth
{
    return [store objectForKey:NAMES_resolutionWidth];
}

- (void)setResolutionHeight:(NSNumber*)value
{
    if (value)
    {
        [store setObject:value forKey:NAMES_resolutionHeight];
    }
    else
    {
        [store removeObjectForKey:NAMES_resolutionHeight];
    }
}

- (NSNumber*)resolutionHeight
{
    return [store objectForKey:NAMES_resolutionHeight];
}

@end
