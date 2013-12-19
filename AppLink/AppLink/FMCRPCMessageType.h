//  FMCRPCMessageType.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCEnum.h>

/*!
 Declare the RPC Mesage types (request / response / notification)
 */
@interface FMCRPCMessageType : FMCEnum {}

/*!
 @abstract get a FMCRPCMessageType object from value
 @param value NSString
 @result return FMCRPCMessageType
 */
+(FMCRPCMessageType*) valueOf:(NSString*) value;
/*!
 @abstract declare an array to store all possible values of Message Types 
 @result return the array
 */
+(NSMutableArray*) values;

/*!
 @abstract FMCRPCMessageType : request
 @result return the FMCRPCMessageType object with value of <font color=gray><i> request </i></font>
 */
+(FMCRPCMessageType*) request;
/*!
 @abstract FMCRPCMessageType : response
 @result return the FMCRPCMessageType object with value of <font color=gray><i> response </i></font>
 */
+(FMCRPCMessageType*) response;
/*!
 @abstract FMCRPCMessageType : notification
 @result return the FMCRPCMessageType object with value of <font color=gray><i> notification </i></font>
 */
+(FMCRPCMessageType*) notification;

@end
