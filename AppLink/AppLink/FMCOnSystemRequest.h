//  FMCOnSystemRequest.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCNotification.h>

#import <AppLink/FMCRequestType.h>
#import <AppLink/FMCFileType.h>

@interface FMCOnSystemRequest : FMCRPCNotification {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCRequestType* requestType;
@property(strong) NSString* url;
@property(strong) NSNumber* timeout;
@property(strong) FMCFileType* fileType;
@property(strong) NSNumber* offset;
@property(strong) NSNumber* length;

@end
