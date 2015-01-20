//  SDLParameterPermissions.m
//
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <SmartDeviceLink/SDLParameterPermissions.h>

#import <SmartDeviceLink/SDLNames.h>

@implementation SDLParameterPermissions

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setAllowed:(NSMutableArray*) allowed {
    [store setOrRemoveObject:allowed forKey:NAMES_allowed];
}

-(NSMutableArray*) allowed {
    return [store objectForKey:NAMES_allowed];
}

-(void) setUserDisallowed:(NSMutableArray*) userDisallowed {
    [store setOrRemoveObject:userDisallowed forKey:NAMES_userDisallowed];
}

-(NSMutableArray*) userDisallowed {
    return [store objectForKey:NAMES_userDisallowed];
}

@end