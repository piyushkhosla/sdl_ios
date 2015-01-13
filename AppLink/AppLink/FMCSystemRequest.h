//  FMCSystemRequest.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCRequest.h>

#import <AppLink/FMCRequestType.h>
/** An asynchronous request from the device; binary data can be included in hybrid part of message for some requests<br> (such as HTTP, Proprietary, or Authentication requests)
 * <p>
 * @Since AppLink 3.0
 *
 */

@interface FMCSystemRequest : FMCRPCRequest {}

-(id) init;
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) FMCRequestType* requestType;
@property(strong) NSString* fileName;

@end
