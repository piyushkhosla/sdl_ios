//  FMCPermissionItem.m
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <AppLink/RPC/Structs/FMCPermissionItem.h>

#import <AppLink/FMCNames.h>

@implementation FMCPermissionItem

-(id) init {
    if (self = [super init]) {}
    return self;
}

-(id) initWithDictionary:(NSMutableDictionary*) dict {
    if (self = [super initWithDictionary:dict]) {}
    return self;
}

-(void) setRpcName:(NSString*) rpcName {
    if (rpcName != nil) {
        [store setObject:rpcName forKey:NAMES_rpcName];
    } else {
        [store removeObjectForKey:NAMES_rpcName];
    }
}

-(NSString*) rpcName {
    return [store objectForKey:NAMES_rpcName];
}

-(void) setHmiPermissions:(FMCHMIPermissions*) hmiPermissions {
    if (hmiPermissions != nil) {
        [store setObject:hmiPermissions forKey:NAMES_hmiPermissions];
    } else {
        [store removeObjectForKey:NAMES_hmiPermissions];
    }
}

-(FMCHMIPermissions*) hmiPermissions {
    NSObject* obj = [store objectForKey:NAMES_hmiPermissions];
    if ([obj isKindOfClass:FMCHMIPermissions.class]) {
        return (FMCHMIPermissions*)obj;
    } else {
        return [[[FMCHMIPermissions alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

-(void) setParameterPermissions:(FMCParameterPermissions*) parameterPermissions {
    if (parameterPermissions != nil) {
        [store setObject:parameterPermissions forKey:NAMES_parameterPermissions];
    } else {
        [store removeObjectForKey:NAMES_parameterPermissions];
    }
}

-(FMCParameterPermissions*) parameterPermissions {
    NSObject* obj = [store objectForKey:NAMES_parameterPermissions];
    if ([obj isKindOfClass:FMCParameterPermissions.class]) {
        return (FMCParameterPermissions*)obj;
    } else {
        return [[[FMCParameterPermissions alloc] initWithDictionary:(NSMutableDictionary*)obj] autorelease];
    }
}

@end
