//  FMCSystemRequest.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/RPC/Enums/FMCRequestType.h>

@interface FMCSystemRequest : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(assign) FMCRequestType* requestType;
@property(assign) NSString* fileName;

@end
