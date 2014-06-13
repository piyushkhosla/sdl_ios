//  FMCRequestType.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCRequestType : FMCEnum {}

+(FMCRequestType*) valueOf:(NSString*) value;
+(NSMutableArray*) values;

+(FMCRequestType*) HTTP;
+(FMCRequestType*) FILE_RESUME;
+(FMCRequestType*) AUTH_REQUEST;
+(FMCRequestType*) AUTH_CHALLENGE;
+(FMCRequestType*) AUTH_ACK;
+(FMCRequestType*) PROPRIETARY;

@end
