//  FMCSystemRequest.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/FMCSystemRequest.h>

#import <AppLink/FMCNames.h>

@implementation FMCSystemRequest

-(id) init {
    if (self = [super initWithName:NAMES_SystemRequest]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setRequestType:(FMCRequestType*) requestType {
    if (requestType != nil) {
        [parameters setObject:requestType forKey:NAMES_requestType];
    } else {
        [parameters removeObjectForKey:NAMES_requestType];
    }
}

-(FMCRequestType*) requestType {
    NSObject* obj = [parameters objectForKey:NAMES_requestType];
    if ([obj isKindOfClass:FMCRequestType.class]) {
        return (FMCRequestType*)obj;
    } else {
        return [FMCRequestType valueOf:(NSString*)obj];
    }
}

-(void) setFileName:(NSString*) fileName {
    if (fileName != nil) {
        [parameters setObject:fileName forKey:NAMES_fileName];
    } else {
        [parameters removeObjectForKey:NAMES_fileName];
    }
}

-(NSString*) fileName {
    return [parameters objectForKey:NAMES_fileName];
}

@end
