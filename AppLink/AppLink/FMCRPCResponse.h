//  FMCRPCResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCMessage.h>

#import <AppLink/FMCResult.h>

@interface FMCRPCResponse : FMCRPCMessage {}

@property(strong) NSNumber* correlationID;
@property(strong) NSNumber* success;
@property(strong) FMCResult* resultCode;
@property(strong) NSString* info;

@end
