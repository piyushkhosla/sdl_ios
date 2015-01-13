//  FMCPutFileResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Put File Response is sent, when FMCPutFile has been called
 *
 * Since AppLink 2.0
 */
@interface FMCPutFileResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCPutFileResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCPutFileResponse object indicated by the NSMutableDictionary parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@property(strong) NSNumber* spaceAvailable;

@end
