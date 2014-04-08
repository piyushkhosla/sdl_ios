//  FMCPermissionItem.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCHMIPermissions.h>
#import <AppLink/FMCParameterPermissions.h>

@interface FMCPermissionItem : FMCRPCStruct {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) NSString* rpcName;
@property(assign) FMCHMIPermissions* hmiPermissions;
@property(assign) FMCParameterPermissions* parameterPermissions;

@end
