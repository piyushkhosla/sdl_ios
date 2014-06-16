//  FMCButtonCapabilities.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Structs/FMCButtonCapabilities.h>

#import <AppLink/FMCNames.h>

@implementation FMCButtonCapabilities

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setName:(FMCButtonName*) name {
    if (name != nil) {
        [store setObject:name forKey:NAMES_name];
    } else {
        [store removeObjectForKey:NAMES_name];
    }
}

-(FMCButtonName*) name {
    NSObject* obj = [store objectForKey:NAMES_name];
    if ([obj isKindOfClass:FMCButtonName.class]) {
        return (FMCButtonName*)obj;
    } else {
        return [FMCButtonName valueOf:(NSString*)obj];
    }
}

-(void) setShortPressAvailable:(NSNumber*) shortPressAvailable {
    if (shortPressAvailable != nil) {
        [store setObject:shortPressAvailable forKey:NAMES_shortPressAvailable];
    } else {
        [store removeObjectForKey:NAMES_shortPressAvailable];
    }
}

-(NSNumber*) shortPressAvailable {
    return [store objectForKey:NAMES_shortPressAvailable];
}

-(void) setLongPressAvailable:(NSNumber*) longPressAvailable {
    if (longPressAvailable != nil) {
        [store setObject:longPressAvailable forKey:NAMES_longPressAvailable];
    } else {
        [store removeObjectForKey:NAMES_longPressAvailable];
    }
}

-(NSNumber*) longPressAvailable {
    return [store objectForKey:NAMES_longPressAvailable];
}

-(void) setUpDownAvailable:(NSNumber*) upDownAvailable {
    if (upDownAvailable != nil) {
        [store setObject:upDownAvailable forKey:NAMES_upDownAvailable];
    } else {
        [store removeObjectForKey:NAMES_upDownAvailable];
    }
}

-(NSNumber*) upDownAvailable {
    return [store objectForKey:NAMES_upDownAvailable];
}

@end
