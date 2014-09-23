//  FMCScreenParams.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCScreenParams.h>

#import <AppLink/FMCNames.h>

@implementation FMCScreenParams

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setResolution:(FMCImageResolution*) resolution {
    if (resolution != nil) {
        [store setObject:resolution forKey:NAMES_resolution];
    } else {
        [store removeObjectForKey:NAMES_resolution];
    }
}

-(FMCImageResolution*) resolution {
    NSObject* obj = [store objectForKey:NAMES_resolution];
    if ([obj isKindOfClass:FMCImageResolution.class]) {
        return (FMCImageResolution*)obj;
    } else {
        return [[FMCImageResolution alloc] initWithDictionary:(NSMutableDictionary*)obj];
    }
}

-(void) setTouchEventAvailable:(FMCTouchEventCapabilities*) touchEventAvailable {
    if (touchEventAvailable != nil) {
        [store setObject:touchEventAvailable forKey:NAMES_touchEventAvailable];
    } else {
        [store removeObjectForKey:NAMES_touchEventAvailable];
    }
}

-(FMCTouchEventCapabilities*) touchEventAvailable {
    NSObject* obj = [store objectForKey:NAMES_touchEventAvailable];
    if ([obj isKindOfClass:FMCTouchEventCapabilities.class]) {
        return (FMCTouchEventCapabilities*)obj;
    } else {
        return [[FMCTouchEventCapabilities alloc] initWithDictionary:(NSMutableDictionary*)obj];
    }
}

@end
