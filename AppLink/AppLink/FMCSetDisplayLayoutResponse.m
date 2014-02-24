//  FMCSetDisplayLayoutResponse.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSetDisplayLayoutResponse.h>

#import <AppLink/FMCNames.h>

@implementation FMCSetDisplayLayoutResponse

-(id) init {
    if (self = [super initWithName:NAMES_SetDisplayLayout]) {}
    return self;
}

- (void)setDisplayCapabilities:(FMCDisplayCapabilities*)displayCapabilities
{
    if (displayCapabilities)
    {
        [parameters setObject:displayCapabilities forKey:NAMES_displayCapabilities];
    }
    else
    {
        [parameters removeObjectForKey:NAMES_displayCapabilities];
    }
}

- (FMCDisplayCapabilities*)displayCapabilities
{
    return [parameters objectForKey:NAMES_displayCapabilities];
}

- (void)setButtonCapabilities:(FMCButtonCapabilities*)buttonCapabilities
{
    if (buttonCapabilities)
    {
        [parameters setObject:buttonCapabilities forKey:NAMES_buttonCapabilities];
    }
    else
    {
        [parameters removeObjectForKey:NAMES_buttonCapabilities];
    }
}

- (FMCButtonCapabilities*)buttonCapabilities
{
    return [parameters objectForKey:NAMES_buttonCapabilities];
}

- (void)setSoftButtonCapabilities:(FMCSoftButtonCapabilities*)softButtonCapabilities
{
    if (softButtonCapabilities)
    {
        [parameters setObject:softButtonCapabilities forKey:NAMES_softButtonCapabilities];
    }
    else
    {
        [parameters removeObjectForKey:NAMES_softButtonCapabilities];
    }
}

- (FMCSoftButtonCapabilities*)softButtonCapabilities
{
    return [parameters objectForKey:NAMES_softButtonCapabilities];
}

- (void)setPresetBankCapabilities:(FMCPresetBankCapabilities*)presetBankCapabilities
{
    if (presetBankCapabilities)
    {
        [parameters setObject:presetBankCapabilities forKey:NAMES_presetBankCapabilities];
    }
    else
    {
        [parameters removeObjectForKey:NAMES_presetBankCapabilities];
    }
}

- (FMCPresetBankCapabilities*)presetBankCapabilities
{
    return [parameters objectForKey:NAMES_presetBankCapabilities];
}

@end
