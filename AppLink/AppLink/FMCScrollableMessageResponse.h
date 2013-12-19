//  FMCScrollableMessageResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Scrollable Message Response is sent, when FMCScrollableMessage has been called
 *
 * Since AppLink 2.0
 */
@interface FMCScrollableMessageResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCScrollableMessageResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCScrollableMessageResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
