//  FMCTurn.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCTurn.h>

#import <AppLink/FMCNames.h>

@implementation FMCTurn

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setNavigationText:(NSString *) navigationText {
    if (navigationText != nil) {
        [store setObject:navigationText forKey:NAMES_navigationText];
    } else {
        [store removeObjectForKey:NAMES_navigationText];
    }
}

-(NSString*) navigationText {
    return [store objectForKey:NAMES_navigationText];
}

-(void) setTurnIcon:(FMCImage *) turnIcon {
    if (turnIcon != nil) {
        [store setObject:turnIcon forKey:NAMES_turnIcon];
    } else {
        [store removeObjectForKey:NAMES_turnIcon];
    }
}

-(FMCImage*) turnIcon {
    NSObject* obj = [store objectForKey:NAMES_turnIcon];
    if ([obj isKindOfClass:FMCImage.class]) {
        return (FMCImage*)obj;
    } else {
        return [[[FMCImage alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

@end
