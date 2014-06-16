//  FMCPresetBankCapabilities.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Structs/FMCPresetBankCapabilities.h>

#import <AppLink/FMCNames.h>

@implementation FMCPresetBankCapabilities

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setOnScreenPresetsAvailable:(NSNumber*) onScreenPresetsAvailable {
    if (onScreenPresetsAvailable != nil) {
        [store setObject:onScreenPresetsAvailable forKey:NAMES_onScreenPresetsAvailable];
    } else {
        [store removeObjectForKey:NAMES_onScreenPresetsAvailable];
    }
}

-(NSNumber*) onScreenPresetsAvailable {
    return [store objectForKey:NAMES_onScreenPresetsAvailable];
}

@end
