//  FMCOnSystemRequest.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/RPC/Enums/FMCRequestType.h>
#import <AppLink/RPC/Enums/FMCFileType.h>

@interface FMCOnSystemRequest : FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCRequestType* requestType;
@property(assign) NSString* url;
@property(assign) NSNumber* timeout;
@property(assign) FMCFileType* fileType;
@property(assign) NSNumber* offset;
@property(assign) NSNumber* length;

@end
