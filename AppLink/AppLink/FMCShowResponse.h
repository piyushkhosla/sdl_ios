//  FMCShowResponse.h
//  SyncProxy
//  Copyright (c) 2014 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Show Response is sent, when Show has been called
 *
 * Since AppLink 1.0
 */
@interface FMCShowResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCShowResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCShowResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
