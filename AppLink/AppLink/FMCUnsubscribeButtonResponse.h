//  FMCUnsubscribeButtonResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Unsubscribe Button Response is sent, when FMCUnsubscribeButton has been called
 *
 * Since AppLink 1.0
 */
@interface FMCUnsubscribeButtonResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCUnsubscribeButtonResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCUnsubscribeButtonResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
