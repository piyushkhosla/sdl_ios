//  FMCSubscribeButtonResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Sub scribeButton Response is sent, when FMCSubscribeButton has been called
 *
 * Since AppLink 1.0
 */
@interface FMCSubscribeButtonResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCSubscribeButtonResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCSubscribeButtonResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
