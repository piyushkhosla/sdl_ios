//
//  FMCRequestType.h
//  AppLink
//
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

@interface FMCRequestType : FMCEnum

+ (NSMutableArray*)values;
+ (FMCRequestType*)valueOf:(NSString*) value;
+ (FMCRequestType*)HTTP;
+ (FMCRequestType*)FILE_RESUME;
+ (FMCRequestType*)AUTH_REQUEST;
+ (FMCRequestType*)AUTH_CHALLENGE;
+ (FMCRequestType*)AUTH_ACK;

@end

