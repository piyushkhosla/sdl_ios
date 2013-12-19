//  FMCSetDisplayLayoutResponse.h
//  SyncProxy
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.

#import <Foundation/Foundation.h>
#import <AppLink/FMCRPCResponse.h>

/**
 * Set Display Layout Response is sent, when SetDisplayLayout has been called
 *
 * Since AppLink 2.0
 */
@interface FMCSetDisplayLayoutResponse : FMCRPCResponse {}

/**
 * @abstract Constructs a new FMCSetDisplayLayoutResponse object
 */
-(id) init;
/**
 * @abstract Constructs a new FMCSetDisplayLayoutResponse object indicated by the NSMutableDictionary
 * parameter
 * @param dict The NSMutableDictionary to use
 */
-(id) initWithDictionary:(NSMutableDictionary*) dict;

@end
