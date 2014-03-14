//  FMCImageField.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCImageField.h>
#import <AppLink/FMCNames.h>

@implementation FMCImageField

- (void)setName:(FMCImageFieldName*)value
{
    if (value)
    {
        [store setObject:value forKey:NAMES_name];
    }
    else
    {
        [store removeObjectForKey:NAMES_name];
    }
}

- (FMCImageFieldName*)name
{
    return [store objectForKey:NAMES_name];
}

- (void)setImageTypeSupported:(NSMutableArray*)value
{
    if (value)
    {
        [store setObject:value forKey:NAMES_imageTypeSupported];
    }
    else
    {
        [store removeObjectForKey:NAMES_imageTypeSupported];
    }
}

- (NSMutableArray*)imageTypeSupported
{
    return [store objectForKey:NAMES_imageTypeSupported];
}

- (void)setImageResolution:(FMCImageResolution*)value
{
    if (value)
    {
        [store setObject:value forKey:NAMES_imageResolution];
    }
    else
    {
        [store removeObjectForKey:NAMES_imageResolution];
    }
}

- (FMCImageResolution*)imageResolution
{
    return [store objectForKey:NAMES_imageResolution];
}

@end
